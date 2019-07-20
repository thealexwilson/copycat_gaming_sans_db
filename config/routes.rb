Rails.application.routes.draw do
  resources :character_builder, only: %i(index create) do
    collection do
      get :calculated
    end
  end
end
