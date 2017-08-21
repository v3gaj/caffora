class MessageMailer < ApplicationMailer
	default from: "webcontact@caffora.cafe"
	default to: "info@caffora.cafe"

	def new_message(message)
	@message = message

	mail subject: "Message from #{message.name}"
	end
end
