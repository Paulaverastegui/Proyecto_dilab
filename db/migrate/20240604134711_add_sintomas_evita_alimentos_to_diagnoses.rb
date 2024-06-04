class AddSintomasEvitaAlimentosToDiagnoses < ActiveRecord::Migration[7.0]
  def change
    add_column :diagnoses, :sintomas_evita_alimentos, :string
  end
end
