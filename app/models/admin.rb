class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true
  validates :phone_number, uniqueness: true, presence: true

  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, format: { with: /^(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E]){8,40}$/, multiline: true }, on: :create
  validates :password, presence: true, allow_blank: true, format: { with: /^(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E]){8,40}$/, multiline: true }, on: :update
 
  enum role: [:administrator, :employee]

  has_many :activities, :as=>:assigned_to
  has_many :uploaded_files, :as=>:user
  
  class << self
    def authenticate(email, password)
      admin = Admin.find_for_authentication(email: email)
      admin.try(:valid_password?, password) ? admin : nil
    end
  end
     
  def full_name
    return "#{self.first_name} #{self.last_name}"
  end

  def display_picture_url
    ""
  end
     
  def reset_password_token_valid!(token)
    if self.reset_password_token == token.to_s and ((Time.now - self.reset_password_sent_at) / 1.minutes) < Rails.application.secrets.reset_password_token_duration
      return true
    else
      return false
    end 
  end

end
