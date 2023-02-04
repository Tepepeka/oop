class Controller

    attr_accessor :view

    def initialize
        @view = View.new
    end

    def create_article
        params = @view.create_article
        article = Article.new(params[:author], params[:content])
        article.save
    end

    def index_articles
        params = Article.all
        @view.index_articles(params)
    end

    def destroy_article
        params = @view.destroy_article
        Article.destroy_article(params)
    end

end