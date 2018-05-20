class LecturesController < InheritedResources::Base

  private

    def lecture_params
      params.require(:lecture).permit(:title, :content, :attachment, :course_id)
    end

  public
  def create
    l=current_user.lectures.new(lecture_params)
    l.save
    redirect_to lectures_path
   end
   
   def upvote 
    @lec = Lecture.find(params[:id])
    @lec.upvote_by current_user
    redirect_back(fallback_location: lectures_path)
  end  

  def downvote
    @lec = Lecture.find(params[:id])
    @lec.downvote_by current_user
    redirect_back(fallback_location: lectures_path)
  end
end

