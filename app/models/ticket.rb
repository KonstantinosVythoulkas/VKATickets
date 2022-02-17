class Ticket < ApplicationRecord
    validates :content, presence: true
    validates :title, presence: true
    validates :ticketDepartment, presence: true
    has_rich_text :content
    has_many_attached :images
    has_one :comment
    has_one :progress
    has_one :employeeschat
    after_create :create_comment_and_progress_employeeschat_stash, :create_notification_to_the_employeess
    before_create :set_default_values

    def create_comment_and_progress_employeeschat_stash
        self.build_comment.save
        self.build_progress.save
        self.build_employeeschat.save
    end

    def create_notification_to_the_employeess
        get_users = User.where(:group => self.ticketDepartment).ids
        i = 0
        while i <= get_users.length
        Notification.new.tap do |ticket_alert|
            ticket_alert.info = "New ticket just opened!"
            ticket_alert.infoticketid = self.id
            ticket_alert.status = false
            ticket_alert.user_id = i
            ticket_alert.save
            i += 1
        end
    end

    end

    def self.reasing_ticket(assing,ticket,user)
        if assing != ticket.ticketDepartment
            ticket.ticketDepartment = assing 
            if ticket.save
                ticket.watchers.each do |watcher|
                    Ticket.send_notification(User.find_by_username(ticket.user), "Your ticket with title #{ticket.title}, reassigned to: " + assing + " department", ticket) if ticket.user != watcher
                end
            end
        end
    end

    def self.change_status(ticket,status,reason,username)
        ticket.comment.username << "System"
        ticket.comment.content << reason
        ticket.comment.sendtime << Time.now
        if status.split.first == "Close"
            ticket.status = false
            ticket.statusinfo = "Closed"
            if  ticket.save!
                if ticket.comment.save!
                    ticket.watchers.each do |user|
                    UserMailer.status_alert(User.find_by_username(user),reason,ticket,username,"Closed").deliver if username != user
                    Ticket.send_notification(User.find_by_username(user), "Your ticket with title #{ticket.title}, closeed: " + reason, ticket) if username != user
                end
            end
        else
            ticket.status = true
            ticket.save!
        end
        elsif status.split.first == "Reopen"
            ticket.status = true
            ticket.statusinfo = "Reopened"
            if  ticket.save!
                if  ticket.comment.save!
                    ticket.watchers.each do |user|
                        UserMailer.status_alert(User.find_by_username(user),reason,ticket,username,"Reopen").deliver if username != user
                        Ticket.send_notification(User.find_by_username(user), "Your ticket with title #{ticket.title}, reopened: " + reason, ticket) if username != user
                    end
                end
            else
                ticket.status = false
                ticket.save!
        end 
    end
end

    def set_default_values
        self.watchers << user
        self.status = true
    end

    def self.watch_a_ticket(ticket_id,user)
        ticket = Ticket.find_by_id(ticket_id)
        if ticket
            ticket.watchers << user.username
            UserMailer.watch_alert(ticket,user).deliver if ticket.save
        end
    end

    def self.unwatch_a_ticket(ticket_id,user)
        ticket = Ticket.find_by_id(ticket_id)
        if ticket && ticket.user != user.username
            ticket.watchers.delete(user.username)
            UserMailer.unwatch_alert(ticket,user).deliver if ticket.save
        end
    end

    def self.declare_employee_to_ticket(ticket,user)
        ticket.progress.username = user.username
        ticket.progress.department = user.group
        ticket.assign = user.username
        ticket.statusinfo = "In Progress"
        ticket.watchers << user.username
        ticket.progress.save!
        if ticket.save
            ticket.watchers.each do |user_notify|
            Ticket.send_notification(User.find_by_username(user_notify), user.username + " (#{user.group}), " +  "Working on the ticket with title #{ticket.title}", ticket) if user.username != user_notify
            end
        end
    end

    def self.mark_ticket_as_readed(ticket)
        ticket.readed = true
        ticket.save
    end

    def self.send_notification(user_to_infom, notification_content, changed_object)
        Notification.new.tap do |create_notification|
            create_notification.info = notification_content
            create_notification.infoticketid = changed_object.id
            create_notification.status = false
            create_notification.user_id = user_to_infom.id
            create_notification.save
        end
    end

    def self.mark_ticket_as_solved(ticket)
        ticket.status = false
        ticket.statusinfo = "Solved"
        ticket.save
    end

end
