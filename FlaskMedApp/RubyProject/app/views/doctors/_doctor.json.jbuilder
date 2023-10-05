json.extract! doctor, :id, :pesel, :name, :surname, :email, :phone_num, :born, :address, :disablity, :mediacal_specialization, :created_at, :updated_at
json.url doctor_url(doctor, format: :json)
