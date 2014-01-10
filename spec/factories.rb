FactoryGirl.define do
  factory :user do |f|
    f.sequence(:email) { |n| "foo#{n}@example.com" }
    f.password "foobar@123"
    f.password_confirmation { |u| u.password }
  end
end


FactoryGirl.define do
  factory :vehicle do |f|
    f.vehicle_type "shuttle" || "satellite"
    f.sequence(:v_identifier) { |i| "100#{i}"}
    f.engine_id 1
    f.payload_weight 50
    f.occupants 20
  end  
end
