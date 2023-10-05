require "application_system_test_case"

class DoctorsTest < ApplicationSystemTestCase
  setup do
    @doctor = doctors(:one)
  end

  test "visiting the index" do
    visit doctors_url
    assert_selector "h1", text: "Doctors"
  end

  test "should create doctor" do
    visit doctors_url
    click_on "New doctor"

    fill_in "Address", with: @doctor.address
    fill_in "Born", with: @doctor.born
    check "Disablity" if @doctor.disablity
    fill_in "Email", with: @doctor.email
    fill_in "Mediacal specialization", with: @doctor.mediacal_specialization
    fill_in "Name", with: @doctor.name
    fill_in "Pesel", with: @doctor.pesel
    fill_in "Phone num", with: @doctor.phone_num
    fill_in "Surname", with: @doctor.surname
    click_on "Create Doctor"

    assert_text "Doctor was successfully created"
    click_on "Back"
  end

  test "should update Doctor" do
    visit doctor_url(@doctor)
    click_on "Edit this doctor", match: :first

    fill_in "Address", with: @doctor.address
    fill_in "Born", with: @doctor.born
    check "Disablity" if @doctor.disablity
    fill_in "Email", with: @doctor.email
    fill_in "Mediacal specialization", with: @doctor.mediacal_specialization
    fill_in "Name", with: @doctor.name
    fill_in "Pesel", with: @doctor.pesel
    fill_in "Phone num", with: @doctor.phone_num
    fill_in "Surname", with: @doctor.surname
    click_on "Update Doctor"

    assert_text "Doctor was successfully updated"
    click_on "Back"
  end

  test "should destroy Doctor" do
    visit doctor_url(@doctor)
    click_on "Destroy this doctor", match: :first

    assert_text "Doctor was successfully destroyed"
  end
end
