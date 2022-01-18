FactoryBot.define do
  factory :event do
    association :user
    title { 'Событие' }
    description { 'Тестовое' }
    address { 'город N' }
    datetime { DateTime.parse('22.02.2022 02:02') }
  end
end
