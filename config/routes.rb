Bokushi::Application.routes.draw do
  resources :timetables, :only => [:show,:index] do
    resources :entries, :only => [:new,:create]
  end
  #root :to => 'welcome#index'
end
