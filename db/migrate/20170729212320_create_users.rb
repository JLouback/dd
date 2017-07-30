class CreateUsers < ActiveRecord::Migration[5.0]
  require 'date'
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :cpf
      t.date :dob
      t.string :city
      t.string :state
      t.boolean :surgery
      t.string :surgeryDescription
      t.boolean :cancer
      t.string :cancerDescription
      t.boolean :allergy
      t.string :allergyDescription
      t.boolean :asthma
      t.boolean :rhinitis
      t.boolean :bronquitis
      t.boolean :diabetes
      t.boolean :highBloodPressure
      t.boolean :hyperthyroidism
      t.boolean :hypothyroidism
      t.string :comments

      t.timestamps
    end
  end
end
