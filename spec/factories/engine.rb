FactoryGirl.define do
  factory :engine, class: ::Recommender::Engine do
    user

    initialize_with { new(user) }

  end
end
