class User < ApplicationRecord
  attr_accessor :remember_token

  validates :name, :email, :lastname, presence: true
  validates :password, length: {minimum: 6}
  validates :email, uniqueness: true

  has_secure_password
  has_many :reviews, dependent: :destroy
  has_many :wishbooks, dependent: :destroy
  has_many :books
  belongs_to :role

  before_save :default_values

  def default_values
    if role_id.nil?
      role = Role.find_by_role_name("user")
    end
  end
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def is_admin?
    role.role_name == 'admin'
  end
end
