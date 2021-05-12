# frozen_string_literal: true

# == Route Map
#

Rails.application.routes.draw do
  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
      resources :authors, only: %i[index create update destroy show]
      resources :books, only: %i[index create update destroy show]
      resources :book_copies, only: %i[index create update destroy show]
      resources :users, only: %i[index create update destroy show]
    end
  end
end
