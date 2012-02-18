class DocsController < ApplicationController
  def new
  end
  def index
  end
  def create      
        return if params[:file].blank?
        @doc = Doc.new
        @doc.data = params[:file].read
        @doc.title = "Testing this"

        if @doc.save
            flash[:notice] = "Thank you for your submission..."
            redirect_to :action => "index"
        else
            flash[:error] = "There was a problem submitting your attachment."
            render :action => "new"
      end
  end
end
