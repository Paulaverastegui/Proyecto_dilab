class AddSintomasSensacionToDiagnoses < ActiveRecord::Migration[7.0]
  def change
    add_column :diagnoses, :sintomas_sensacion, :string
  end
end
