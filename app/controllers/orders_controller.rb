require 'savon'

class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:search_points_relais]

  ## Stripe Checkout Test Session

  # def create_checkout_session
  #   # Remarque : nous n'aurons pas besoin de @offer ni de @product pour un test fixe

  #   @session = Stripe::Checkout::Session.create(
  #     payment_method_types: ['card'],
  #     line_items: [{
  #       price_data: {
  #         currency: 'eur',
  #         product_data: {
  #           name: "Produit Test",
  #         },
  #         unit_amount: 500,
  #       },
  #       quantity: 1,
  #     }],
  #     mode: 'payment',
  #     success_url: url_for(action: 'success', controller: 'orders'),
  #     cancel_url: url_for(action: 'cancel', controller: 'orders')
  #   )

  #   respond_to do |format|
  #     format.json { render json: { id: @session.id } }
  #   end
  # end

  def create_checkout_session
    @offer = Offer.find(params[:offer_id])
    protection = [(@offer.price * 0.035), 0.99].max
    protection = (2.0 * protection).ceil / 2.0 if protection > 0.99
    total_amount = (@offer.price + 8.60 + protection) * 100
    price_in_cents = total_amount.to_i

    image_url = rails_blob_url(@offer.product.images.first)


    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'eur',
          product_data: {
            name: @offer.product.marque + " - " + @offer.product.modele, # Peut-être donner un nom plus descriptif
            images: [image_url]
          },
          unit_amount: price_in_cents, # Utilisez le prix converti en centimes ici
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url: url_for(action: 'success', controller: 'orders'),
      cancel_url: url_for(action: 'cancel', controller: 'orders')
    )

    respond_to do |format|
      format.json { render json: { id: @session.id } }
    end
  end


  def new
    @offer = Offer.find(params[:offer_id])
  end

  def success
    # Exemple : Enregistrez le paiement dans votre base de données.
    Payment.create(user: current_user, offer: @offer, amount: @offer.price, status: 'completed')

    # Envoyez un e-mail de confirmation (assurez-vous d'avoir une méthode pour cela).
    UserMailer.confirmation_email(current_user).deliver_now

    # Redirigez l'utilisateur vers une page de remerciement.
    redirect_to thank_you_path, notice: "Paiement réussi! Merci pour votre achat."
  end


  def cancel
    # Redirigez l'utilisateur vers le panier ou la page de paiement avec un message d'erreur.
    redirect_back(fallback_location: root_path, alert: "Paiement annulé ou échoué. Veuillez réessayer.")
  end

  def search_points_relais
    Rails.logger.debug("Méthode search_points_relais est appelée!")
    @user = current_user
    Rails.logger.debug("User: #{@user.inspect}")
    # Initialiser le client SOAP
    client = Savon.client(wsdl: MondialRelay::BASE_URL + "?WSDL", encoding: "UTF-8")

    params = {
      'Enseigne' => MondialRelay::ENSEIGNE,
      'Pays' => "FR",
      'NumPointRelais' => "",
      'Ville' => @user.city,
      'CP' => @user.postal_code,
      'Latitude' => @user.latitude,
      'Longitude' => @user.longitude,
      'RayonRecherche' => "10",
      'NombreResultats' => "10"
    }

    Rails.logger.debug("User params: #{params.inspect}")


    # Générer le code de sécurité
    params["Security"] = MondialRelay.generate_security_key(params)

    # Faire l'appel SOAP
    begin
      response = client.call(:wsi4_point_relais_recherche, message: params)
    rescue Savon::SOAPFault => e
      flash[:error] = "Une erreur s'est produite lors de la recherche des points relais: #{e.message}"
      redirect_to root_path
      return
    end

    # Gérer la réponse
    Rails.logger.debug(response.body.inspect)

    if response.success?
      response_part_1 = response.body[:wsi4_point_relais_recherche_response]
      Rails.logger.debug("Response Part 1: #{response_part_1.inspect}")

      response_part_2 = response_part_1[:wsi4_point_relais_recherche_result] if response_part_1
      Rails.logger.debug("Response Part 2: #{response_part_2.inspect}")

      response_part_3 = response_part_2[:points_relais] if response_part_2
      Rails.logger.debug("Response Part 3: #{response_part_3.inspect}")

      @points_relais = response_part_3[:point_relais_details] if response_part_3
          else
      flash[:error] = "Une erreur s'est produite lors de la recherche des points relais."
      redirect_to home_path
    end

    render partial: "points_relais_list", locals: { points_relais: @points_relais }

  end


end
