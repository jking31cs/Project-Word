class Doc < ActiveRecord::Base
    def person=(person)
        self.person_id = person.id
    end
    
    def person
        return Person.find(self.person_id)
    end
    
    def semester=(semester)
        self.semester_id = semester.id
    end

    def semester
        return Semester.find(self.semester_id)
    end

    def type=(type)
        self.type_id = type.id
    end

    def type
        return Type.find(self.type_id)
    end

    def course=(course)
        self.course_id = course.id
    end

   def course
        return Course.find(self.course_id)
   end
end
