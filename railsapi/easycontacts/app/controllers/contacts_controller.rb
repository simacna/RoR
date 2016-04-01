class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render json: @contacts, status: :ok
  end

  def show
    render json: @contact
  end

  def show
    render json: @contact
  end

  def destroy
    @contact.destroy
    head :no_content
  end

  def update
    if @contact.update(contact_params)
      head :no_content #204
    else
      render json: @contact.errors, status: :unprocessable_entity #422 
    end
  end

  def create
    @contact = Contact.new(params[:contact])

    if @contact.save
      render json: @contact, status: :created
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end
end
