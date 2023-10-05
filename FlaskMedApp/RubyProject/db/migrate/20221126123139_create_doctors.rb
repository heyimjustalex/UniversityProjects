class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.integer :pesel, null: false
      t.string :name, null: false
      t.string :surname, null: false
      t.string :email, null: false
      t.string :phone_num, null: false
      t.date :born, null: false
      t.string :address, null: false
      t.boolean :disablity
      t.string :mediacal_specialization

      t.timestamps
    end
  end
end
