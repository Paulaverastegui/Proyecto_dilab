class AddEscalaToDiagnoses < ActiveRecord::Migration[7.0]
  def change
    add_column :diagnoses, :escala, :string
  end
end
