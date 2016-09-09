class ContactsController < ApplicationController
  def index
    # user = params[:]
    user = User.find_by(id: params[:user_id])
    shared_contacts = user.shared_contacts
    user_contacts = user.contacts
    render json: shared_contacts + user_contacts
  end
end
