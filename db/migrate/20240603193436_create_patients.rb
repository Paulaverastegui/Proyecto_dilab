class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :rut
      t.date :birthdate
      t.string :sex
      t.string :email
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
