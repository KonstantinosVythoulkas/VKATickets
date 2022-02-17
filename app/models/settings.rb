class Settings < ApplicationRecord
  belongs_to :user
  
  def self.two_factor_status_switch(user,status)
    if status == "true" && user.settings.email_comfirmed
      user.settings.two_factor = true
      user.settings.save
      return true
    elsif status == "true" && !user.settings.email_comfirmed
      errors.add(:base, 'You need to confirm your email to be able to activate two factor authedication') if !user.settings.email_comfirmed
      return false
    else
      user.settings.two_factor = false
      user.settings.save
      return true
    end
  end

end
