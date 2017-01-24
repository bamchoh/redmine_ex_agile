class RedmineExAgileController < AgileChartsController
  unloadable

	before_filter :find_project
	before_filter :authorize, only: :index

  def index
		retrieve_charts_query
    @query.date_to ||= Date.today
  end

	def list
		issues = convert_issues(Issue.where(project_id: "#{@project.id}"))
		render json: issues
	end

	private

	def convert_issues(org_issues)
		issues = []
		org_issues.each { |org_issue|
			tracker = org_issue.tracker.nil? ? nil : org_issue.tracker.name
			category = org_issue.category.nil? ? nil : org_issue.category.name
			status = org_issue.status.nil? ? nil : org_issue.status.name
			priority = org_issue.priority.nil? ? nil : org_issue.priority.name
			assignee = org_issue.assigned_to.nil? ? nil : org_issue.assigned_to.name
			author = org_issue.author.nil? ? nil : org_issue.author.name

			issue = {
				tracker: tracker,
				category: category,
				status: status,
				priority: priority,
				assignee: assignee,
				author: author
			}

			issues.push(issue)
		}
		return issues
	end

	def find_project
		@project = Project.find(params[:project_id])
	rescue ActiveRecord::RecordNotFound
		render_404
	end
end
