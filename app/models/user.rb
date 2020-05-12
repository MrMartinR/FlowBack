class User < ApplicationRecord
  rolify
  self.implicit_order_column = "created_at"

  devise :database_authenticatable, :registerable,:recoverable, :rememberable
  include DeviseTokenAuth::Concerns::User
  # validations
  validates :username, presence: true, length: { minimum: 3 }
  validates_uniqueness_of :username

  belongs_to :currency, optional: true
  belongs_to :country, optional: true
  has_one_attached :avatar

  after_create :assign_default_role

  attr_accessor :country_id, :currency_id

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
