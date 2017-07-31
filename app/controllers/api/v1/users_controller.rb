class API::V1::UsersController < API::BaseController
  def create 
    @user = User.new(user_params)

    # @user = User.create(user_params)
    if @user.save
      # token = user.generate_auth_token
      
      
      # render(
      #   json: { message: "User created", auth_token: token },
      #   status: 200
      # )
        origin = request.headers['origin']
       UserMailer.registration_confirmation(@user, origin).deliver
      render(
        json: { message: "confirm " },
        status: 200
      )



    else
      render(
        json: { message: "#{@user.errors.full_messages}" },
        status: 422
      )
    end
  end


  def confirm_email 
    user = User.find_by_email_token(params[:id])

    if user
      user.email_activate
      render json: {
        qwe: user,
        message: 'Email address is Confirmed'
      }, status: 200
    else
      user.email_activate
      render json: {
        qwe: user,
        message: 'Email adres has all ready confirmed'
      }, status: 207
    end 
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
