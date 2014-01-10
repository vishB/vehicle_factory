class Vehicle < ActiveRecord::Base
  attr_accessible :occupants, :payload_weight, :vehicle_type, :v_identifier, :engine_id, :construction_attributes
  validates :v_identifier,:occupants,:payload_weight, :numericality => {:only_integer => true}  
  has_many :user_accesses
  has_many :users, through: :user_accesses
  has_one :construction, dependent: :destroy
  belongs_to :engine
  accepts_nested_attributes_for :construction

  validates :v_identifier,:engine_id, :presence => true
  validates :v_identifier, :uniqueness => true
  validates_length_of :v_identifier, :maximum => 4, :allow_blank => false
end
