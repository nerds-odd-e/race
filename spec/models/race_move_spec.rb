require 'rails_helper'

RSpec.describe RaceMove, type: :model do
  let(:race_player) { FactoryGirl.create :race_player }
  subject { race_player.race_moves.new choice: 'normal' }

  context 'before the game start ticking' do
    before { subject.valid? }
    it { is_expected.to be_invalid }
    its("errors.messages") { is_expected.to include({tick: ["has not started yet"]}) }
  end

  context 'after the game start ticking' do
    before { race_player.race_game.next_tick! }
    it { is_expected.to be_valid }

    context 'to move again' do
      before { race_player.race_moves.create choice: 'normal' }
      before { subject.valid? }
      it { is_expected.to be_invalid }
      its("errors.messages") { is_expected.to include({tick: ["already moved"]}) }
    end
  end

  context 'a normal move' do
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
