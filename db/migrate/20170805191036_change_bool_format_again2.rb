class ChangeBoolFormatAgain2 < ActiveRecord::Migration[5.0]
  def change
  	change_column :users, :surgery, :string
  	change_column :users, :cancer, :string
  end
end
