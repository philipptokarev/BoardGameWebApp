FactoryBot.define do
  factory :game do
    sequence(:name) { |n| "Game#{n}" }
    sequence(:description) { |n| "Some description#{n}" }
    sequence(:image) { |n| "Image#{n}"}
  end
end
