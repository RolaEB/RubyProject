class CommentsController < InheritedResources::Base

  private

    def comment_params
      params.require(:comment).permit(:content, :user_id, :lecture_id)
    end
  
  public 
  def create
    @lecture = Lecture.find(params[:lecture_id])
    @comment = @lecture.comments.create(comment_params)
    @comment.user_id=current_user.id
    @comment.save
    redirect_to lecture_path(@lecture)
  end
end

