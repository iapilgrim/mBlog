require 'spec_helper'

describe User do

  # trying to use factories
  it "has a valid factory" do 
    expect(build(:user)).to be_valid
  end

  it "is invalid without name" do
    expect(build(:user, name: nil)).to have(1).errors_on(:name)
  end

  it "is invalid without email" do
    expect(build(:user, email: nil)).to have(1).errors_on(:email)
  end

  it "is invalid with a duplicate email address" do
    create(:user, email: "michal@example.com") # this created persistent record to database
    expect(build(:user, email: "michal@example.com")).to have(1).errors_on(:email)
  end

end