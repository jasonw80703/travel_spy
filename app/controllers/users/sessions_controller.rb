# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  # GET /login
  def new
    render inertia: 'Auth/Login', props: {}
  end

  # POST /login
  def create
    self.resource = warden.authenticate(auth_options)

    if resource
      sign_in(resource_name, resource)
      redirect_to after_sign_in_path_for(resource)
    else
      user = User.find_by(email: params.dig(:user, :email))

      if user
        render inertia: 'Auth/Login', props: {
          errors: ['Invalid password'],
          email: params.dig(:user, :email)
        }, status: :unauthorized
      else
        render inertia: 'Auth/Login', props: {
          errors: ['Invalid email or password'],
          email: params.dig(:user, :email)
        }, status: :unauthorized
      end
    end
  end

  # DELETE /logout
  def destroy
    super
  end
end
