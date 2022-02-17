module TicketsHelper

    def get_username_for_new_ticket
        User.find(session[:user_id]).username
    end

  def assing_list
   groups =  User.where.not(group: ["User"]).distinct.pluck(:group)
    
    content_tag(:select, class: "form-control", id: "assing_menu", name: "ticket[ticketDepartment]") do
        content_tag(:option, label: "Select Department") do
           raw groups.length.times.map { |group| content_tag(:option, value: groups[group]) { groups[group] } }.join
        end
     end
  end

  def reassing_list
    groups =  User.where.not(group: ["User"]).distinct.pluck(:group)
    content_tag(:ul) do 
      raw groups.length.times.map { |group| content_tag(:li, value: groups[group], class: "reassing" ) { groups[group] } }.join
    end
  end


      def ticketStatusButton(status)
        if status
          content_tag(:button, class: "btn btn-sm btn-danger") do
            "Close Ticket"
          end 
        else 
          content_tag(:button, class: "btn btn-sm btn-success") do
            "Reopen Ticket" 
          end
      end
    end
    # f.button 'Watch', value: @ticket.id, class: 'btn btn-secondary', type: 'submit', name: 'id' 
    def create_watch_unwatch_form(watchers)
      if !watchers.include?(User.find(session[:user_id]).username)
      form_tag(controller: "tickets", method: "watch") do
        button_tag(type: 'submit', value: 1, class: 'btn btn-secondary', name: "kostas") do
          content_tag(:strong, 'Ask Me')
        end
      end 
      else
        form_tag(controller: "tickets", method: "unwatch")
    end
  end

  def get_users_for_sub_tasks
    employess = []
    User.all.each do |user| 
      employess <<  user.username + " (" + user.group + ")" #if user.group != "User"
    end 
    return  employess
  end


  def sub_task_progress_bar(status)
    true_array = []
      status.each do |status_value|
        true_array << true if status_value == true
      end
      if status.length == 0
        return 0
      elsif true_array.length == status.length && status.length != 0
        return 100
      else
        return (100 / status.length) *  true_array.length if !(status.length <= 0)
    end
  end

  
  def tasks_full_page_button
    content_tag(:button, class: "btn btn-sm btn-primary", id: "sub_task_page_button") do
        content_tag(:i, class: "bi bi-arrows-fullscreen") do
        end
    end  
end

def search_input
  content_tag(:input, type: "search", id: "search_id", class: "search_id", placeholder: "Type ticket ID", name: "ticket_id") do
  end
end

def search_button
  content_tag(:button, class:"btn btn-sm btn-info", id: "search_button" ) do
    content_tag(:i, class: "bi bi-search") do
    end
  end
end

  def dynamic_index(user,short_by = nil, id = nil, department = nil)
    case user.group
      when "User"
      if short_by == nil
      Ticket.where(:user => user.username) # User can see only his tickets
      elsif  short_by == "01" # New to old
        Ticket.order('created_at DESC',  :user => user)
      elsif short_by == "03" # Solved tickets
        Ticket.where(:status => false,  :user => user)
      elsif short_by == "06" # Search by ID
        Ticket.where(:id => id, :user => user)
      else
        Ticket.where(:user => user.username)
      end
    when "Admin"
      if short_by == nil 
        return Ticket.all.where(:ticketDepartment => department) if department != nil
        Ticket.all # Admins can see all the tickets
        elsif  short_by == "01" # New to old
          return Ticket.order('created_at DESC').where(:ticketDepartment => department) if department != nil
          Ticket.order('created_at DESC')
        elsif short_by == "02" # Unassinged  Tickets
          return Ticket.where(:assign => nil, :ticketDepartment => department) if department != nil
          Ticket.where(:assign => nil)
        elsif short_by == "03" # Solved tickets
          return Ticket.where(:status => false, :ticketDepartment => department) if department != nil
          Ticket.where(:status => false)
        elsif short_by == "04" # In progress
          return Ticket.where(:statusinfo => "In progress", :ticketDepartment => department) if department != nil
          Ticket.where(:statusinfo => "In progress")
        elsif short_by == "05" # Won't Fix
          return Ticket.where(:statusinfo => "Won't fix", :ticketDepartment => department) if department != nil
          Ticket.where(:statusinfo => "Won't fix")
        elsif short_by == "06" # Assigned to me Ticket
          Ticket.where(:assign => user.username)
        elsif short_by == "07" # Search by ID
          Ticket.where(:id => id) 
        else
          return Ticket.all.where(:ticketDepartment => department) if department != nil
          Ticket.all
        end
     else
      if short_by == nil
        Ticket.where(:ticketDepartment => user.group) # Users working for example at "IT" department can see Tickets related only to IT
        elsif  short_by == "01"# New to old
          Ticket.order('created_at DESC').where(:assign => user.group)
        elsif short_by == "02" # Unassinged  Tickets
          Ticket.where(:assign => nil, :ticketDepartment => user.group)
        elsif short_by == "03" # Solved tickets
          Ticket.where(:status => false, :ticketDepartment => user.group)
        elsif short_by == "04" # In progress
          Ticket.where(:statusinfo => "In Progress", :ticketDepartment => user.group)
        elsif short_by == "05" # Won't Fix
          Ticket.where(:statusinfo => "Won't fix", :ticketDepartment => user.group)
        elsif short_by == "06" # Assigned to me Ticket
          Ticket.where(:assign => user.username)
        elsif short_by == "07" && id != nil# Search by ID
          Ticket.where(:id => id, :ticketDepartment => user.group)
        else
          Ticket.where(:ticketDepartment => user.group)
    end
  end
end


def no_tickets_warning_message(tickets,id = nil)
  if tickets.blank? && !id.blank?
    content_tag(:h3, class: "tickets_warning_message") do
      "There is no ticket with ID #{id}"
    end
  elsif tickets.blank? && id.blank?
    content_tag(:h3, class: "tickets_warning_message") do
      "Not available Tickets"
    end
    end
  end

  def readed_notifications
    puts "readed"
  end

end
