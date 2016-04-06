require "spec_helper"

describe "Notification" do
  describe "factory" do
    it "saves record" do
      expect{
        FactoryGirl.build(:notification).save
      }.to change{ Notification.count}.by(1)
    end
  end
end
