require 'json'

class IOmanager
  def save_book(books)
    # file = File.open('./book.json', 'w')
    # book_data = []
    book_data = books.map do |data|
      { title: data.title, author: data.author }
    end
    book = JSON.generate(book_data)
    File.write('./class/book.json', book)
  end

  def fetch_book_data
    return [] unless File.exist?('./book.json')

    file = File.read('./book.json')
    array = []
    if file.empty?
      array
    else
      parsed_data = JSON.parse(file)
      parsed_data.map do |data|
        arry.push(Book.new(data['title'], data['author']))
      end
    end
    array
  end

  def save_people(persons)
    # file = File.open('./people.json', 'w')
    # person_data = []
    person_data = persons.map do |person|
      if person.instance_of?(Teacher)
        { occupation: 'Teacher', name: person.name, age: person.age, specialiazation: person.specialization,
          id: person.id }
      else
        { occupation: 'Student', name: person.name, age: person.age, parent_permission: person.parent_permission,
          id: person.id }
      end
    end
    data = JSON.generate(person_data)
    File.write('./class/people.json', data)
  end

  def fetch_person_data
    file = File.read('./people.json')
    array = []
    if file.empty?
      array
    else
      parsed_data = JSON.parse(file)
      parsed_data.map do |person|
        case person['occupation']
        when 'Teacher'
          teacher = Teacher.new(person['age'], person['name'], person['specialization'], person['id'].to_i)
          array.push(teacher)

        when 'Student'
          student = Student.new(person['age'], 'classroom', person['name'], person['parent_permission'],
                                person['id'].to_i)
          array.push(student)
        end
      end
    end
    array
  end

  def save_rental(rentals)
    # file = File.open('./rentals.json', 'w')
    # rentals_data = []
    rentals_data = rentals.map do |rental|
      obj = { date: rental.date, book: { Title: rental.book.title, Author: rental.book.author } }
      # if rental.person.specialization
      obj.store('person',
                { id: rental.person.id, age: rental.person.age, name: rental.person.name,
                  parent_permission: rental.person.parent_permission })
      obj
    end
    data = JSON.generate(rentals_data)
    File.write('./class/rentals.json', data)
  end

  def fetch_rental_data
    file = File.write('./rentals.json')
    array = []

    if file.empty?
      array
    else
      parsed_data = JSON.parse(file)
      parsed_data.map do |data|
        book = Book.new(data['book']['Title'], data['book']['Author'])
        # person = nil
        person = if data['person']['specialization']
                   Teacher.new(data['person']['age'], data['person']['specialization'], data['person']['name'],
                               data['person']['id'])
                 else
                   Student.new(data['person']['age'], 'classroom', data['person']['name'],
                               data['person']['parent_permission'], data['person']['id'])
                 end
        array.push(Rental.new(data['data'], person, book))
      end
    end
    array
  end
end
