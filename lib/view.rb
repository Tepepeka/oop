class View


    def create_article
        puts "ur name?"
        author = gets.chomp.to_s
        puts "ur article?"
        content = gets.chomp.to_s
        puts "Thx @#{author},ur article is save!"
        return params = { content: content, author: author }
    end


    def index_articles(array)
        array.each do |article|
            puts "#{article.content} by @#{article.author}"
        end
    end


    def destroy_article
        index = 0
        puts "Choose article to destroy!"
        CSV.foreach("db/article.csv") do |article|
            index +=1
            puts "#{index}_#{article[0]}"
        end
        print "> "
        user_input = gets.chomp.to_i
        puts index
        puts user_input
            if user_input > 0 && user_input <= index
                puts "U choose article #{user_input}!"
                return user_input  
            else
                puts "Select an article please!"
                return user_input
            end
    end

end