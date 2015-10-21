class TokenEnvironmentsController < ApplicationController

  def index
    @token_environments = TokenEnvironment.all

    render :index
  end

  def destroy
  end


end
