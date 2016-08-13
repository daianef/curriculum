require 'test_helper'

class CandidatesControllerTest < ActionController::TestCase
  setup do
    @candidate = candidates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:candidates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create candidate" do
    assert_difference('Candidate.count') do
      post :create, candidate: { email: @candidate.email, first_name: @candidate.first_name, github: @candidate.github, goal: @candidate.goal, homepage: @candidate.homepage, last_name: @candidate.last_name, linkedin: @candidate.linkedin, middle_name: @candidate.middle_name }
    end

    assert_redirected_to candidate_path(assigns(:candidate))
  end

  test "should show candidate" do
    get :show, id: @candidate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @candidate
    assert_response :success
  end

  test "should update candidate" do
    patch :update, id: @candidate, candidate: { email: @candidate.email, first_name: @candidate.first_name, github: @candidate.github, goal: @candidate.goal, homepage: @candidate.homepage, last_name: @candidate.last_name, linkedin: @candidate.linkedin, middle_name: @candidate.middle_name }
    assert_redirected_to candidate_path(assigns(:candidate))
  end

  test "should destroy candidate" do
    assert_difference('Candidate.count', -1) do
      delete :destroy, id: @candidate
    end

    assert_redirected_to candidates_path
  end
end
