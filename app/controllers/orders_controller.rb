class OrdersController < ApplicationController

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

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'eur',
          product_data: {
            name: @offer.product.marque + " - " + @offer.product.modele, # Peut-être donner un nom plus descriptif
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


  # def create_checkout_session
  #   Rails.logger.info "Offer ID: #{params[:offer_id]}"

  #   unless params[:offer_id]
  #     render json: { error: 'Missing Offer ID' }, status: 400 and return
  #   end

  #   @offer = Offer.find_by(id: params[:offer_id])
  #   @product = @offer.product

  #   if @offer.nil?
  #     render json: { error: 'Offer not found' }, status: 404 and return
  #   end

  #   if @product.nil?
  #     render json: { error: 'Product associated with offer not found' }, status: 404 and return
  #   end

  #   # Calculez le montant total
  #   protection = [(@offer.price * 0.035), 0.99].max
  #   protection = (2.0 * protection).ceil / 2.0 if protection > 0.99

  #   total_amount = (@offer.price + 8.60 + protection) * 100

  #   # Log the information for debugging purposes
  #   Rails.logger.info "Creating checkout session for offer #{@offer.id} with total amount #{total_amount}"

  #   begin
  #     @session = Stripe::Checkout::Session.create(
  #       payment_method_types: ['card'],
  #       line_items: [{
  #         price_data: {
  #           currency: 'eur',
  #           product_data: {
  #             name: @offer.product.modele,
  #           },
  #           unit_amount: total_amount.to_i,
  #         },
  #         quantity: 1,
  #       }],
  #       mode: 'payment',
  #       success_url: url_for(action: 'success', controller: 'orders'),
  #       cancel_url: url_for(action: 'cancel', controller: 'orders')
  #     )
  #   rescue Stripe::CardError => e
  #     Rails.logger.error "Stripe CardError: #{e.message}"
  #     # Gérez les erreurs comme vous le souhaitez ici
  #     # Par exemple, renvoyer une réponse d'erreur JSON :
  #     render json: { error: e.message }, status: e.http_status and return
  #   rescue Stripe::RateLimitError => e
  #     Rails.logger.error "Stripe RateLimitError: #{e.message}"
  #     render json: { error: 'Too many requests to Stripe.' }, status: 429 and return
  #   rescue Stripe::InvalidRequestError => e
  #     Rails.logger.error "Stripe InvalidRequestError: #{e.message}"
  #     render json: { error: 'Invalid parameters for Stripe.' }, status: 400 and return
  #   rescue Stripe::AuthenticationError => e
  #     Rails.logger.error "Stripe AuthenticationError: #{e.message}"
  #     render json: { error: 'Authentication with Stripe failed.' }, status: 401 and return
  #   rescue Stripe::APIConnectionError => e
  #     Rails.logger.error "Stripe APIConnectionError: #{e.message}"
  #     render json: { error: 'Connection to Stripe failed.' }, status: 502 and return
  #   rescue Stripe::StripeError => e
  #     Rails.logger.error "General StripeError: #{e.message}"
  #     render json: { error: 'A general error occurred with Stripe.' }, status: 500 and return
  #   rescue => e
  #     Rails.logger.error "Unexpected error: #{e.message}"
  #     render json: { error: 'An unexpected error occurred.' }, status: 500 and return
  #   end

  #   respond_to do |format|
  #     format.json { render json: { id: @session.id } }
  #   end
  # end




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

end
