class AddHistoriaCirugiaToDiagnoses < ActiveRecord::Migration[7.0]
  def change
    add_column :diagnoses, :historia_cirugia, :string
  end
end
