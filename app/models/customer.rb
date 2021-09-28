class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :full_name, presence: true

  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, format: { with: /^(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E]){8,40}$/, multiline: true }, on: :create
  validates :password, presence: true, allow_blank: true, format: { with: /^(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E]){8,40}$/, multiline: true }, on: :update
  
  enum customer_type: [:mearsk, :non_mearsk]

  monetize :hourly_rate_cents

  class << self
    def authenticate(email, password)
      customer = Customer.find_for_authentication(email: email)
      customer.try(:valid_password?, password) ? customer : nil
    end
  end
     
  def reset_password_token_valid!(token)
    if self.reset_password_token == token.to_s and ((Time.now - self.reset_password_sent_at) / 1.minutes) < Rails.application.secrets.reset_password_token_duration
      return true
    else
      return false
    end 
  end
  
end
