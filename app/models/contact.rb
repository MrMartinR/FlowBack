class Contact < ApplicationRecord
  # self.implicit_order_column = 'trade_name'


  # relation -----------
  # Added dependent: :destroy to contact methods, 
  # so when the contact is deleted their 
  # contact methods will be also delete
  has_many :contact_methods, dependent: :destroy   
  belongs_to :country, optional: true
  belongs_to :user, optional: true
  has_one :account # FIXME optional: true  ???
  has_one :originator # FIXME optional: true  ???
  has_one :platform # FIXME optional: true  ???
end
