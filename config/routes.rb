# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
	resources :projects do
		get 'ex_agile_chart' => 'ex_agile_chart#index'
		get 'ex_agile_chart/list' => 'ex_agile_chart#list'
	end
end
