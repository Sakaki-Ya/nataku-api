Rails.application.routes.draw do
  namespace "v1" do
    resources :users, :posts
    
    post "/users/sign_up", to: "auth#sign_up"
    post "/users/sign_in", to: "auth#sign_in"
    post "/users/sign_out", to: "auth#sign_out"
    put "/users/:id/avatar", to: "users#attach_avatar"
  end
end
