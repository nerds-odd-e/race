class AddChoiceToPlayer < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :choice, :string
  end
end
