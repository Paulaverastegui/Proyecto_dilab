class AddSintomasEpisodiosToDiagnose < ActiveRecord::Migration[7.0]
  def change
    add_column :diagnoses, :sintomas_episodios, :string
  end
end
