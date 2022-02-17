class User < ApplicationRecord
  has_one :settings
  has_one :token
  has_many :notifications
    attr_accessor :password, :old_password, :old_email, :new_email, :email_confirmation

    EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
    validates_format_of :mobile, :allow_blank => true, :with =>  /\d[0-9]\)*\z/ , :message => "Mobile number Doesn't looks legit"
    validates :username, presence: true, uniqueness: true, length: { in: 3..20 }
    validates :email, presence:  true, uniqueness: true, format: EMAIL_REGEX
    validates :password, presence: true
    validates :password, confirmation: true
    validates_length_of :password, in: 6..20
    validate :check_old_password, on: :update, unless: :have_token?
    before_save :encrypt_password
    after_save :clear_password
    after_create :create_settings_and_tokens_for_user


    def self.authenticate(username, password)
        user = find_by_username(username)
        if user
          if user && user.encrypted_password == BCrypt::Engine.hash_secret(password,
            user.salt)
            user
        else
          nil
         end
        end
      end


      def self.reset_forgoten_password(user)
        if user
          user.token
          user.token.password_token = Base64.encode64(SecureRandom.urlsafe_base64(3).to_s)
          user.token.password_time = Time.now + 10.minutes
          user.token.save
          UserMailer.password_restore(user).deliver
        else
          false
        end
      end

      def have_token?
        true if self.token.password_token != nil && self.token.password_time > Time.now
      end


      def self.update_password(user,password,password_confirmation)
        user.password = password
        user.password_confirmation = password_confirmation
        user.update(encrypted_password: password)
        if user.save
          user.token.password_token = nil
          user.token.password_time = nil
          user.token.save
        end
      end
        
     def check_old_password
      user = User.find_by(username: username)
      errors.add(:base, 'Old Password was invalid')  if BCrypt::Engine.hash_secret(old_password, user.salt) != user.encrypted_password
    end

      def create_settings_and_tokens_for_user
        self.build_settings.save
        self.build_token.save
        self.mobileCountryCode = "" if self.mobile = ""
        self.token.update(email_token: SecureRandom.urlsafe_base64.to_s, email_time: Time.now)
        UserMailer.info_mail(self).deliver
      end

      def self.resend_email_activation_link(requested_user)
        user = User.find_by_id(requested_user)
        user.token.update(email_token: SecureRandom.urlsafe_base64.to_s, email_time: Time.now)
        UserMailer.info_mail(user).deliver
      end
        
     def encrypt_password
        if password.present?
          self.salt = BCrypt::Engine.generate_salt
          self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
        end
      end
   
      def clear_password
        self.password = nil
      end
   
       
     def email_activate
      self.settings.email_comfirmed = true
      self.token.email_token = nil
      self.settings.save!(:validate => false)
      self.token.save!(:validate => false)
    end

    def self.get_one_time_code(user)
      user = find_by_email(user)
      user.token.password_token = Base64.encode64(SecureRandom.urlsafe_base64(3).to_s)
      user.token.password_time = Time.now
      user.token.save(:validate => false)
      UserMailer.two_factor_auth_code(user).deliver
end

def self.change_email(user,old_email,new_email,new_email_conf)

=begin
  Error codes depends on the following code results so we can desplay whats wrong to the user
  
  001: Old Email doesn't match with the user current Email
  002: New Email is the same with the user current Email
  003: Email confirmation doesn't match with the new email
  004: Email is not valid Format!
  005: Already used!
=end
  
      case user.settings.email_comfirmed
      when true
  
      if user.email != old_email 
        return 001
      elsif user.email == new_email
        return 002
      elsif !new_email.match(EMAIL_REGEX)
        return 004
      elsif User.find_by_email(new_email) != nil
        return 005
      elsif new_email == new_email_conf
          user.token.update(email_token: SecureRandom.urlsafe_base64.to_s, email_time: Time.now)
          UserMailer.email_change_token(user,new_email).deliver
          user.settings.email_comfirmed = false
          user.email = new_email
          user.settings.save
          user.save(:validate => false)
        else
          return 003
        end
  
      when false
  
        if user.email == new_email
          return 002
        elsif !new_email.match(EMAIL_REGEX)
          return 004
        elsif  User.find_by_email(new_email) != nil
          return 005
        elsif new_email == new_email_conf
          user.token.update(email_token: SecureRandom.urlsafe_base64.to_s, email_time: Time.now)
          UserMailer.email_change_token(user,new_email).deliver
          user.settings.email_comfirmed = false
          user.email = new_email
          user.settings.save
          user.save(:validate => false)
        else
          return  003
        end
      end
    end

    def self.save_mobile_details(user,countryCode,mobile)
      if mobile == ""
        user.mobileCountryCode = ""
        user.mobile = mobile
        user.save(:validate => false)
      else
        user.mobileCountryCode = "+" + countryCode
        user.mobile = mobile
        user.save(:validate => false)
      end
    end

end
