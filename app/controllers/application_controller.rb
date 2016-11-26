# ApplicationController
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_projects
  before_action :set_placeholders
  before_action :set_locale

  private

  def set_locale
    I18n.locale = http_accept_language.compatible_language_from(I18n.available_locales)
  end

  def set_projects
    @projects = Project.published
  end

  def set_placeholders
    con = @projects.count
    con += 1 while (con % 3).nonzero?
    @placeholders = con - @projects.count
  end
end
