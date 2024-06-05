class Diagnosis < ApplicationRecord
  belongs_to :patient
  has_many :levels, dependent: :destroy 
end
