class DocsController < ApplicationController
  def new
     @semesters = Semester.all
     @types = Type.all
  end
  def index
     @semesters = Semester.all
     @types = Type.all
     if (@docs.nil?) 
	@docs = Doc.all
     end
  end
  def search
     query = 'SELECT * from Docs d
     LEFT OUTER JOIN courses c
                  ON d.course_id = c.id
     LEFT OUTER JOIN semesters s
                  ON d.semester_id = c.id
               WHERE 1=1'

     query += '  AND d.title = \'' + params[:title] + '\''
    # if (params[:].blank?) 
    #     query += '  AND d.title = ?'
    # end
     @docs = Doc.find_by_sql(query)
     redirect_to :action => 'index'
  end
  def create      
        return if params[:file].blank?
        @doc = Doc.new
        @doc.data = params[:file].read
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
        if @doc.save
            @doc.save_file
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
