Rails.application.routes.draw do
  namespace "v1" do
    resources :users
    
    post "/users/signup", to: "auth#sign_up"
    post "/users/signin", to: "auth#sign_in"
    post "/users/signout", to: "auth#sign_out"
    put "/users/:id/avatar", to: "users#attach_avatar"
  end
end
