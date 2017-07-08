class ContactsController < ApplicationController

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(params[:contact])
		@contact.request = request

		if @contact.deliver
			flash.now[:notice]	= "Message bien envoyé."
			render :new
		else
			flash.now[:error]	= "Nous ne pouvons pas envoyer le message, réessayer."
			render :new
		end
	end


end
