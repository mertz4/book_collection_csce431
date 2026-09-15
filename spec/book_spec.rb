require "rails_helper"

RSpec.describe Book, type: :model do
  it "is valid with all attributes" do
    book = Book.new(
      title: "Dune",
      author: "Frank Herbert",
      price: 19.99,
      published_date: Date.new(1965, 8, 1)
    )

    expect(book).to be_valid
  end

  it "is not valid without a title" do
    book = Book.new(
      title: "",
      author: "Frank Herbert",
      price: 19.99,
      published_date: Date.new(1965, 8, 1)
    )

    expect(book).not_to be_valid
  end

  it "is not valid without an author" do
    book = Book.new(
      title: "Dune",
      author: "",
      price: 19.99,
      published_date: Date.new(1965, 8, 1)
    )

    expect(book).not_to be_valid
  end

  it "is not valid without a price" do
    book = Book.new(
      title: "Dune",
      author: "Frank Herbert",
      price: nil,
      published_date: Date.new(1965, 8, 1)
    )

    expect(book).not_to be_valid
  end

  it "is not valid without a published date" do
    book = Book.new(
      title: "Dune",
      author: "Frank Herbert",
      price: 19.99,
      published_date: nil
    )

    expect(book).not_to be_valid
  end
end