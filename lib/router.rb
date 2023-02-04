class Router

    #On veut qu'un "Router.new" lancé par app.rb, crée automatique une instance "@controller"
    def initialize
        @controller = Controller.new
    end

    #rappelle-toi que l'on fait "Router.new.perform" dans app.rb => après initialize, on définit donc perform.
    def perform
        puts "WeLcoMe!"

        #menu
        while true
            puts "Select 1~4"
            puts "1 : New article"
            puts "2 : All articles"
            puts "3 : Destroy article"
            puts "4 : Exit"
            print "> "
            #input user
            params = gets.chomp.to_i

            case params
            when 1
                puts "New article!"
                @controller.create_article
            when 2
                puts "All article!"
                @controller.index_articles
            when 3
                puts "Destroy article!"
                @controller.destroy_article
            when 4
                puts "See u Soon"
                #Ce "break" permet de sortir de la boucle while. C'est même la seule façon d'en sortir.
                break 
            else
                puts "bad input"
            end
        end
    end

end