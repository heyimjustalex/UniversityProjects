require "application_system_test_case"

class PatientsTest < ApplicationSystemTestCase
  setup do
    @patient = patients(:one)
  end

  test "visiting the index" do
    visit patients_url
    assert_selector "h1", text: "Patients"
  end

  test "should create patient" do
    visit patients_url
    click_on "New patient"

    fill_in "Address", with: @patient.address
    fill_in "Born", with: @patient.born
    check "Disablity" if @patient.disablity
    fill_in "Email", with: @patient.email
    fill_in "Mediacal offer", with: @patient.mediacal_offer
    fill_in "Name", with: @patient.name
    fill_in "Pesel", with: @patient.pesel
    fill_in "Phone num", with: @patient.phone_num
    fill_in "Surname", with: @patient.surname
    click_on "Create Patient"

    assert_text "Patient was successfully created"
    click_on "Back"
  end

  test "should update Patient" do
    visit patient_url(@patient)
    click_on "Edit this patient", match: :first

    fill_in "Address", with: @patient.address
    fill_in "Born", with: @patient.born
    check "Disablity" if @patient.disablity
    fill_in "Email", with: @patient.email
    fill_in "Mediacal offer", with: @patient.mediacal_offer
    fill_in "Name", with: @patient.name
    fill_in "Pesel", with: @patient.pesel
    fill_in "Phone num", with: @patient.phone_num
    fill_in "Surname", with: @patient.surname
    click_on "Update Patient"

    assert_text "Patient was successfully updated"
    click_on "Back"
  end

  test "should destroy Patient" do
    visit patient_url(@patient)
    click_on "Destroy this patient", match: :first

    assert_text "Patient was successfully destroyed"
  end
end
