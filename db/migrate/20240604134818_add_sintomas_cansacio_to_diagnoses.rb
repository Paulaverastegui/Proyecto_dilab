class AddSintomasCansacioToDiagnoses < ActiveRecord::Migration[7.0]
  def change
    add_column :diagnoses, :sintomas_cansancio, :string
  end
end
