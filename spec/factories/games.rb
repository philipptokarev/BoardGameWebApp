FactoryBot.define do
  factory :game do
    sequence(:name) { |n| "BoardGameName#{n}" }
    sequence(:description) { |n| "Some description#{n}" }
    sequence(:image) { |n| "image.jpg"}
  end
end
