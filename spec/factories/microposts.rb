FactoryBot.define do
  factory :micropost do
    content "I just ate an orange!"
    created_at 10.minutes.ago
    user michael
  end
end
