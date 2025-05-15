class ApplicationController < ActionController::Base
  include Auth

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  inertia_share auth: -> {
    {
      user:
        current_user.as_json(
          only: %i[id email username]
        ),
    }
  }
end
