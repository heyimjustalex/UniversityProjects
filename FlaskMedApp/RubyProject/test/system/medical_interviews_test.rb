require "application_system_test_case"

class MedicalInterviewsTest < ApplicationSystemTestCase
  setup do
    @medical_interview = medical_interviews(:one)
  end

  test "visiting the index" do
    visit medical_interviews_url
    assert_selector "h1", text: "Medical interviews"
  end

  test "should create medical interview" do
    visit medical_interviews_url
    click_on "New medical interview"

    fill_in "Hygiene", with: @medical_interview.hygiene
    fill_in "Interview description", with: @medical_interview.interview_description
    fill_in "Meeting", with: @medical_interview.meeting_id
    fill_in "Treatment story", with: @medical_interview.treatment_story
    click_on "Create Medical interview"

    assert_text "Medical interview was successfully created"
    click_on "Back"
  end

  test "should update Medical interview" do
    visit medical_interview_url(@medical_interview)
    click_on "Edit this medical interview", match: :first

    fill_in "Hygiene", with: @medical_interview.hygiene
    fill_in "Interview description", with: @medical_interview.interview_description
    fill_in "Meeting", with: @medical_interview.meeting_id
    fill_in "Treatment story", with: @medical_interview.treatment_story
    click_on "Update Medical interview"

    assert_text "Medical interview was successfully updated"
    click_on "Back"
  end

  test "should destroy Medical interview" do
    visit medical_interview_url(@medical_interview)
    click_on "Destroy this medical interview", match: :first

    assert_text "Medical interview was successfully destroyed"
  end
end
