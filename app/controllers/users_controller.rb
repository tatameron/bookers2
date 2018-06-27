class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
  	@user = User.find(params[:id])
  	@post = Post.new
  	@posts = @user.posts
 	# @post = @user.post.page(params[:page])
 end
 def edit
  @user = User.find(params[:id])
  if @user != current_user
    redirect_to users_path
  end
end
def index
	@users = User.all
	@user = current_user
	@post = Post.new
end
def update
  @user = User.find(params[:id])
  @user.update(user_params)
  redirect_to user_path(@user.id)
end
private
def user_params
	params.require(:user).permit(:name,:profile_image,:introduction)

end
end