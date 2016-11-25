# frozen_string_literal: true
class AddStepsToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :steps, :integer, null: false, default: 0
  end
end
