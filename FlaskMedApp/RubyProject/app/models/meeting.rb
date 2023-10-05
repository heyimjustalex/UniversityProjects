class Meeting < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  has_many :medical_interviews
end
