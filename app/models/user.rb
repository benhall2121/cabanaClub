class User < ActiveRecord::Base
  attr_accessible :account_id, :email, :fname, :lname, :phone_number, :password, :password_confirmation, :admin, :account_admin
  
  belongs_to :account

  attr_accessor :password
  before_save :encrypt_password

  before_create { generate_token(:auth_token) }
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  scope :reset_token, lambda { |token| where("password_reset_token = ?", token) }

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def full_name
    return self.first_name + ' ' + self.last_name
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    CabanaclubMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.base64.tr("+/", "-_")
    end while User.exists?(column => self[column])
  end
end
