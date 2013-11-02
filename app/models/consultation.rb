class Consultation
  include Mongoid::Document
  field :doctor_id, type: Integer
  field :patient_id, type: Integer

  belongs_to :doctor
  belongs_to :patient
end
