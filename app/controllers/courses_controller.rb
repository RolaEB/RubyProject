class CoursesController < InheritedResources::Base

  private

    def course_params
      params.require(:course).permit(:title, :user_id)
    end
    public 
    def create
     c=current_user.courses.new(course_params)
     c.save
     redirect_to courses_path
    end
end

