class AddSintomasFrecuenciaToDiagnoses < ActiveRecord::Migration[7.0]
  def change
    add_column :diagnoses, :sintomas_frecuencia, :string
  end
end
