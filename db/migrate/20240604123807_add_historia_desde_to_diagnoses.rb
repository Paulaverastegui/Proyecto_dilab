class AddHistoriaDesdeToDiagnoses < ActiveRecord::Migration[7.0]
  def change
    add_column :diagnoses, :historia_desde, :string
  end
end
