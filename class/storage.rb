require 'json'

class IOmanager
  def save_book(books)
    file = File.open('./book.json', 'w')
    book_data = books.map do |data|
      { title: data.title, author: data.author }
    end
    file.puts(JSON.generate(book_data))
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

  def save_people(person)
    file = File.open('./people.json', 'w')
    person_data = person.map do |persons|
      if person.instance_of?(Teacher)
        { occupation: 'Teacher', name: persons.name, age: persons.age, specialiazation: persons.specialization,
          id: persons.id }
      else
        { occupation: 'Student', name: persons.name, age: persons.age, parent_permission: persons.parent_permission,
          id: persons.id }
      end
    end
    file.puts(JSON.generate(person_data))
  end

  def fetch_person_data
    file = File.read('./people.json')
    array = []
    if file.empty?
      array
    else
      parsed_data = JSON.parse(file)
      parsed_data.map do |persons|
        case person['occupation']
        when 'Teacher'
          teacher = Teacher.new(persons['age'], persons['name'], persons['specialiazation'], persons['id'].to_i)
          array.push(teacher)

        when 'Student'
          student = Student.new(persons['age'], 'classroom', persons['name'], persons['parent_permission'],
                                persons['id'].to_i)
          array.push(student)
        end
      end
    end
    array
  end

  def save_rental(rentals)
    file = File.open('./rentals.json', 'w')
    rentals_data = rentals.map do |rental|
      obj = { date: rentals.date, book: { Title: rental.book.title, Author: rental.book.author } }
      begin
        if rental.persons.specialiazation
          obj.store('person',
                    { id: rental.persons.id, age: rental.persons.age, name: rental.persons.name,
                      parent_permission: rental.persons.parent_permission })
        end
      rescue standardError
        obj.store('person',
                  { id: rental.person.id, age: rental.persons.age, name: rental.persons.name,
                    parent_permission: rental.persons.parent_permission })
      end
      obj
    end
    file.puts(JSON.generate(rentals_data))
  end

  def fetch_rental_data
    file = File.read('./rentals.json')
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
