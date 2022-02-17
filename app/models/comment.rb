class Comment < ApplicationRecord
    belongs_to :ticket


    def self.post_comment(new_comment,ticket,user,path)
        puts "HEY ########"
        puts path
        ticket.comment.tap do |post_new_comment|
            post_new_comment.content << new_comment
            post_new_comment.username << user.username
            post_new_comment.sendtime << Time.now
                if post_new_comment.save
                    ActionCable.server.broadcast 'comments_channel', content: [new_comment, user.username, Time.now.strftime("%H:%M:%S"),path]
                    ticket.watchers.each do |watcher|
                        if user.username != watcher 
                    user_notify = Notification.new
                    user_notify.info = "A new comment have been made to your ticket with title #{ticket.title}"
                    user_notify.infoticketid = ticket.id
                    user_notify.user_id = User.find_by_username(watcher).id
                    user_notify.save!
                        end
                    end
                end
        end
    end

    def self.post_comment_employee(new_comment,ticket,user)
        ticket.employeeschat.tap do |post_new_comment_employees|
            post_new_comment_employees.content << new_comment
            post_new_comment_employees.username << user.username
            post_new_comment_employees.employeeGroup << user.group
            post_new_comment_employees.sendtime << Time.now
                if post_new_comment_employees.save
                    ActionCable.server.broadcast 'employeeroom_channel', content: [new_comment, user.username, user.group, Time.now.strftime("%H:%M:%S")]
                end
        end
    end
end
