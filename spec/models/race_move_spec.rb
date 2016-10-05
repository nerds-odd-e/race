require 'rails_helper'

RSpec.describe RaceMove, type: :model do
  let(:race_player) { FactoryGirl.create :race_player }

  context 'a normal move' do
    subject { race_player.race_moves.new choice: 'normal' }
    its(:choice) {is_expected.to eq 'normal'}

    context 'when the rand number is an odd number' do
      before { race_player.next_rand = 3 }
      it {expect{ subject }.to change(race_player, :steps).by(1)}
      it {expect{ subject }.to change(race_player, :scars).by(0)}

      context 'when there is already a scar' do
        before { race_player.old_scars = 1 }
        it {expect{ subject }.not_to change(race_player, :steps)}
      end
    end

    context 'when the rand number is an even number' do
      before { race_player.next_rand = 4 }
      it {expect{ subject }.to change(race_player, :steps).by(2)}
    end
  end

  context 'a super move' do
    subject { race_player.race_moves.new choice: 'super' }
    context 'when the rand number is 3' do
      before { race_player.next_rand = 3 }
      it {expect{ subject }.to change(race_player, :steps).by(3)}
      it {expect{ subject }.to change(race_player, :scars).by(1)}

      context 'when the player already made a super move before' do
        before { race_player.next_rand = 6 }
        before { race_player.race_moves.new choice: 'super' }
        it {expect{ subject }.to change(race_player, :steps).from(6).to(11)}
        it {expect{ subject }.to change(race_player, :scars).from(1).to(2)}
      end
    end
  end
end
