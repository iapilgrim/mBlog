require 'spec_helper'

describe User do

    it "is valid with name" do
      user = User.new(name: 'Michal')
      expect(user).to be_valid
    end

    it "is invalid without name" do
      expect(User.new(name: nil)).to have(1).errors_on(:name)
    end

    it "is invalid with a duplicate email address" do
      User.create(
        name: 'Michal',
        email: 'tester@example.com')
      user = User.new(
        name: 'Misa',
        email: 'tester@example.com')
      expect(user).to have(1).errors_on(:email)
    end

end