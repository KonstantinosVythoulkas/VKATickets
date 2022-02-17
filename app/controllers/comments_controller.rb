class CommentsController < ApplicationController

    def reply
      Comment.post_comment(comment_params[:comment],Ticket.find(comment_params[:id]),User.find(session[:user_id]),request.referrer)
    end

    def employee_reply
      Comment.post_comment_employee(comment_params[:content],Ticket.find(comment_params[:id]),User.find(session[:user_id]))
   end


    private
    
    def comment_params
        params.require(:comment).permit(:comment, :id, :content)
      end
end