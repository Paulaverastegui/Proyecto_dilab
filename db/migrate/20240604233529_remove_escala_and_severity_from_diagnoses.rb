class RemoveEscalaAndSeverityFromDiagnoses < ActiveRecord::Migration[7.0]
  def change
    remove_column :diagnoses, :escala, :string
    remove_column :diagnoses, :severity, :string
  end
end
