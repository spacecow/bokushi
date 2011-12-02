Bokushi::Application.routes.draw do
  resources :timetables, :only => :show
  #root :to => 'welcome#index'
end
