require "rails_helper"

RSpec.describe "Books", type: :request do
  describe "POST /books" do
    it "adds a book with an author" do
      post books_path, params: {
        book: {
          title: "Dune",
          author: "Frank Herbert",
          price: 19.99,
          published_date: Date.new(1965, 8, 1)
        }
      }

      book = Book.last

      expect(book.author).to eq("Frank Herbert")
    end

    it "adds a book with a price" do
      post books_path, params: {
        book: {
          title: "Dune",
          author: "Frank Herbert",
          price: 19.99,
          published_date: Date.new(1965, 8, 1)
        }
      }

      book = Book.last

      expect(book.price.to_f).to eq(19.99)
    end

    it "adds a book with a published date" do
      date = Date.new(1965, 8, 1)

      post books_path, params: {
        book: {
          title: "Dune",
          author: "Frank Herbert",
          price: 19.99,
          published_date: date
        }
      }

      book = Book.last

      expect(book.published_date).to eq(date)
    end

    it "adds a book successfully" do
      expect {
        post books_path, params: {
          book: {
            title: "Dune",
            author: "Frank Herbert",
            price: 19.99,
            published_date: Date.new(1965, 8, 1)
          }
        }
      }.to change(Book, :count).by(1)

      expect(response).to redirect_to(books_path)

      follow_redirect!

      expect(response.body).to include("Book was successfully added.")
    end

    it "does not add a book with a blank title" do
      expect {
        post books_path, params: {
          book: {
            title: "",
            author: "Frank Herbert",
            price: 19.99,
            published_date: Date.new(1965, 8, 1)
          }
        }
      }.not_to change(Book, :count)

      expect(response).to have_http_status(:unprocessable_content)

      expect(response.body).to include("Title cannot be blank")
    end
  end
end