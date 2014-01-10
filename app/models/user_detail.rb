class UserDetail < ActiveRecord::Base
  attr_accessible :age, :first_name, :last_name, :phone, :sex, :user_id
  belongs_to :user
  validates :user_id, :presence => true
  validates :first_name, :last_name, :presence => true
end
