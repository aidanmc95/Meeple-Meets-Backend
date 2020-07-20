class BGG
    def self.scraper(url)
        output = Set.new() 
    
        doc = Nokogiri::HTML(open(url)) do |config|
            config.strict.noblanks
        end
        links = doc.css("#maincontent").css('a')
    
        links.each do |link|
    
            id = link.attribute('href').to_s.split('/')[2].to_i
            if id > 0
                output.add(id)
            end
        end
    
        return output
    end
    
    def self.getGame(gameid)
        output = {BGGid: gameid, category:[], mechanic:[], publisher:[], designer:[]}
    
        url = "https://www.boardgamegeek.com/xmlapi2/thing?stats=1&id=#{gameid}"
        response = RestClient.get(url)
        doc = Nokogiri::XML(response) do |config|
            config.strict.noblanks
        end
    
        doc.css('item').children.each do |thing|
            if thing.attribute("type").to_s == "primary"
                output[:name] = thing.attribute("value").to_s
            end
            if thing.attribute("type").to_s == "boardgamecategory"
                output[:category].push(thing.attribute("value").to_s)
            end
            if thing.attribute("type").to_s == "boardgamemechanic"
                output[:mechanic].push(thing.attribute("value").to_s)
            end
            if thing.attribute("type").to_s == "boardgamepublisher"
                output[:publisher].push(thing.attribute("value").to_s)
            end
            if thing.attribute("type").to_s == "boardgamedesigner"
                output[:designer].push(thing.attribute("value").to_s)
            end
        end

        doc.css("rank").each do |thing|
            if thing.attribute("friendlyname").to_s == "Board Game Rank"
                output[:bggrank] = thing.attribute("value").to_s
            end
        end

        output[:bggrating] = doc.css("average").attribute("value").to_s
        output[:descrition] = doc.css("description").children.to_s
        output[:thumbnail] = doc.css("thumbnail").children.to_s
        output[:image] = doc.css("image").children.to_s
        output[:playtime] = doc.css("playingtime").attribute("value").to_s
        output[:minplayers] = doc.css("minplayers").attribute("value").to_s
        output[:maxplayers] = doc.css("maxplayers").attribute("value").to_s
    
        return output
    end
    
    def self.getLibrary(username)
        output = [] 
    
        doc = Nokogiri::HTML(open("https://www.boardgamegeek.com/xmlapi2/collection?username=#{username}")) do |config|
            config.strict.noblanks
        end
    
        doc.css("item").each do |item|
            if item.css("status").attribute("own").to_s != "0"
                output.push(item.attribute("objectid").to_s)
            end
        end
        
        return output
    end

    def self.addBoardgame(gameid)
        if !Boardgame.find_by(BGGid: gameid) 
            gameinfo = BGG.getGame(gameid)
    
            boardgame = Boardgame.create(BGGid: gameid, title: gameinfo[:name], description: gameinfo[:descrition], thumbnail: gameinfo[:thumbnail], image: gameinfo[:image], playtime: gameinfo[:playtime], minplayers: gameinfo[:minplayers], maxplayers: gameinfo[:maxplayers], BGGrating: gameinfo[:bggrating], BGGrank: gameinfo[:bggrank])
    
            gameinfo[:category].each do |category|
                current = Category.find_or_create_by(category: category)
                GameCategory.create(boardgame: boardgame, category: current)
            end
            gameinfo[:mechanic].each do |mechanic|
                current = Mechanic.find_or_create_by(mechanic: mechanic)
                GameMechanic.create(boardgame: boardgame, mechanic: current)
            end
            gameinfo[:designer].each do |designer|
                current = Designer.find_or_create_by(name: designer)
                GameDesigner.create(boardgame: boardgame, designer: current)
            end
            gameinfo[:publisher].each do |publisher|
                current = Publisher.find_or_create_by(name: publisher)
                GamePublisher.create(boardgame: boardgame, publisher: current)
            end

            sleep 2
        end
    end

    def self.searchBGG(title)
        output = []

        url = "https://www.boardgamegeek.com/xmlapi2/search?query=#{title}"

        response = RestClient.get(url)
        doc = Nokogiri::XML(response) do |config|
            config.strict.noblanks
        end

        doc.css('item').each do |thing|
            if thing.attribute("type").to_s == "boardgame"
                output.push(thing.attribute("id").to_s)
            end
        end

        return output
    end
end