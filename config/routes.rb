require 'apartment/elevators/subdomain'

class ExcludedSubdomainConstraint
  def self.matches?(request)
    request.subdomain.present? && !Apartment::Elevators::Subdomain.excluded_subdomains.include?(request.subdomain)
  end
end



Rails.application.routes.draw do
  constraints ExcludedSubdomainConstraint do
    resources :projects
    devise_for :users
    get 'home/index'
    root 'home#index'
  end
end

