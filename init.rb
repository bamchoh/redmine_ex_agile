Redmine::Plugin.register :redmine_ex_agile do
  name 'Extends Redmine Agile plugin'
  author 'bamchoh'
  description 'This extends for Redmine Agile plugin.'
  version '0.0.1'
  url 'http://github.com/bamchoh/redmine_ex_agile'
  author_url 'http://github.com/bamchoh'

	project_module :redmine_ex_agile do
		permission :view_redmine_ex_agile, :redmine_ex_agile => [:index]
	end

	menu :project_menu, :redmine_ex_agile, { :controller => 'redmine_ex_agile', :action => 'index' }, :param => :project_id
end
