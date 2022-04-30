require_relative './create'

class PrintScript < CreatePeople
  def run_app
    puts 'Hey there, Welcome to my library!'
    until list_of_options
      input = gets.chomp
      if input == '7'
        puts 'Thank you for visiting my Library!'
        break
      end

      option input
    end
  end

  def list_of_options
    puts
    puts 'Please enter a number to choose a particular option: '
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def option(input)
    case input
    when '1'
      list_all_books
    when '2'
      list_all_persons
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_all_rentals
    else
      puts 'Please enter a number between 1 and 7.'
    end
  end
end
