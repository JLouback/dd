class ChangeBoolFormatAgain < ActiveRecord::Migration[5.0]
  def change
  	change_column :users, :allergy, :string
  end
end
