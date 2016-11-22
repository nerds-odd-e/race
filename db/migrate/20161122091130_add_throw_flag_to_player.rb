class AddThrowFlagToPlayer < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :throw_flag, :boolean, default: false
  end
end
