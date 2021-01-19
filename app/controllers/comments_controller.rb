class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype)
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render "prototypes/show"
    end
  end
  # def create
  #   @room = Room.find(params[:room_id])
  #   @message = @room.messages.new(message_params)
  #   if @message.save
  #     redirect_to room_messages_path(@room)
  #   else
  #     @messages = @room.messages.includes(:user)
  #     render :index
  #   end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
