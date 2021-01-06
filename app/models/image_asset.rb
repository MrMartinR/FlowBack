class ImageAsset < ApplicationRecord
  #   self.implicit_order_column = 'created_at'

  #   IMAGEASSET_CATEGORY = %w[FLAG ADMIN_ACCOUNT USER_ACCOUNT
  #                            CURRENCY ORIGINATORS ORGANIZATION
  #                            PLATFORM].freeze

  #   scope :by_category, ->(text_category) { where('category = ?', text_category.upcase) if text_category.present? }
  #   scope :by_uid, ->(text_uid) { where('uid = ?', text_uid) if text_uid.present? }

  #   before_validation { self.category = category.upcase }
  #   validates :category, inclusion: { in: IMAGEASSET_CATEGORY }
  #   # before_save :check_category

  #   def check_category
  #     # if not on the list of category, return error
  #     p 'a1'
  #     unless IMAGEASSET_CATEGORY.include?(category.upcase)
  #       p 'a'
  #       errors.add(:category, 'Category did not Match !')
  #     end
  #   end

  #   def self.add_sample_flag
  #     uid_c = Country.order('random()').first.id
  #     create(category: IMAGEASSET_CATEGORY.sample, uid: uid_c, logo: '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
  # <!-- Created with Inkscape (http://www.inkscape.org/) -->
  # ', icn: 'a')
  #   end
end
