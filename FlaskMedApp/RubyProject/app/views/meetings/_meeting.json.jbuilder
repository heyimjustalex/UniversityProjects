json.extract! meeting, :id, :meeting_description, :meeting_time, :patient_id, :doctor_id, :created_at, :updated_at
json.url meeting_url(meeting, format: :json)
