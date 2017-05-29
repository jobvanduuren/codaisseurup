require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_most(500) }
  end
    describe "#bargain?" do
    let(:bargain_event) { create :event, price: 20 }
    let(:non_bargain_event) { create :event, price: 200 }

    it "returns true if the price is smaller than 30 EUR" do
      expect(bargain_event.bargain?).to eq(true)
      expect(non_bargain_event.bargain?).to eq(false)
    end
  end

  describe ".order_by_price" do
    let!(:event1) { create :event, price: 100 }
    let!(:event2) { create :event, price: 200 }
    let!(:event3) { create :event, price: 300 }

    it "returns a sorted array of events by prices" do
      expect(Event.order_by_price).to match_array [event1, event2, event3]
    end
  end

  describe "association with user" do
  let(:user) { create :user }

  it "belongs to a user" do
    event = user.events.new(name: "Shared")

    expect(event.user).to eq(user)
  end
end

describe "association with theme" do
  let(:event) { create :event }

  let(:theme1) { create :theme, name: "Bright", events: [event] }
  let(:theme2) { create :theme, name: "Clean lines", events: [event] }
  let(:theme3) { create :theme, name: "A Man's Touch", events: [event] }

  it "has themes" do
    expect(event.themes).to include(theme1)
    expect(event.themes).to include(theme2)
    expect(event.themes).to include(theme3)
  end
end

describe "association with booking" do
  let(:guest_user) { create :user, email: "guest@user.com" }
  let(:host_user) { create :user, email: "host@user.com" }

  let!(:event) { create :event, user: host_user }
  let!(:booking) { create :booking, event: event, user: guest_user }

  it "has guests" do
    expect(event.guests).to include(guest_user)
  end
end

describe "#available?" do
    let(:host_user) { create :user, email: "host@user.com" }
    let(:guest_user) { create :user, email: "guest@user.com" }

    let(:event) { create :event, price: 20, user: host_user }

    let!(:existent_booking) {
      create :booking,
        event: event,
        starts_at: 2.days.from_now,
        ends_at: 6.days.from_now,
        user: guest_user
    }

    context "is available" do
      subject { event.available?(8.days.from_now, 10.days.from_now) }

      it "returns true" do
        expect(subject).to be true
      end
    end

    context "is not available" do
      subject { event.available?(4.days.from_now, 10.days.from_now) }

      it "returns false" do
        expect(subject).to be false
      end
    end
  end


end
