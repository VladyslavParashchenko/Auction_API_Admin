Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root :to => "admin/lots#index"
end
