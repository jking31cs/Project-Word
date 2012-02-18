class AttachmentsController < ApplicationController
    def show
        @attachment = Attachment.find(params[:id])
        send_data @attachment.data, :filename => @attachment.filename, :type => @attachment.content_type
    end

    def new
    end

    def index
	@attachments = Attachment.all;
    end

    def create      
        return if params[:attachment].blank?

        @attachment = Attachment.new
        @attachment.uploaded_file = params[:attachment]

        if @attachment.save
            flash[:notice] = "Thank you for your submission..."
            redirect_to :action => "new"
        else
            flash[:error] = "There was a problem submitting your attachment."
            render :action => "new"
        end
    end
end
