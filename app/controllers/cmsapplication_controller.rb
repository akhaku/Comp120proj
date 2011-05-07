class CmsapplicationController < ActionController::Base
  before_filter :authenticate_user!
  layout "cmsapplication"
  protect_from_forgery
end
