class Diagnosis < ApplicationRecord
  belongs_to :patient
  validates :description, :severity, presence: true
end
