# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "TVGod420", email: "tvgod420@email.com", password: "password", profile_picture: "https://static.turbosquid.com/Preview/2019/02/18__04_59_25/Crash_Test_Dummy_Rigged_mb_00.jpg5B1ADE98-2892-494F-9EB2-F0B49A1BE375Default.jpg", bio: "I am the god of tv B)")
User.create(username: "xXxdark_lordxXx", email: "edgy@email.com", password: "password", profile_picture: "https://static.turbosquid.com/Preview/2019/02/18__04_59_25/Crash_Test_Dummy_Rigged_mb_00.jpg5B1ADE98-2892-494F-9EB2-F0B49A1BE375Default.jpg", bio: "Find me on deviantart!")
User.create(username: "username", email: "test@email.com", password: "password", profile_picture: "https://static.turbosquid.com/Preview/2019/02/18__04_59_25/Crash_Test_Dummy_Rigged_mb_00.jpg5B1ADE98-2892-494F-9EB2-F0B49A1BE375Default.jpg", bio: "I am a real user :)))))")

Media.create(omdb_id: "tt0417299", title: "Avatar: The Last Airbender", imdb_rating: 9.2, released: "21 Feb 2005", plot: "In a war-torn world of elemental magic, a young boy reawakens to undertake a dangerous mystic quest to fulfill his destiny as the Avatar, and bring peace to the world", poster: "https://m.media-amazon.com/images/M/MV5BODc5YTBhMTItMjhkNi00ZTIxLWI0YjAtNTZmOTY0YjRlZGQ0XkEyXkFqcGdeQXVyODUwNjEzMzg@._V1_SX300.jpg")
Media.create(omdb_id: "tt0386676", title: "The Office", imdb_rating: 8.9, released: "24 Mar 2005", plot: "A mockumentary on a group of typical office workers, where the workday consists of ego clashes, inappropriate behavior, and tedium.", poster: "https://m.media-amazon.com/images/M/MV5BMDNkOTE4NDQtMTNmYi00MWE0LWE4ZTktYTc0NzhhNWIzNzJiXkEyXkFqcGdeQXVyMzQ2MDI5NjU@._V1_SX300.jpg")
Media.create(omdb_id: "tt1695360", title: "The Legend of Korra", imdb_rating: 8.4, released: "14 Apr 2012", plot: "Avatar Korra fights to keep Republic City safe from the evil forces of both the physical and spiritual worlds.", poster: "https://m.media-amazon.com/images/M/MV5BNTRmM2E5OWYtYmYzMi00MDRiLTg2ZTYtZGQyZTNhZDMxYTgzXkEyXkFqcGdeQXVyODUwNjEzMzg@._V1_SX300.jpg")
Media.create(omdb_id: "tt8688814", title: "The Dragon Prince", imdb_rating: 8.4, released: "14 Sep 2018", plot: "Two human princes forge an unlikely bond with the elfin assassin sent to kill them, embarking on an epic quest to bring peace to their warring lands.", poster: "https://m.media-amazon.com/images/M/MV5BMjA5MjEwODU1MV5BMl5BanBnXkFtZTgwNzk0MzA5NTM@._V1_SX300.jpg")
Media.create(omdb_id: "tt1439629", title: "Community", imdb_rating: 8.5, released: "17 Sep 2009", plot: "A suspended lawyer is forced to enroll in a community college with an eccentric staff and student body.", poster: "https://m.media-amazon.com/images/M/MV5BNDQ5NDZiYjktZmFmMy00MjAxLTk1MDktOGZjYTY5YTE1ODdmXkEyXkFqcGdeQXVyNjcwMzEzMTU@._V1_SX300.jpg")

Comment.create(text: "If you want a similar feel to Avatar, look no further than legend of korra! Though for many it falls flat, it's a very competant continuation.", similarity: 8, enjoyability: 7, media_id: 1, user_id: 1, suggested_media_id: 3)
Comment.create(text: "Though it definitely differs in tone and feel, the dragon prince is a must watch that most Avatar fans will enjoy.", similarity: 7, enjoyability: 9, media_id: 1, user_id: 2, suggested_media_id: 4)
Comment.create(text: "Though quite different, community is better than the office.", similarity: 4, enjoyability: 10, media_id: 2, user_id: 3, suggested_media_id: 5)

Vote.create(user_id: 2, comment_id: 1, value: -1)
Vote.create(user_id: 1, comment_id: 2, value: 1)
Vote.create(user_id: 1, comment_id: 3, value: 1)
Vote.create(user_id: 2, comment_id: 3, value: 1)