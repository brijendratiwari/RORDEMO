class CommentsController < ApplicationController

  def index
    @comments = Comment.all
    end

  def create
   @comments = Comment.create(comment_params)
    if @comments.save
      @return_data = Hash.new
      @return_data['status'] = true
      render :json => @return_data

    else
      @return_data = Hash.new
      @return_data['status'] = false
      render :json => @return_data
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:comments, :task_id, :users_id)
  end

end
