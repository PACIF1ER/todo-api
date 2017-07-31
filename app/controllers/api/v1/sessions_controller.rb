class API::V1::SessionsController < API::BaseController

  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if user.email_confirmation
      if user
        token = user.generate_auth_token
        render(
          json: { message: "User logged in", auth_token: token },
          status: 200
        )
      else
        render(
          json: { message: "Unauthorized" },
          status: 422
        )
      end
    else
      render(
        json: { message: "Unauthorizkljjluh8uhjuyhed" },
        status: 422
      )
    end
  end
end
