class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin, :created_by, :user_detail_attributes
  attr_accessible :status
  has_one :user_detail, dependent: :destroy
  accepts_nested_attributes_for :user_detail
  has_many :user_accesses
  has_many :vehicles, through: :user_accesses 
  validates :email, :password, :password_confirmation, :presence => true
  validates :email, :uniqueness => true

  # The first registered user in the system should be admin.
  def self.one_admin
    first_user = User.all.first
    user =  User.all[1]

    if user.blank? && !first_user.blank? 
      user = User.first
      user.update_attributes(:admin => true)
    end
  end

  #find the user creator
  def self.creator(user)
    unless user.created_by.blank? || user.created_by == 0.to_i
      f_name = User.find(user.created_by).user_detail.first_name 
      l_name = User.find(user.created_by).user_detail.last_name 
      name = f_name + ' ' + l_name
    else
      name = "Annonymous user"
    end  
  end
end
