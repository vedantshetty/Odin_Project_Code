module ArticlesHelper

  def whitelisted_article_params
    params.require(:article).permit(:title,:body)
  end
end
