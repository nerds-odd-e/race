# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Dice, type: :model do
  describe 'number' do
    subject { Dice.number }
    it { expect([1, 2, 3, 4, 5, 6]).to include subject }
  end
end
