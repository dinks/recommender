FactoryGirl.define do
  factory :user, class: ::Recommender::User do
    products []
  end
end
