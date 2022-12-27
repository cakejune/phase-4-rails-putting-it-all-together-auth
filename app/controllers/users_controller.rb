class UsersController < ApplicationController
# before_action :authorize
# # skip_before_action :authorize, only: [:create]
def create 
    new_user = User.create(user_params)
    if new_user.valid?
        session[:user_id] = new_user.id
        render json: new_user, status: :created
    else 
        render json: {errors: new_user.errors.full_messages}, status: :unprocessable_entity
    end
end

def show
    user = User.find_by(id: session[:user_id])
    if user
        render json: user, status: :created
else
    render json: {error: "Unauthorized"}, status: :unauthorized
end
end


private

def user_params
params.permit(:username, :password, :password_confirmation, :image_url, :bio)
end









end











# before_action :authorize
# skip_before_action :authorize, only: [:create]


# def create 
# new_user = User.create(user_params)
# if new_user.valid?
#     session[:user_id] = new_user.id
#     render json: new_user, status: :created
# else
#     render json: {errors: new_user.error.full_messages}, status: :unprocessable_entity
# end
# end

# private

# def authorize
# return render json: {error: "You are unauthorized"}, status: :unauthorized unless session.include? :user_id
# end

# def user_params
# params.permit(:username, :password, :password_confirmation)
# end
