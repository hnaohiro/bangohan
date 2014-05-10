FactoryGirl.define do
  factory :user1, class: User do
    name 'hoge'
    hour 10
    min 30
    need true
    order 1
  end

  factory :user2, class: User do
    name 'moge'
    hour 20
    min 30
    need true
    order 2
  end
end
