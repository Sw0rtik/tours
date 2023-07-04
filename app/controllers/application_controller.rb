class ApplicationController < ActionController::Base
  $country_id =
    protect_from_forgery with: :exception
end
