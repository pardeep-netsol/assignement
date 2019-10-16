class RegistrationsController < Devise::RegistrationsController

  before_action :verify_secret_code, only: :create

  def new
    @secret_codes = SecretCode.where(user_id: nil).order('id asc').limit(10)
    super
  end

  def create
    @user = User.new(user_params.except(:secret_code))
    if @user.save
      token = SecretCode.find(params[:user][:secret_code])
      token.update_attributes(user_id: @user.id)
      redirect_to new_user_session_path
    else
      @secret_codes = SecretCode.where(user_id: nil).order('id asc').limit(10)
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :secret_code)
  end

  def verify_secret_code
    return unless params[:user][:secret_code].blank?
    flash[:alert] = 'Invalid Secret code'
    redirect_to  new_user_registration_path
  end
end
