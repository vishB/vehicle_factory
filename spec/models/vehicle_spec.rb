require 'spec_helper'

describe Vehicle do
  it "should get created with proper values" do
    FactoryGirl.build(:vehicle).should be_valid
  end
end

describe Vehicle do
  it "Should not be valid without an identifier" do
    vehicle = FactoryGirl.build(:vehicle, v_identifier:nil)
    vehicle.should_not be_valid
  end
end

describe Vehicle do
  it "should not be valid without an engine " do
    vehicle = FactoryGirl.build(:vehicle, engine_id:nil)
    vehicle.should_not be_valid
  end
end

describe Vehicle do
  it "should not accept character values for identifiers" do
    vehicle = FactoryGirl.build(:vehicle, v_identifier: "abcd")
    vehicle.should_not be_valid
  end
end

describe Vehicle do
  it "should not accept more than 4 digits for identifiers" do
    vehicle = FactoryGirl.build(:vehicle, v_identifier: 12345454)
    vehicle.should_not be_valid
  end
end

describe Vehicle do
  it "should have number of occupants a numeric value" do
    vehicle = FactoryGirl.build(:vehicle, occupants: "occupants")
    vehicle.occupants.should eq(0)
  end
end

describe Vehicle do
  it "Should have an engine" do
    vehicle = FactoryGirl.build(:vehicle)
    vehicle.should be_valid
  end
end  