class PostsController < ApplicationController
	before_action :set_post, except: [:index, :new, :create]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			redirect_to post_path(@post)
		else
			render :new
		end
	end

	def show
		@comment = Comment.new
	end

	def edit; end

	def update
		if @post.update(post_params)
			redirect_to post_path(@post)
		else
			render :edit
		end
	end

	def destroy
		@post.destroy

		redirect_to posts_path
	end

	private

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :content)
	end
end
