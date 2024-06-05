class GussScale < ApplicationRecord
  belongs_to :diagnosis

  validates :vigilance, :cough, :saliva_swallow, :sialorrhea, :voice_changes, presence: true, if: :preliminary_completed?

  def preliminary_score
    vigilance + cough + saliva_swallow + (sialorrhea == 1 ? 0 : 1) + (voice_changes == 1 ? 0 : 1)
  end

  def semi_solids_score
    semi_solids_swallow + (semi_solids_cough == 1 ? 0 : 1) + (semi_solids_sialorrhea == 1 ? 0 : 1) + (semi_solids_voice_changes == 1 ? 0 : 1)
  end

  def liquids_score
    liquids_swallow + (liquids_cough == 1 ? 0 : 1) + (liquids_sialorrhea == 1 ? 0 : 1) + (liquids_voice_changes == 1 ? 0 : 1)
  end

  def solids_score
    solids_swallow + (solids_cough == 1 ? 0 : 1) + (solids_sialorrhea == 1 ? 0 : 1) + (solids_voice_changes == 1 ? 0 : 1)
  end

  def total_score
    preliminary_score + semi_solids_score + liquids_score + solids_score
  end

  def preliminary_completed?
    vigilance.present? && cough.present? && saliva_swallow.present? && sialorrhea.present? && voice_changes.present?
  end

end

