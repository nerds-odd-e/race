require 'rails_helper'

RSpec.describe Player, type: :model do
  subject { FactoryGirl.create :player }
  describe "#steps" do

    its(:steps) { is_expected.to eq 0 }

    [
      [1, :go_super,  0, 1],
      [2, :go_super,  0, 2],
      [3, :go_super,  0, 3],
      [4, :go_super,  0, 4],
      [5, :go_super,  0, 5],
      [6, :go_super,  0, 6],
      [1, :go_normal, 0, 1],
      [2, :go_normal, 0, 2],
      [3, :go_normal, 0, 1],
      [4, :go_normal, 0, 2],
      [5, :go_normal, 0, 1],
      [6, :go_normal, 0, 2],
      [2, :go_normal, 1, 1],
      [2, :go_normal, 3, 0],
    ].each do |number, method, existing_damage, expected_steps|
      context "when the player #{method} with #{number} and #{existing_damage} damages" do
        before {
           subject.damage = existing_damage
           subject.send(method, number)
         }
        its(:steps) { is_expected.to eq expected_steps }
      end
    end
  end

  describe '#distance' do
    [
      [10, 0,:go_normal, 2, 12],
      [10, 1,:go_normal, 2, 11],
      [10, 0,:go_super, 4, 14],
    ].each do |current_distance, damage, method, dice, result_distance|
      context '' do
        before { 
          subject.distance = current_distance
          subject.damage = damage
        }
        it { expect{subject.send(method, dice)}.to change{subject.distance}.to(result_distance) }
      end
    end
  end

  describe '#go_super' do
    its(:damage) { is_expected.to eq 0 }

    context 'when go super' do
      before { subject.go_super 3 }
      its(:damage) { is_expected.to eq 1 }
    end

    describe '#go_super' do
      its(:damage) { is_expected.to eq 0 }

      context 'when go super' do
        before { subject.go_super 3 }
        its(:damage) { is_expected.to eq 1 }
      end

      context 'when go super with damage' do
        [
          [2, 3, 1],
          [10,3, 0]
        ].each do |damage, dice, steps|
          context 'damage check' do
            before do
              subject.damage = damage
             subject.go_super dice
           end
           its(:steps) { is_expected.to eq steps }
         end
        end
      end
    end
  end

  describe "#choice" do
    [
      [:go_normal, 'Normal'],
      [:go_super,  'Super'],
    ].each do |method, choice|
      context "check choice after go_normal and go_super" do
        before { subject.send(method, 3) }
        its(:choice) { is_expected.to eq choice }
        it { is_expected.to be_throw_flag }
      end
    end
  end
end
