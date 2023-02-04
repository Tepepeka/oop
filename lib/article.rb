class Article

  attr_reader :author, :content

  def initialize(author,content)
    @author = author
    @content = content
  end


  def save
    CSV.open("db/article.csv", "a") do |csv|
      csv << [@author, @content]
    end
    puts "Saved as CSV!"
  end


  def self.all
    # 1)création d'un array vide qui s'appelle all_articles
    all_articles = []
    # 2)chaque ligne de ton CSV.each do |ligne|
    CSV.foreach("db/article.csv") do |row|
      # 2-a) aticle_provisoire = aticle.new(paramètres de la ligne) - permet de créer un objet aticle
      article_provisoire = Article.new(row[0],row[1])
      # 2-b) all_articles << aticle_provisoire - permet de rajouter le aticle provisoire au array
      all_articles << article_provisoire
    end
    return all_articles
  end

  
  def self.destroy_article(index)
    # 1) j'ouvre ma table csv ds un array
    articles = CSV.read('db/article.csv')
    # 2) je delete ds mon array au bon index
    articles.delete_at(index-1)
    # 3) j'ouvre mon fichier CSV
    CSV.open('db/article.csv', 'w') do |csv|
      # 4) je fais une boucle pr push tous mes articles restants ds le CSV
      articles.each do |article|
        csv << article
      end
    end
  end

end