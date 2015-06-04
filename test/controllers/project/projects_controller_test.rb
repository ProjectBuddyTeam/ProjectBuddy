require 'test_helper'

class Project::ProjectsControllerTest < ActionController::TestCase
  setup do
    @project_project = project_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_project" do
    assert_difference('Project::Project.count') do
      post :create, project_project: { codename: @project_project.codename, member_id: @project_project.member_id, mission: @project_project.mission }
    end

    assert_redirected_to project_project_path(assigns(:project_project))
  end

  test "should show project_project" do
    get :show, id: @project_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_project
    assert_response :success
  end

  test "should update project_project" do
    patch :update, id: @project_project, project_project: { codename: @project_project.codename, member_id: @project_project.member_id, mission: @project_project.mission }
    assert_redirected_to project_project_path(assigns(:project_project))
  end

  test "should destroy project_project" do
    assert_difference('Project::Project.count', -1) do
      delete :destroy, id: @project_project
    end

    assert_redirected_to project_projects_path
  end
end
