class Vehicle < ActiveRecord::Base
  attr_accessible :occupants, :payload_weight, :vehicle_type, :v_identifier, :engine_id, :construction_attributes
  validates :v_identifier,:numericality => {:only_integer => true}  
  has_many :user_accesses
  has_many :users, through: :user_accesses
  has_one :construction, dependent: :destroy
  belongs_to :engine
  accepts_nested_attributes_for :construction
  validates :v_identifier,:engine_id, :presence => true
  validates :v_identifier, :uniqueness => true
  validates_length_of :v_identifier, :maximum => 4, :allow_blank => false

  # Create vehicle identifier
  def self.get_identifier
    last_identifier = self.last
    if last_identifier.blank?
      identifier = 1000
    else
      identifier = self.maximum("v_identifier") + 1
    end
  end
  # Get vehicle sharer
  def self.get_sharer(vehicle)
    if UserAccess.find_by_vehicle_id(vehicle)
     user = UserAccess.find_by_vehicle_id(vehicle).shared_by
     f_name = UserDetail.find(user).first_name
     l_name = UserDetail.find(user).last_name
     sharer = f_name + " " + l_name
    end 
  end
end
