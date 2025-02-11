# Clear existing data
User.destroy_all
Book.destroy_all
Borrowing.destroy_all

# Create users with African names
users = [
  { name: "Kwame Mensah", email: "kwame@example.com" },
  { name: "Amina Yusuf", email: "amina@example.com" },
  { name: "Chidi Okafor", email: "chidi@example.com" },
  { name: "Babatunde Ojo", email: "babatunde@example.com" },
  { name: "Nia Maseko", email: "nia@example.com" }
]

users.each do |user|
  User.create!(user.merge(password: "password", password_confirmation: "password"))
end

# Create tech books
books = [
  { title: "The Pragmatic Programmer", author: "Andrew Hunt & David Thomas", isbn: "978-0135957059" },
  { title: "Clean Code", author: "Robert C. Martin", isbn: "978-0132350884" },
  { title: "Design Patterns", author: "Erich Gamma et al.", isbn: "978-0201633610" },
  { title: "You Don't Know JS", author: "Kyle Simpson", isbn: "978-1491904244" },
  { title: "Eloquent JavaScript", author: "Marijn Haverbeke", isbn: "978-1593279509" },
  { title: "JavaScript: The Good Parts", author: "Douglas Crockford", isbn: "978-0596517748" },
  { title: "Python Crash Course", author: "Eric Matthes", isbn: "978-1593279288" },
  { title: "Automate the Boring Stuff with Python", author: "Al Sweigart", isbn: "978-1593279929" },
  { title: "Fluent Python", author: "Luciano Ramalho", isbn: "978-1491946009" },
  { title: "Grokking Algorithms", author: "Aditya Bhargava", isbn: "978-1617292231" },
  { title: "The Phoenix Project", author: "Gene Kim", isbn: "978-0988262508" },
  { title: "The Mythical Man-Month", author: "Frederick P. Brooks Jr.", isbn: "978-0201835951" },
  { title: "Refactoring", author: "Martin Fowler", isbn: "978-0134757599" },
  { title: "Code Complete", author: "Steve McConnell", isbn: "978-0735619678" },
  { title: "Continuous Delivery", author: "Jez Humble & David Farley", isbn: "978-0321601919" },
  { title: "Domain-Driven Design", author: "Eric Evans", isbn: "978-0321125217" },
  { title: "Release It!", author: "Michael T. Nygard", isbn: "978-1680502398" },
  { title: "The Art of Scalability", author: "Martin L. Abbott", isbn: "978-0137030422" },
  { title: "Elixir in Action", author: "Saša Jurić", isbn: "978-1617295027" },
  { title: "Programming Elixir", author: "Dave Thomas", isbn: "978-1680502992" }
]

books.each do |book|
  Book.create!(book.merge(available: true))
end

puts "✅ Seed data successfully added!"
