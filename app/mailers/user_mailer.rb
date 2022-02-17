class UserMailer < ApplicationMailer
    def info_mail(user)
        @user = user
        @greeting = "Hi #{user.username},"
    
        mail to: user.email, subject: "Email Configuretion"
      end
    
      def info_admin_mail(email,group,username,password,confirm_token)
        @greeting = "Hi #{username},"
        @group = group
        @username = username
        @password = password
        @confirm_token = confirm_token
    
        mail to: email, subject: "Email Configuretion"
      end
    
      def pass_update_info(user)
        @user = user
        @greeting = "Hi #{user.username},"
    
        mail to: user.email, subject: "Password Changed"
      end
    
      def two_factor_auth_code(user)
        @user = user
        mail to: @user.email, subject: "Seccond code!"
      end
    
      def password_restore(user)
        @user = user
        mail to: @user.email, subject: "Restore Password"
      end
    
      def progress_warning(user)
        @user = user
        mail to: @user.email, subject: "Ticket status update!"
      end

      def watch_alert(ticket_title,user)
        @user = user
        @ticket_title = ticket_title.title
        mail to: @user.email, subject: "You are now watching #{@ticket_title}"  
      end

      def unwatch_alert(ticket_title,user)
        @user = user
        @ticket_title = ticket_title.title
        mail to: @user.email, subject: "You no loger watching #{@ticket_title}"  
      end

      def status_alert(user,reason,ticket,username,status)
        @watcher = user
        @reason = reason
        @ticket_title = ticket.title
        @user = username
        @status = status

        mail to: @watcher.email, subject: "The ticeket #{@ticket_title} has #{@status}"
      end

      def emergency_task_opened(ticket,department)
        @ticket = ticket
        @department = department

       @users =  User.select(:email).where(group: @department).map(&:email)
       
       if @user == nil
        false
       else
       @users.each do |user_email| 
        mail to: user_email, subject: "Emergency Task just opened!"
       end
      end
    end

      def email_change_token(user,new_email)
        @user = user
        @new_email = new_email
        @greeting = "Hi #{user.username},"

         
        mail to: @user.email, subject: "Email change request"
      end
end
