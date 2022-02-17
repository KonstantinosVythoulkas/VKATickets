module ApplicationHelper
    def setUpCookie(department)
        groups =  User.where.not(group: ["User","Admin"]).distinct.pluck(:group)
        if department == "All"
          nil
        elsif department == nil && cookies[:department] != nil
          cookies[:department]
        elsif groups.include?(department)
          cookies[:department] = { value: department, expires: Time.now + 1.hour }
          cookies[:department]
        else
          nil
        end
      end

      def count_notifications
        @notifications = Notification.where(user_id: session[:user_id]).unread
        @notifications.count
      end

      def setUpPasswordResetCookie(token)
        cookies[:token] = { value:  Base64.encode64(token), expires: Time.now + 10.minutes}
      end
end
