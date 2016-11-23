require 'rails_helper'

RSpec.describe Player, type: :model do
  describe "#steps" do
    subject { FactoryGirl.create :player }

    its(:steps) { is_expected.to eq 0 }

    context 'when the player go super' do
      before { subject.go_super 3 }
      its(:steps) { is_expected.to eq 3 }
    end

    context 'when the player go normal' do
      before { subject.go_normal 3 }
      its(:steps) { is_expected.to eq 1 }
    end
  end
end
