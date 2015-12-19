# ApplicationController
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_projects
  before_action :set_placeholders

  private

  def set_projects
    @projects = Project.all
  end

  def set_placeholders
    con = @projects.count
    con += 1 while con % 3 != 0
    @placeholders = con - @projects.count
  end
end
