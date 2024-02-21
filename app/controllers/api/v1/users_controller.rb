class Api::V1::UsersController < ApplicationController
    def create
        user = User.create(user_params)
        if user.save
            render json: UserSerializer.new(user)
        else

        end
    end

    private

    def user_params
        params.require(:user).permit(:id, :name, :password_digest)
    end
end