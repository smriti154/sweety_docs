Rails.application.routes.draw do
  
devise_scope :user do
    root :to => 'users/registrations#new'
end

get '/readings' => "glucose_reading#readings"
get '/show_readings' =>"glucose_reading#show_readings"
post '/add_entry' => "glucose_reading#add_entry"
get '/new' => "glucose_reading#new"
get '/show_reports' => "reports#show_reports"


devise_for :users , controllers: {
         sessions: 'users/sessions',
         registrations: "users/registrations", 
         passwords: "users/passwords", 
         unlocks: "users/unlocks"
      }

 
end
