class Platform < ApplicationRecord
   has_many :user_platforms
   has_many :loans
   has_many :user_loans
end
