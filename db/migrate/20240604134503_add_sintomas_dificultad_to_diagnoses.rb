class AddSintomasDificultadToDiagnoses < ActiveRecord::Migration[7.0]
  def change
    add_column :diagnoses, :sintomas_dificultad, :string
  end
end
