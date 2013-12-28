class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin, :user_detail_attributes
  attr_accessible :status
  has_one :user_detail, dependent: :destroy
  accepts_nested_attributes_for :user_detail
  has_many :user_accesses
  has_many :vehicles, through: :user_accesses 

  # The first registered user in the system should be admin.
  def self.one_admin
    first_user = User.all.first
    user =  User.all[1]

    if user.blank? && !first_user.blank? 
      user = User.first
      user.update_attributes(:admin => true)
    end
  end
end
