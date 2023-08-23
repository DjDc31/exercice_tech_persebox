# StripeEvent.configure do |events|
#   StripeEvent.signing_secret = ENV['STRIPE_SIGNING_SECRET']


#   events.subscribe 'charge.succeeded' do |event|
#     # Extraire les données de l'événement
#     stripe_charge = event.data.object
#     user_email = stripe_charge.billing_details.email
#     amount = stripe_charge.amount / 100.0 # Stripe renvoie les montants en centimes

#     # Supposition: L'ID de l'offre est stocké dans la description de la charge.
#     # Si ce n'est pas le cas, vous devrez adapter la logique pour récupérer l'offre associée.
#     offer_id = stripe_charge.description.to_i
#     offer = Offer.find(offer_id)

#     # Trouver l'utilisateur en fonction de l'email
#     user = User.find_by(email: user_email)

#     # Enregistrez le paiement dans votre base de données
#     Payment.create(user: user, offer: offer, amount: amount, status: 'completed')

#     # Envoyez un e-mail de confirmation
#     UserMailer.confirmation_email(user).deliver_now
#   end

#   events.subscribe 'charge.failed' do |event|
#     # Extraire les données de l'événement
#     stripe_charge = event.data.object
#     user_email = stripe_charge.billing_details.email
#     amount = stripe_charge.amount / 100.0 # Stripe renvoie les montants en centimes

#     # Supposition: L'ID de l'offre est stocké dans la description de la charge.
#     # Si ce n'est pas le cas, vous devrez adapter la logique pour récupérer l'offre associée.
#     offer_id = stripe_charge.description.to_i
#     offer = Offer.find(offer_id)

#     # Trouver l'utilisateur en fonction de l'email
#     user = User.find_by(email: user_email)

#     # Enregistrez l'annulation dans votre base de données
#     Payment.create(user: user, offer: offer, amount: amount, status: 'canceled')

#     # Envoyer un email d'échec de paiement à l'utilisateur
#     UserMailer.payment_failed_email(user).deliver_now
#   end
# end
