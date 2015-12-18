class PostsController < ApplicationController
    before_action :signed_in?
    before_action :is_author?, except: [:new, :create, :show]

    def is_author?
      @post = Post.find(params[:id])
      current_user.id == @post.author_id
    end


    def new
      @subs = Sub.all
      @post = Post.new
      render :new
    end

    def create
      @post = current_user.posts.create(post_params)
      if @post.save!
        redirect_to post_url(@post.id)
      else
        flash.now[:errors] = "Invalid Post"
        render :new
      end
    end

    def edit
      @subs = Sub.all
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
        params.require(:post).permit(
                                      :author_id,
                                      :title,
                                      :content,
                                      :url,
                                      sub_ids: [])
      end

end
