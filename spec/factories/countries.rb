FactoryBot.define do
  # @rev iso_code is 2 characters and continent is TitleCase from the continent list.
  factory :country do
    name { 'India' }
    iso_code { 'IND' }
    continent { 'asia' }
  end
end