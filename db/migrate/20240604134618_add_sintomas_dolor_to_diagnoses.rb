class AddSintomasDolorToDiagnoses < ActiveRecord::Migration[7.0]
  def change
    add_column :diagnoses, :sintomas_dolor, :string
  end
end
