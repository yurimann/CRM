require './contact.rb'



class CRM

  def initialize
    main_menu
  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
      when 1
        add
      when 2
        modify
      when 3
        Contact.display_all
        puts "Enter ID number of contact to delete:"
        id = gets.chomp.to_i
        Contact.all.find do |contact| contact.id == id
          Contact.find(id).delete
        end
      when 4
        Contact.display_all
      when 5
        puts "How would you like to search for the contact?"
        puts "[1] First name"
        puts "[2] Last name"
        puts "[3] Email"
        puts "[4] Notes"
        att = gets.chomp.to_i
        selector(att)
        puts "Enter value"
        value = gets.chomp.capitalize
        Contact.find_by(att, value)
      when 6
        puts "Bye!"
        exit
    end
  end

  def add
    info
    Contact.create(@first_name, @last_name, @email, @notes)
  end

  def info
    puts "Please enter the first name:"
      first_name = gets.chomp.capitalize
    puts "Please enter the last name:"
      last_name = gets.chomp.capitalize
    puts "Please enter email address:"
      email = gets.chomp.capitalize
    puts "Please enter notes:"
      notes = gets.chomp.capitalize
      @first_name = first_name
      @last_name = last_name
      @email = email
      @notes = notes
  end

  def modify
    puts "Enter ID of person you want to update:"
    Contact.display_all
      id = gets.chomp.to_i
      puts "What would you like to update?"
      puts "[1] First name"
      puts "[2] Last name"
      puts "[3] Email"
      puts "[4] Notes"
      choice = gets.chomp.to_i
      selector(choice)
      puts "What is the new value?"
      value = gets.chomp
    Contact.all.find do |contact| contact.id == id
      Contact.find(id).update(attribute, value)
    end
  end
end

def selector(choice)
  case choice
  when 1
    choice = 'first_name'
  when 2
    choice = 'last_name'
  when 3
    choice = 'email'
  when 4
    choice = 'notes'
  end
  return choice
end

test = CRM.new
