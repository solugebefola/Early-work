class PostsController < ApplicationController
    before_action :signed_in?
    before_action :is_author?, except: [:new, :create, :show]

    def is_author?
      @post = Post.find(params[:id])
      current_user.id == @post.author_id
    end


    def new
      @post = Post.new
      @post.sub_id = params[:sub_id]
      render :new
    end

    def create
      @post = Post.new(post_params)
      @post.sub_id = params[:post][:sub_id]
      @post.author_id = current_user.id
      if @post.save!
        redirect_to post_url(@post.id)
      else
        flash.now[:errors] = "Invalid Post"
        render :new
      end
    end

    def edit
      @post = Post.find(params[:id])
      render :edit
    end

    def show
      @post = Post.find(params[:id])
      render :show
    end

    def update
      @post = Post.find(params[:id])
      @post.update(post_params)
      render :show
    end

    def destroy

    end


    private
      def post_params
        params.require(:post).permit( :sub_id,
                                      :author_id,
                                      :title,
                                      :content,
                                      :url)
      end

end
