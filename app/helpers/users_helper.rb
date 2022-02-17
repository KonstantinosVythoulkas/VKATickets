module UsersHelper

  def  UserGroupIsAdmin(user)
    if user.blank?
        false
    else
        true
    end
  end

  def two_factor_status(user)
    if user.settings.two_factor == true
      session[:user_email] = user.email
      send_second_code(user)
    else
      false
    end
  end


  def send_second_code(user)
    User.get_one_time_code(user.email)
    true
  end


    
  def auth_token_check(user_email,second_code)
    user = User.find_by_email(user_email)
    second_code =  Base64.encode64(second_code)
    if user.token.password_token == second_code && user.token.password_time + 3*60  > Time.now
     user.token.password_token
     user.token.password_time
     user.token.save(:validate => false)
     user
  elsif user.token.password_token == second_code && user.token.password_time + 3*60 < Time.now
      user.token.password_token
      user.token.password_time
      user.save(:validate => false)
      false
  elsif user.token.password_token != second_code && user.token.password_time + 3*60 < Time.now
      false
  else
   nil
  end

end

  def email_verifycation_check(user)
    user_email_status = User.find_by_id(user)
      status = user_email_status.settings.email_comfirmed if user_email_status != nil
      if !status
        true
  end
end


=begin def resend_verification_email
content_tag :div, class: "email_warrning" do
  content_tag :h4 do
      content_tag :span, class: "badge badge-danger" do
  content_tag :a do
    content_tag :href do
      link_to "Resend", users_login_path
    end
  end
    end
  end
end
end
=end

def get_user_data
 user = User.find_by_id(session[:user_id])
 if user.settings.two_factor == true
  yield("Enabled")
  "success"
 else
  "danger"
 end
end


def settings_two_factor_status(status = "Disabled")
  if status == false
    "Disabled"
  else
    "Enabled"
  end
end

def resend(user)
  if user.token.password_time + 60*60 < Time.now
    nil
  else
    user.token.password_time = Time.now
    user.token.save(:validate => false)
    UserMailer.two_factor_auth_code(User.find_by_email(user.email)).deliver
  end
end

def status_message(status)
  if status == "Updated!" || status == "Mobile number updated!"
    "success"
  else
    "danger"
  end
end


def in_progress(user,tickets,department)
i = 0
if user.group == "User"
  tickets.each do |ticket|
    if ticket.user == user.username && ticket.statusinfo == "In Progress" && ticket.status != false
      i +=1
    end
  end
  return i

elsif  user.group != "Admin"
  tickets.each do |ticket|
    if ticket.ticketDepartment == user.group && ticket.readed == false && ticket.statusinfo == "In Progress"
      i +=1
    end
  end
  return i

elsif user.group == "Admin" &&   department == nil
  tickets.each do |ticket|
    if ticket.statusinfo == "In Progress" && ticket.status != false
      i +=1
    end
  end
  return i

elsif user.group == "Admin" &&  department != nil
  tickets.each do |ticket|
    if ticket.ticketDepartment == department && ticket.statusinfo == "In Progress" && ticket.status != false
      i +=1
    end
  end
  return i
  end
end


def new_tickets_and_unopened(user,tickets,department)
  i = 0
  if user.group == "User"
   # puts tickets.status
   tickets.each do |ticket|
    if ticket.user == user.username
      i += 1
    end
  end
    return i

  elsif user.group == "Admin" &&  department == nil
    tickets.each do |ticket|
      if ticket.readed == false
        i +=1
      end
    end
    return i

  elsif user.group == "Admin" &&  department != nil
    tickets.each do |ticket|
      if ticket.ticketDepartment == department && ticket.readed == false
        i +=1
      end
    end
    return i

  elsif  user.group != "Admin" 
    tickets.each do |ticket|
      if ticket.ticketDepartment == user.group && ticket.readed == false
        i +=1
      end
    end
    return i
  
  end
end


def wont_fix_tickets(user,tickets,department)
  i = 0
if  user.group == "User" 
  tickets.each do |ticket|
    if ticket.user == user.username && ticket.status == false && ticket.statusinfo == "Won't fix"
      i +=1
    end
  end
  return i

elsif  user.group != "Admin" 
  tickets.each do |ticket|
    if ticket.ticketDepartment == user.group && ticket.status == false && ticket.statusinfo == "Won't fix"
      i +=1
    end
  end
  return i

elsif  user.group == "Admin" &&  department == nil
  tickets.each do |ticket|
    if  ticket.status == false && ticket.statusinfo == "Won't fix"
      i +=1
    end
  end
  return i

elsif  user.group == "Admin" && department != nil
  tickets.each do |ticket|
    if ticket.ticketDepartment == department && ticket.status == false && ticket.statusinfo == "Won't fix"
      i +=1
    end
  end
  return i 

  end
end

def solved_tickets(user,tickets,department)
i = 0
if  user.group == "User"
  tickets.each do |ticket|
    if ticket.user == user.username && ticket.status == false
      i +=1
    end
  end
  return i

elsif  user.group != "Admin"
  tickets.each do |ticket|
    if ticket.ticketDepartment == user.group && ticket.status == false
      i +=1
    end
  end
  return i

elsif user.group == "Admin" && department == nil
  tickets.each do |ticket|
    if ticket.status == false
      i +=1
    end
  end
  return i

elsif user.group == "Admin" && department != nil
  tickets.each do |ticket|
    if ticket.ticketDepartment == department && ticket.status == false
    i += 1
  end
end
return i

  end
end
end

def admin_dropdown_fil
  form_tag(controller: "users", action: "admin_filter") do
    groups =  User.where.not(group: ["User","Admin"]).distinct.pluck(:group)
        raw groups.length.times.map { |group| content_tag(:button, value: groups[group], class: "dropdown-item", name: "user[admin_filter]", id: "admin_filter", onclick: "addrows();" ) { groups[group] } }.join
      end
end


def get_notification(user)
  unreaded = []
  #if user.group != "Admin"
    unreaded << Notification.where(:status => "false", :user_id => user.id ).ids 
  #end
  return unreaded.flatten.length

end

def get_notification_info(user)
  notifications =  Notification.order('created_at DESC').where(:user_id => user.id)
  if notifications.empty?
    return nil
  else
     return notifications
  end

end