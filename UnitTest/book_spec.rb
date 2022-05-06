require_relative '../class/book'

describe Book do
  it 'Book class instance' do
    title = 'Coding game'
    author = 'Sirri'
    @book = Book.new(title, author)
    expect(@book).to be_instance_of(Book)
  end

  it 'check if book attribute match' do
    title = 'lalala'
    author = 'Ryii'
    book = Book.new(title, author)
    expect(book).to have_attribute(title: title, author: author)
  end
end