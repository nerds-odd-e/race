# frozen_string_literal: true
FactoryGirl.define do
  factory :player do
    distance 1
    damage 0
    throw_flag false
  end

  factory :thrown_player, parent: :player do
    throw_flag true
  end
 
end
