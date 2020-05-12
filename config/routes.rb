Rails.application.routes.draw do
  scope "v1" do
    resources :users

    post "/users/signin", to: "users#signin"
    put "/users/:id/avatar", to: "users#attach_avatar"
  end
end
