FactoryBot.define do
  factory :game do
    sequence(:name) { |n| "Game#{n}" }
    sequence(:description) { |n| "Some description#{n}" }
    sequence(:image) { |n| "https://www.google.com/search?q=image&safe=strict&sxsrf=ALeKk00SPHoYdVbbr9IEHgpS3yjoF1Jueg:1582710674364&tbm=isch&source=iu&ictx=1&fir=ShQnriFk8AK93M%253A%252CMxJRAkFr5rrEwM%252C_&vet=1&usg=AI4_-kRaQLOAyRPJgkW9b9-vrqZJfTswAA&sa=X&ved=2ahUKEwiV-Jvc-O7nAhWi_CoKHQOpB0wQ9QEwB3oECAoQEg#imgrc=ShQnriFk8AK93M"}
  end
end
