class User < ApplicationRecord
  rolify
  self.implicit_order_column = "created_at"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # attr_accessor :tos
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

  #extend Devise::Models #added this line to extend devise model
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #
  devise :database_authenticatable, :registerable,:recoverable, :rememberable#, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  # validations
  attr_accessor :country_id, :currency_id

  validates :username, presence: true, length: { minimum: 3 }
  validates_uniqueness_of :username

  after_create :assign_default_role

  def valid_token?(token, client = 'default')
    return false unless tokens[client]
    return true if token_is_current?(token, client)
    return true if token_can_be_reused?(token, client)

    false
  end

  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end
end
