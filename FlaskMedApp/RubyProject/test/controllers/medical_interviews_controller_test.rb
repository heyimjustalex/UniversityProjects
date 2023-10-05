require "test_helper"

class MedicalInterviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @medical_interview = medical_interviews(:one)
  end

  test "should get index" do
    get medical_interviews_url
    assert_response :success
  end

  test "should get new" do
    get new_medical_interview_url
    assert_response :success
  end

  test "should create medical_interview" do
    assert_difference("MedicalInterview.count") do
      post medical_interviews_url, params: { medical_interview: { hygiene: @medical_interview.hygiene, interview_description: @medical_interview.interview_description, meeting_id: @medical_interview.meeting_id, treatment_story: @medical_interview.treatment_story } }
    end

    assert_redirected_to medical_interview_url(MedicalInterview.last)
  end

  test "should show medical_interview" do
    get medical_interview_url(@medical_interview)
    assert_response :success
  end

  test "should get edit" do
    get edit_medical_interview_url(@medical_interview)
    assert_response :success
  end

  test "should update medical_interview" do
    patch medical_interview_url(@medical_interview), params: { medical_interview: { hygiene: @medical_interview.hygiene, interview_description: @medical_interview.interview_description, meeting_id: @medical_interview.meeting_id, treatment_story: @medical_interview.treatment_story } }
    assert_redirected_to medical_interview_url(@medical_interview)
  end

  test "should destroy medical_interview" do
    assert_difference("MedicalInterview.count", -1) do
      delete medical_interview_url(@medical_interview)
    end

    assert_redirected_to medical_interviews_url
  end
end
