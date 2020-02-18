class MedicalRecord < ApplicationRecord
    has_one_attached :file
    belongs_to :patient
end
