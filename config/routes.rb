Bokushi::Application.routes.draw do
  get 'login' => 'entries#new'
  resources :timetables, :only => [:show,:index,:new,:create] do
    resources :entries, :only => [:new,:create]
  end
  root :to => 'timetables#index'
end
