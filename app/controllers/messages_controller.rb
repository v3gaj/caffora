class MessagesController < ApplicationController
	def new
		@message = Message.new
	end

	def create
		@message = Message.new(message_params)
		respond_to do |format|
			if @message.valid?
			  	MessageMailer.new_message(@message).deliver
			  	format.html { redirect_to contact_path, notice: "Your messages has been sent." }
			  	format.json { render :show, status: :created, location: @message }
			  	format.js   { render :layout => false }
			else
			  	format.html { render :new }
        		format.json { render json: @message.errors, status: :unprocessable_entity }
        		format.js   { render :layout => false }
			end
		end	
	end

	private

	  def message_params
	    params.require(:message).permit(:name, :email, :content)
	  end
end
