Rails.application.routes.draw do
  root 'home#top'
  get 'top' => "home#top"
  get 'show' => "home#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
