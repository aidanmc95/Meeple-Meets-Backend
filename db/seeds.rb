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

user1 = User.create(username:"aidanmc95", password:"asdf", BGGusername:"aidanmc95")
user2 = User.create(username:"aidanmc1", password:"asdf1", BGGusername:"aidanmc1")
user3 = User.create(username:"aidanmc2", password:"asdf2", BGGusername:"aidanmc2")
user4 = User.create(username:"aidanmc3", password:"asdf3", BGGusername:"aidanmc3")

gameids = BGG.scraper("https://boardgamegeek.com/browse/boardgame")

# gameids = [174430, 161936, 224517, 167791, 182028, 233078, 220308, 187645, 12333, 193738, 169786, 115746, 162886, 84876, 120677, 173346, 124361, 28720]

gameids = [174430, 161936, 224517, 167791]

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

my_game1 = MyGame.create(user: user1, boardgame: boardgame1)
my_game2 = MyGame.create(user: user1, boardgame: boardgame2)
my_game3 = MyGame.create(user: user1, boardgame: boardgame3)
my_game4 = MyGame.create(user: user1, boardgame: boardgame4)
my_game5 = MyGame.create(user: user2, boardgame: boardgame1)
my_game6 = MyGame.create(user: user3, boardgame: boardgame1)
my_game7 = MyGame.create(user: user4, boardgame: boardgame1)

meet1 = Meet.create(user: user1, description: "description", location:"location", size: "10", name:"Just hangin' out", when:DateTime.strptime("2007-11-19T08:37", "%FT%R"), zip:98101)
meet2 = Meet.create(user: user2, description: "description", location:"location", size: "11", name: "Meeting new bgg’ers", when:DateTime.strptime("2007-11-19T08:37", "%FT%R"), zip:98101)

Invite.create(meet: meet1, user: user2, status: true)
Invite.create(meet: meet1, user: user3, status: true)
Invite.create(meet: meet1, user: user4, status: false)

BroughtGame.create(meet: meet1, my_game: my_game1)
BroughtGame.create(meet: meet1, my_game: my_game2)
BroughtGame.create(meet: meet1, my_game: my_game3)