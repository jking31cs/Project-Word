class DocsController < ApplicationController
  def new
     @semesters = Semester.all
     @types = Type.all
  end
  def index
     @semesters = Semester.all
     @types = Type.all
     @docs = session[:docs]
     if (@docs.nil?) 
	@docs = Doc.all
     end
     session[:docs] = Doc.all
  end
  def search
     course = Course.where(:title => params[:course]).first
     semester = Semester.find(params[:semester])
     @docs = Doc.search(params[:title], semester, params[:prof], course)
     session[:docs] = @docs
     redirect_to :action => 'index'
  end
  def create      
        return if params[:file].blank?
        @doc = Doc.new
        @doc.content_type = params[:file].content_type
        @doc.title = params[:title]
        @doc.semester = Semester.find(params[:semester])
        @doc.prof = params[:prof]
	@c = Course.where(:title => params[:course]).first
        if (@c.nil?)
            @c = Course.new(:title => params[:course])
            @c.save
            @c = Course.where(:title => params[:course]).first

	end
        logger.debug "The course is #{@c}"
        @doc.course = @c
        @doc.type = Type.find(params[:type])
        if @doc.save_file(params[:file].read)
            flash[:notice] = "Thank you for your submission..."
            redirect_to :action => "index"
        else
            flash[:error] = "There was a problem submitting your attachment."
            render :action => "new"
      end
  end
  def show
    @doc = Doc.find(params[:id])
    send_data @doc.data, :filename => @doc.title, :type => @doc.content_type
  end
end
