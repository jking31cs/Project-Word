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

    def self.search(title, semester, prof, course)
        title = title + "%"
        prof = prof + "%"
        if course.nil?
            return Doc.where("title like ? AND prof like ? AND semester_id = ?", title, prof, semester.id).all
        end
        return Doc.where("title like ? AND prof like ? AND course_id = ? AND semester_id = ?", title, prof, course.id, semester.id).all
        
    end

    def save_file(data)
        dir = Dir.getwd
        Dir.chdir("public/files")
        if (!Dir.exists?(self.course.title))
            Dir.mkdir(self.course.title)
        end
        Dir.chdir(self.course.title)
        File.open(self.title + ".pdf", 'wb') { |file|
            file << data
            self.data_path = file.path
        }
        Dir.chdir(dir)
        return self.save
    end

    def data
        dir = Dir.getwd
        Dir.chdir("public/files")
        if (!Dir.exists?(self.course.title))
            Dir.mkdir(self.course.title)
        end
        Dir.chdir(self.course.title)
        File.open(self.title + ".pdf", 'rb') { |file|
            Dir.chdir(dir)
            return file.read
        }
    end
end
