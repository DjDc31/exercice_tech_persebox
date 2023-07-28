class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def index
    chatrooms = Chatroom.where(user_id: current_user.id).or(Chatroom.where(receiver_id: current_user.id))
    @chatrooms = chatrooms.sort_by { |chatroom| chatroom.messages.any? ? 1 : 0 }
  end


  def create
    @offer = Offer.find(params[:offer_id])
    # Recherche d'une salle de chat existante entre l'utilisateur actuel et le propriétaire de l'offre
    @chatroom = Chatroom.where(user_id: [current_user.id, @offer.user_id],
                               receiver_id: [current_user.id, @offer.user_id],
                               offer_id: @offer.id).first

    # Si aucune salle de chat n'existe, en créer une nouvelle
    unless @chatroom
      @chatroom = Chatroom.create(user_id: current_user.id, receiver_id: @offer.user_id, offer_id: @offer.id)
    end

    # Rediriger l'utilisateur vers l'index des salles de chat
    redirect_to chatrooms_path
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    respond_to do |format|
      format.html
      format.js { render layout: 'no_footer' } # Ajoutez cette ligne
    end
  end

end
