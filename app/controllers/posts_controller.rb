class PostsController < ApplicationController
    before_action :signed_in?
    before_action :is_author?, except: [:new, :create, :show]

    def is_author?
      @post = Post.find(params[:id])
      current_user.id == post.author_id
    end


    def new
      @post = Post.new
      @post.sub_id = params[:sub_id]
      render :new
    end

    def create

    end

    def edit

    end

    def show

    end

    def update

    end

    def destroy

    end


    private
      def post_params
        params.require(:post).permit(:sub_id,:author_id,:title,:content,
        :url)
      end

end
