class User < ActiveRecord::Base
  attr_accessible :account_id, :email, :fname, :lname, :phone_number, :password, :password_confirmation, :admin, :address, :city, :state, :zip_code, :super_admin, :active, :customer_stripe_token
  
  belongs_to :account
  has_many :payments

  attr_accessor :password
  before_save :encrypt_password

  before_create { generate_token(:auth_token) }
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip_code
  #validates_presence_of :account_id

  has_many :membershippayments
  has_many :member_payments, :through => :membershippayments

  has_many :userswimteams
  has_many :swim_teams, :through => :userswimteams

  
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
    return self.fname + ' ' + self.lname
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

  def user_address
    user_address = self.address + " " + self.city + ", " + self.state + " " + self.zip_code
    return user_address
  end

  def save_also_to_stripe
    begin
      customer = Stripe::Customer.create(description: user_address, email: email)
      self.customer_stripe_token = customer.id
      save!
    rescue Stripe::InvalidRequestError => e
      logger.error "Stripe error while creating customer: #{e.message}"
      puts "message :: #{e.message}"
      errors.add :base, "There was a problem with your credit card."
      false
    end
  end
end
