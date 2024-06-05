class CreateLevels < ActiveRecord::Migration[7.0]
  def change
    create_table :levels do |t|
      t.string :escala
      t.integer :severidad
      t.references :diagnosis, null: false, foreign_key: true

      t.timestamps
    end
  end
end
