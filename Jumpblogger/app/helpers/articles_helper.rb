module ArticlesHelper
  
  def article_params
    params.require(:article).permit(:body, :title)
  end
end
