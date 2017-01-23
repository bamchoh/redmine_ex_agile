# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
	resources :projects do
		get 'redmine_ex_agile' => 'redmine_ex_agile#index'
		get 'redmine_ex_agile/list' => 'redmine_ex_agile#list'
	end
end
