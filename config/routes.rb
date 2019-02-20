Rails.application.routes.draw do
  namespace 'api' do
    resources :organizations, :people
  end
end
