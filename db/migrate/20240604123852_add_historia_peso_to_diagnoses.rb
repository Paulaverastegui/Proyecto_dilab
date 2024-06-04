class AddHistoriaPesoToDiagnoses < ActiveRecord::Migration[7.0]
  def change
    add_column :diagnoses, :perdida_peso, :string
  end
end
