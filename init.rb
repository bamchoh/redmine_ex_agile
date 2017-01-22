Redmine::Plugin.register :ex_agile_chart do
  name 'Extended Chart Reporter'
  author 'bamchoh'
  description 'This is extended for Agile Burndown chart.'
  version '0.0.1'
  url 'http://github.com/bamchoh/ex_agile_chart'
  author_url 'http://github.com/bamchoh'

	project_module :ex_agile_chart do
		permission :view_ex_agile_chart, :ex_agile_chart => [:index]
	end

	menu :project_menu, :ex_agile_chart, { :controller => 'ex_agile_chart', :action => 'index' }, :param => :project_id
end
