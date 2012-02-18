class DocsController < ApplicationController
  def new
     @semesters = Semester.all
     @types = Type.all
  end
  def index
     @docs = Doc.all
  end
  def create      
        return if params[:file].blank?
        @doc = Doc.new
        @doc.data = params[:file].read
        @doc.title = params[:title]
        @doc.semester = Semester.find(params[:semester])
        @doc.prof = params[:prof]
#	course = Course.where(:title => params[:course])
 #       if (course.nil?)
  #           course = Course.new(:title => params[:course])
   #          course.save
    #    end
     #   @doc.course = course
        @doc.type = Type.find(params[:type])
        if @doc.save
            flash[:notice] = "Thank you for your submission..."
            redirect_to :action => "index"
        else
            flash[:error] = "There was a problem submitting your attachment."
            render :action => "new"
      end
  end
  def show
    @doc = Doc.find(params[:id])
    send_data @doc.data, :filename => @doc.title
  end
end
