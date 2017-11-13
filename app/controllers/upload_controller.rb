class UploadController < ApplicationController

	protect_from_forgery with: :null_session

	def upload_image
	    render :json => FroalaEditorSDK::Image.upload(params, "public/uploads/")
	end

	def delete_image
      	render :json => FroalaEditorSDK::Image.delete(params[:src], "public/uploads")
  	end

  	def upload_file
	    render :json => FroalaEditorSDK::File.upload(params, "public/uploads")
	end

  	def delete_file
	    render :json => FroalaEditorSDK::File.delete(params[:src], "public/uploads")
	end

end
