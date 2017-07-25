class Users::SessionsController < Devise::SessionsController
#  before_action :configure_sign_in_params, only: [:create]

  def new
    super
  end

  # POST /resource/sign_in
  def create
    #元の認証ロジック
    #self.resource = warden.authenticate!(auth_options)

    #emailだけでログインできるように変更
    self.resource = User.where(email: params[:user]['email']).first

    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  def destroy
    super
  end

end
