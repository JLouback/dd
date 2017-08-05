class ChangeBoolFormat < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :allergy, :boolean
  end

  def down
    change_column :users, :allergy, :string
  end
end
