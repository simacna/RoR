class WelcomeController < ApplicationController

  # GET -> index
  # POST -> create
  # PATCH/PUT -> update
  # DELETE -> delete	
  def index
  	if(params.has_key?(:id) &&
  		params.has_key?(:random)) 
  		@id = params['id']
  		@random = params[:random]
  	end
  end

  def sample
  	@controller_message = "Hello from sample method"
  end
end
