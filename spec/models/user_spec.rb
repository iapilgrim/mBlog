require 'spec_helper'

describe User do

    it "is valid with name" do
      user = User.new(name: 'Michal')
      expect(user).to be_valid
    end

    it "is invalid without name" do
      expect(User.new(name: nil)).to have(1).errors_on(:name)
    end
end