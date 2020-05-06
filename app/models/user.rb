class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :tos
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validations

  validates :username, presence: true, length: { minimum: 3 }
  validates_uniqueness_of :username
end
