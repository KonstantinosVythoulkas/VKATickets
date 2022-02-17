class Progress < ApplicationRecord
  belongs_to :ticket


  def self.add_sub_task(user, subUsername, info, subDepartment, ticket_id)
    if info.gsub(/\s.+/, '') != "" 
      ticket = Ticket.find(ticket_id)
      ticket.progress.tap  do |create_sub_task|
          if subUsername == nil 
              create_sub_task.subusername << "-"
              create_sub_task.status << false
              create_sub_task.statusDesc << ""
          else
              create_sub_task.subusername << subUsername
              create_sub_task.status << false
              create_sub_task.statusDesc << "In Progress"
          end
      create_sub_task.subdepartment << subDepartment
      create_sub_task.info << info
      if create_sub_task.save
        users = User.where(:group => subDepartment)
        users.each do |user_id|
        Ticket.send_notification(user_id, "New Sub Task open for ticket #{ticket.title}", ticket) if user_id.username != user.username
      end
      end
    end
  end
end

  def self.assing_sub_task(task_id, ticket_id, subusername)
    if User.exists?(username: subusername) && User.find_by_username(subusername).group != "User"
    ticket = Ticket.find_by_id(ticket_id)
    ticket.progress.tap do |assing_task|
      assing_task.subusername[task_id] = subusername.gsub(/\s.+/, '')
      assing_task.statusDesc[task_id] = "In Progress"
      assing_task.save
    end
  end
  end

  def self.update_solved_status_to_task(task_id, ticket_id)
    ticket = Ticket.find_by_id(ticket_id)
      ticket.progress.status[task_id] = true
      ticket.progress.statusDesc[task_id] = "Solved"
      ticket.progress.save
  end

  def self.reopen_task(task_id, ticket_id, reason, user)
    ticket = Ticket.find_by_id(ticket_id)
    ticket.progress.status[task_id] = false
    ticket.progress.statusDesc[task_id] = "Reopened"
    ticket.employeeschat.content << reason
    ticket.employeeschat.username << user.username
    ticket.employeeschat.employeeGroup << user.group
    ticket.employeeschat.sendtime << Time.now
   if  ticket.progress.save
        ticket.employeeschat.save
   end
  end

  def self.wontFix(task_id, ticket_id, reason, user)
    ticket = Ticket.find_by_id(ticket_id)
    ticket.progress.status[task_id] = true
    ticket.progress.statusDesc[task_id] = reason + ", Won't Fix"
    ticket.employeeschat.content << "Task: " + ticket.progress.info[task_id] + ". Will be not fixed due to: " + reason  
    ticket.employeeschat.username << user.username
    ticket.employeeschat.employeeGroup << user.group
    ticket.employeeschat.sendtime << Time.now
   if  ticket.progress.save
        ticket.employeeschat.save
   end
  end

  def self.delete_task(task_id, ticket_id, reason, user)
    ticket = Ticket.find_by_id(ticket_id)
    ticket.progress.status.delete_at(task_id)
    ticket.progress.subusername.delete_at(task_id)
    ticket.progress.statusDesc.delete_at(task_id)
    ticket.progress.info.delete_at(task_id)
    ticket.progress.subdepartment.delete_at(task_id)
    ticket.progress.save
  end

end
