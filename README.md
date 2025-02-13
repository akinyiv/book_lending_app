# README

This README provides the necessary steps to set up and run the **Book Lending App**, a Ruby on Rails 8 application for managing book lending between users.

## Prerequisites
Ensure you have the following installed:
- **Ruby version:** `3.2.2` (or latest stable version)
- **Rails version:** `8.x`
- **Database:** PostgreSQL (default) or MySQL
- **Bundler:** `gem install bundler`
- **Node.js** & **Yarn** (for managing JavaScript assets)

## Getting Started

### 1. Clone the repository
```sh
git clone https://github.com/akinyiv/book_lending_app.git
cd book_lending_app
```

### 2. Install dependencies
```sh
bundle install
yarn install
```

### 3. Configure the database
Update `config/database.yml` with your database credentials. Then, run:
```sh
rails db:create db:migrate db:seed
```

### 4. Start the application
```sh
rails server
```
Open `http://localhost:3000` in your browser.

## Features
- **User Authentication** using Rails 8’s default authentication
- **Book Listing Page** displaying available books
- **Book Details Page** with borrowing option
- **User Profile Page** listing borrowed books
- **Borrowing System** with a due date (2 weeks from borrowing date)
- **Return System** for returning borrowed books
- **Model Validations** (title, author, ISBN presence & uniqueness)
- **Error Handling** (preventing borrowing of an already borrowed book)

## Running Tests
Run the test suite using:
```sh
rails test
```

## Services Used
- **Devise** (for authentication)
- **Active Record Validations** (for model constraints)

## Deployment
For production deployment, configure credentials and use:
```sh
git push heroku main
heroku run rails db:migrate
```

## Contributing
1. Fork the repository
2. Create a feature branch (`git checkout -b feature-branch`)
3. Commit your changes (`git commit -m 'Add new feature'`)
4. Push to the branch (`git push origin feature-branch`)
5. Open a Pull Request

## License
This project is licensed under the MIT License.

## Contact
For issues or contributions, contact [akinyiv](akinyivee10@gmail.com).

