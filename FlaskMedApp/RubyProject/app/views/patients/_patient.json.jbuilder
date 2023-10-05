json.extract! patient, :id, :pesel, :name, :surname, :email, :phone_num, :born, :address, :disablity, :mediacal_offer, :created_at, :updated_at
json.url patient_url(patient, format: :json)
