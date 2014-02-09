require 'spec_helper'

describe User do

  # trying to use factories
  it "has a valid factory" do 
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it "is invalid without name" do
    user = FactoryGirl.build(:user, name: nil)
    expect(user).to have(1).errors_on(:name)
  end

  it "is invalid without email" do
    user = FactoryGirl.build(:user, email: nil)
    expect(user).to have(1).errors_on(:email)
  end

  it "is invalid with a duplicate email address" do
    FactoryGirl.create(:user, email: "michal@example.com") # this created persistent record to database
    user = FactoryGirl.build(:user, email: "michal@example.com")
    expect(user).to have(1).errors_on(:email)
  end

end