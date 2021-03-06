class User < ActiveRecord::Base

  has_many :characters

  has_many :adventures
  has_many :maps, through: :adventures

  attr_accessor :remember_token

  before_save { self.email = email.downcase }

  validates :username,
  presence: true,
  uniqueness: { case_sensitive: false },
  length: { minimum: 3, maximum: 15 }

  VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,
  presence: true,
  length: { maximum: 105 },
  uniqueness: { case_sensitive: false },
  format: { with: VALID_EMAIL_REGEX }

  has_secure_password

  validates :password, presence: true, length: { minimum: 5 }
  def password_complexity
    if password.present?
       if !password.match(/^(?=.*[a-z])(?=.*[A-Z])/)
         errors.add :password, "Password complexity requirement not met"
       end
    end
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end


  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

end
