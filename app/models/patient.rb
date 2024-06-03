class Patient < ApplicationRecord
  belongs_to :user
  has_many :diagnoses
  validates :name, :rut, :birthdate, presence: true
end
