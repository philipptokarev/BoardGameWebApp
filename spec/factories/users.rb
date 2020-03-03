FactoryBot.define do
  factory :user, class: User  do
    login { "philtok" }
    password { "12345678" }
    password_confirmation { password }
  end

  factory :admin, class: User do
    login { "philtok" }
    password { "12345678" }
    password_confirmation { password }
    role { "admin" }
  end
end
