class GussScale < ApplicationRecord
  belongs_to :diagnosis

  validates :vigilance, :cough, :saliva_swallow, :sialorrhea, :voice_changes, presence: true, if: :preliminary_completed?

  def preliminary_score
    (vigilance || 0) + (cough || 0) + (saliva_swallow || 0) + (sialorrhea || 0) + (voice_changes  || 0)
  end

  def semi_solids_score
    (semi_solids_swallow || 0) + (semi_solids_cough || 0) + (semi_solids_sialorrhea || 0) + (semi_solids_voice_changes || 0)
  end

  def liquids_score
    (liquids_swallow || 0) + (liquids_cough || 0) + (liquids_sialorrhea || 0) + (liquids_voice_changes || 0)
  end

  def solids_score
    (solids_swallow || 0) + (solids_cough || 0) + (solids_sialorrhea || 0) + (solids_voice_changes || 0)
  end

  def total_score
    (preliminary_score || 0) + 
    (semi_solids_score || 0) + 
    (liquids_score || 0) + 
    (solids_score || 0)
  end

  def preliminary_completed?
    vigilance.present? && cough.present? && saliva_swallow.present? && sialorrhea.present? && voice_changes.present?
  end
end