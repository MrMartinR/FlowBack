class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # attr_accessor :tos
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

  #extend Devise::Models #added this line to extend devise model
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable#, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  # validations

  validates :username, presence: true, length: { minimum: 3 }
  validates_uniqueness_of :username

  def valid_token?(token, client = 'default')
    return false unless tokens[client]
    return true if token_is_current?(token, client)
    return true if token_can_be_reused?(token, client)

    false
  end
end
