class AddSintomasTiempoToDiagnoses < ActiveRecord::Migration[7.0]
  def change
    add_column :diagnoses, :sintomas_tiempo, :string
  end
end
