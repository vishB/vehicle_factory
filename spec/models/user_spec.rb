require 'spec_helper'

#System should have one admin.
describe User do
  it "system should have an admin" do
    admin = User.where(:admin => true)
    expect admin.blank?
  end
end

#System should have only one admin at a time.
describe User do
  it "system should have only one admin at a time" do
    admin_count = User.where(:admin => true).count
    expect admin_count == 1
  end
end

#user should have an email
describe User do
  it "user should have email" do 
    user_email = User.where(:email => nil)
    expect user_email.blank? == true
  end    
end

describe User do
  it "should create user with proper email and password" do
    FactoryGirl.build(:user).should be_valid
  end
end

describe User do
  it "should have unique email for every user" do
  end
end

describe User do
  it "should have age as numeric value" do
  end
end

describe User do
  it "should be able to create another users " do
  end
end

describe User do
  it "should be able to add a vehicle" do 
  end
end

describe User do
  it "should be able to share a vehicle" do
  end
end


