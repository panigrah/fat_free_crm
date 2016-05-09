module CRM
  class ApplicationController < ::ApplicationController
    layout "n/application"

    def discard
    end

    def current_user
      user = User.first
      params[:current_user] = user
      user
    end
  end
end
