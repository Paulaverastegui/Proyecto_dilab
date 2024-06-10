class GussScale < ApplicationRecord
  belongs_to :diagnosis

  validates :vigilance, :cough, :saliva_swallow, :sialorrhea, :voice_changes, presence: true, if: :preliminary_completed?

  def preliminary_score
    (vigilance || 0) + (cough || 0) + (saliva_swallow || 0) + ((sialorrhea == 1 ? 0 : 1) || 0) + ((voice_changes == 1 ? 0 : 1) || 0)
  end

  def semi_solids_score
    (semi_solids_swallow || 0) + ((semi_solids_cough == 1 ? 0 : 1) || 0) + ((semi_solids_sialorrhea == 1 ? 0 : 1) || 0) + ((semi_solids_voice_changes == 1 ? 0 : 1) || 0)
  end

  def liquids_score
    (liquids_swallow || 0) + ((liquids_cough == 1 ? 0 : 1) || 0) + ((liquids_sialorrhea == 1 ? 0 : 1) || 0) + ((liquids_voice_changes == 1 ? 0 : 1) || 0)
  end

  def solids_score
    (solids_swallow || 0) + ((solids_cough == 1 ? 0 : 1) || 0) + ((solids_sialorrhea == 1 ? 0 : 1) || 0) + ((solids_voice_changes == 1 ? 0 : 1) || 0)
  end

  def total_score
    preliminary_score + semi_solids_score + liquids_score + solids_score
  end

  def preliminary_completed?
    vigilance.present? && cough.present? && saliva_swallow.present? && sialorrhea.present? && voice_changes.present?
  end
end


