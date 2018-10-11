class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:show, :index]
	before_action :get_post, only: [:show, :edit, :update,:destroy]
	before_action :get_user_post, only: [:edit, :update, :destroy]
	before_action :check_post_user, only: [:edit, :update, :destroy]

	def index
		@posts = Post.all
	end

	def create
		@post = current_user.posts.new(post_params)
		# @post = Post.new(post_params)
		if @post.save
			redirect_to posts_path
		else
			render :new
		end

	end
  
  def new
  	@post = current_user.posts.build
  end

  def show
  end

  def edit
  end

  def update
  	if @post.update_attributes(post_params)
  		redirect_to posts_path
  	else
  		render :edit
  	end

  end

  def destroy
  	if @post.destroy
  		redirect_to posts_path
  	else
  		render :new
  	end
  end

  def post_params
  	params.require(:post).permit(:title, :description, :image)
  	# params.require(:post).permit(:description, :user_id)
  end

  def get_post
  	@post=Post.find(params[:id])
  end

  def get_user_post
    @post = current_user.posts.find(params[:id])
  end
  
  def check_post_user
    if @post.user != current_user
      redirect_to posts_path
    end
  end
end
