require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe ".save after setting total price" do

    let(:user1) { create :user, email: "host@user.com" }

    let!(:event) { create :event, user: user1 }
    let!(:booking) { create :booking, event: event, user: user1 }


    it "returns a sorted array of events by prices" do
      expect(Booking.set_total_price).to eq(price * total_days)
    end
  end
end
