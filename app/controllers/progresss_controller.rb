class ProgresssController < ApplicationController


    def add_subtasks
        if Progress.add_sub_task(User.find_by_id(session[:user_id]),subusername =( progress_params[:subUsername] if  progress_params[:subUsername] != nil) , progress_params[:info], progress_params[:subdepartment], progress_params[:ticket_id] )
            if  progress_params[:emergency] == 0
            redirect_to Ticket.find_by_id(progress_params[:ticket_id])
            else
                UserMailer.emergency_task_opened(Ticket.find(progress_params[:ticket_id]),progress_params[:subdepartment]).deliver
                redirect_to Ticket.find_by_id(progress_params[:ticket_id])
            end
        else
          redirect_to Ticket.find_by_id(progress_params[:ticket_id]), :notice => "Something wan't wrong!"
        end
      end

      def assing_task
        if params[:button].split(" ")[2] == "Solved"
         if  Progress.update_solved_status_to_task(params[:button].split(" ")[0].to_i,params[:button].split(" ")[1].to_i)
          redirect_back(fallback_location: tickets_path)
         end
        elsif params[:button].split(" ")[2] == "Reopen"
          if Progress.reopen_task(params[:button].split(" ")[0].to_i,params[:button].split(" ")[1].to_i, progress_params[:reason], User.find(session[:user_id]))
            redirect_back(fallback_location: tickets_path)
          end 
        elsif params[:button].split(" ")[2] == "Delete"
          if Progress.delete_task(params[:button].split(" ")[0].to_i,params[:button].split(" ")[1].to_i, progress_params[:reason], User.find(session[:user_id]))
            redirect_back(fallback_location: tickets_path)
          end
        elsif  params[:button].split(" ")[2] == "noAction"
          Progress.wontFix(params[:button].split(" ")[0].to_i,params[:button].split(" ")[1].to_i, progress_params[:reason], User.find(session[:user_id]))
          redirect_back(fallback_location: tickets_path)
        else
            if Progress.assing_sub_task(params[:button].split(" ")[0].to_i,params[:button].split(" ")[1].to_i, subusername =(if progress_params[:subusername][params[:button][0].to_i] == "" then User.find_by_id(session[:user_id]).username else progress_params[:subusername][params[:button][0].to_i] end ))
              redirect_back(fallback_location: tickets_path)
            else
              redirect_back(fallback_location: tickets_path,  :notice => "Somwthing wan't Wrong")
            end
          end
      end



    private

    def progress_params
        params.require(:progress).permit(:info, :subdepartment, :ticket_id, :emergency, {:subusername =>[]}, :reason )
      end
end