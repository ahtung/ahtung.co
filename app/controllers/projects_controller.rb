# ProjectsController
class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
    @page_title = 'Works'
    @page_description = 'Find out more about our projects. '
    @page_keywords = 'ahtung, internet, list, projects'
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @page_title = "#{@project.title}"
    @page_description = @project.subtitle
    @page_keywords = "ahtung project, #{@project.title}, internet"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end
end
