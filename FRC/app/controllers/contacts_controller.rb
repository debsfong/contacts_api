class ContactsController < ApplicationController
  def index
    user = User.find_by(id: params[:user_id])
    contacts = user.owned_contacts + user.shared_contacts
    render json: contacts
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    render json: Contact.find_by(id: params[:id])
  end

  def update
    contact = Contact.find_by(id: params[:id])
    if contact.update(contact_params)
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    contact = Contact.find_by(id: params[:id])
    contact.destroy
    render json: contact
  end

  private
  def contact_params
    params[:contact].permit(:name, :email, :user_id)
  end

end
