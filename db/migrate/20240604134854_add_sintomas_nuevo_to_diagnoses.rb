class AddSintomasNuevoToDiagnoses < ActiveRecord::Migration[7.0]
  def change
    add_column :diagnoses, :sintomas_nuevo, :string
  end
end
