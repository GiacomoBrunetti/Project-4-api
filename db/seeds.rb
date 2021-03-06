[User, Event, Ticket, Comment, Conversation, Message].each do |model|
  ActiveRecord::Base.connection.execute("TRUNCATE #{model.table_name} RESTART IDENTITY CASCADE")
end

mark = User.create!(username: "Mark", email: "look@me.com", image: "https://conor-bucket.s3.amazonaws.com/77ac39143569a2a6729437c21b56bf5b.jpeg", bio: "Legend", password: "password", password_confirmation: "password")
conor = User.create!(username: "Conor", email: "heen@slice", image: "https://conor-bucket.s3.amazonaws.com/77ac39143569a2a6729437c21b56bf5b.jpeg", bio: "Irish Code Monkey", password: "password", password_confirmation: "password")
jack = User.create!(username: "Giacomo", email: "jack@mo", image: "https://conor-bucket.s3.amazonaws.com/77ac39143569a2a6729437c21b56bf5b.jpeg", bio: "Italian Code Monkey", password: "password", password_confirmation: "password")

grad = Event.create!(name: "WDI 25 Celebration", location: "Black Horse, Leman Street, Whitechapel, London, United Kingdom", latitude: 51.5134774, longitude: -0.07031959999994797, date: Date.new(2017, 4, 25), description: "Massive knees up", max_tickets: 32, price: 0.00, image: "https://conor-bucket.s3.amazonaws.com/77ac39143569a2a6729437c21b56bf5b.jpeg", user: conor)
organised = Event.create(name: "Graduation", location: "General Assembly London, Whitechapel High Street, London, United Kingdom", latitude: 51.5152149, longitude: -0.07233180000002903, date: Date.new(2017, 4, 28), description: "Piss-up in a brewery", max_tickets: 26, price: 5.20, image: "https://conor-bucket.s3.amazonaws.com/77ac39143569a2a6729437c21b56bf5b.jpeg", user: mark)

Ticket.create!(event: grad, user: jack)
Ticket.create!(event: organised, user: mark)
Ticket.create!(event: organised, user: conor)
Ticket.create!(event: organised, user: jack)

Comment.create!(event: grad, body: "I bring the partaay!", user: jack)

conv = Conversation.create!(sender: jack, receiver: conor)
conv2 = Conversation.create!(sender: jack, receiver: mark)

mess = Message.create!(body: "Mark is baad at coding...keep it a secret though", user: jack, conversation: conv)
mess1 = Message.create!(body: "Yes I agree. ", user: conor, conversation: conv)
mess2 = Message.create!(body: "Conor is bad at coding..keep it a secret though", user: jack, conversation: conv2)
