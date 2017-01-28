class RedmineExAgileController < AgileChartsController
  unloadable

  before_filter :find_project
  before_filter :authorize, only: :index

  def index
    retrieve_charts_query
    @query.date_from ||= Date.today
    @issues = @query.issues
    params["date_from"] = @query.date_from
    @query.date_to ||= Date.today + 1
    params["date_to"] = @query.date_to
    @selected_users = selected_users
    @all_users = @project.memberships.sorted.to_a
  end

  private

  def selected_users
    if params["user_list"]
      params["user_list"]
    else
      nil
    end
  end

  def find_project
    @project = Project.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end
