class CreateGussScales < ActiveRecord::Migration[7.0]
  def change
    create_table :guss_scales do |t|
      t.integer :vigilance
      t.integer :cough
      t.integer :saliva_swallow
      t.integer :sialorrhea
      t.integer :voice_changes
      t.integer :semi_solids_swallow
      t.integer :semi_solids_cough
      t.integer :semi_solids_sialorrhea
      t.integer :semi_solids_voice_changes
      t.integer :liquids_swallow
      t.integer :liquids_cough
      t.integer :liquids_sialorrhea
      t.integer :liquids_voice_changes
      t.integer :solids_swallow
      t.integer :solids_cough
      t.integer :solids_sialorrhea
      t.integer :solids_voice_changes
      t.references :diagnosis, null: false, foreign_key: true

      t.timestamps
    end
  end
end
