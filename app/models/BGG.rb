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
    
        url = "https://www.boardgamegeek.com/xmlapi2/thing?id=#{gameid}"
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

    def self.addLibrary(gameid)
        gameinfo = getGame(gameid)
        # add game to database
        # sleep 2
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