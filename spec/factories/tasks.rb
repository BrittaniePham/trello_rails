FactoryBot.define do
  factory :task, class: Task do
    body "do homework"
    priority 1
    list
  end
end
