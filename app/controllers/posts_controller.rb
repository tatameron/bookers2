class PostsController < ApplicationController
    before_action :authenticate_user!

    def new
       @post = Post.new
   end

   def create
       @post = Post.new(post_params)
       @post.user_id = current_user.id
       if @post.save
        redirect_to post_path(@post)
    else
        redirect_to posts_path
    end
end

def edit
    @post = Post.find(params[:id])
     if @post.user != current_user
        redirect_to posts_path
end
  end

def update
    post = Post.find(params[:id])
    if post.update(post_params)
        flash[:notice] = "Books was succesfully updated."
        redirect_to post_path(post)
    end
end

def destroy
    post = Post.find(params[:id])
    if post.destroy
        flash[:notice] = "Books was succesfully deleted."
        redirect_to posts_path
    end
end

def show
	@post = Post.find(params[:id])
    @posts = Post.new
	@users = User.find(current_user.id)
    @user = current_user
end

def index
	@posts = Post.all
    @users = User.all
    @user = current_user
    @post =Post.new
    # @user =User.find(params[:id])
end


private
def post_params
    params.require(:post).permit(:books_name, :text_id, :caption, :user_id)
end
end
