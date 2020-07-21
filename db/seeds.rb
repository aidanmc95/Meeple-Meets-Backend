# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Category.destroy_all
Mechanic.destroy_all
Designer.destroy_all
Publisher.destroy_all
Boardgame.destroy_all
MyGame.destroy_all

user1 = User.create(username:"aidanmc95", password:"asdf")
user2 = User.create(username:"aidanmc1", password:"asdf1")
user3 = User.create(username:"aidanmc2", password:"asdf2")
user4 = User.create(username:"aidanmc3", password:"asdf3")

gameids = BGG.scraper("https://boardgamegeek.com/browse/boardgame")

gameids = [174430, 161936, 224517, 167791, 182028]

gameids.each do |gameid|
    BGG.addBoardgame(gameid)
end

boardgames = Boardgame.all

boardgame1 = boardgames[0]
boardgame2 = boardgames[1]
boardgame3 = boardgames[2]
boardgame4 = boardgames[3]

Rating.create(user: user1, boardgame: boardgame1, rating: 5)
Rating.create(user: user2, boardgame: boardgame1, rating: 3)
Rating.create(user: user3, boardgame: boardgame1, rating: 5)
Rating.create(user: user3, boardgame: boardgame2, rating: 5)

MyGame.create(user: user1, boardgame: boardgame1)
MyGame.create(user: user1, boardgame: boardgame2)
MyGame.create(user: user1, boardgame: boardgame3)
MyGame.create(user: user1, boardgame: boardgame4)
MyGame.create(user: user2, boardgame: boardgame1)
MyGame.create(user: user3, boardgame: boardgame1)
MyGame.create(user: user4, boardgame: boardgame1)

meet1 = Meet.create(user: user1, description: "description", location:"location", size: "size", name:"Just hangin' out", when:DateTime.strptime("2007-11-19T08:37", "%FT%R"))
meet2 = Meet.create(user: user2, description: "description", location:"location", size: "size", name: "Meeting new bgg’ers", when:DateTime.strptime("2007-11-19T08:37", "%FT%R"))

Invite.create(meet: meet1, user: user2, status: true)
Invite.create(meet: meet1, user: user3, status: true)
Invite.create(meet: meet1, user: user4, status: false)

BroughtGame.create(meet: meet1, boardgame: boardgame1)
BroughtGame.create(meet: meet1, boardgame: boardgame2)
BroughtGame.create(meet: meet1, boardgame: boardgame3)