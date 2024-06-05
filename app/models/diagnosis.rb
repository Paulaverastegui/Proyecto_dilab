class Diagnosis < ApplicationRecord
  belongs_to :patient
  has_many :levels, dependent: :destroy 
  has_one :guss_scale, dependent: :destroy
end
