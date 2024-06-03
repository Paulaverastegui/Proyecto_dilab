class CreateDiagnoses < ActiveRecord::Migration[7.0]
  def change
    create_table :diagnoses do |t|
      t.references :patient, null: false, foreign_key: true
      t.text :description
      t.string :severity
      t.date :date

      t.timestamps
    end
  end
end
