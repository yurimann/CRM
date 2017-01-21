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
        puts "Enter ID number:"
        id = gets.chomp.to_i
        Contact.delete(id)
      when 4
        Contact.all
      when 5
        puts "Enter first or last name or email address"
        info = gets.chomp.upcase
        Contact.search(info)
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
    @details = []
    puts "Please enter the first name:"
      first_name = gets.chomp.upcase
    puts "Please enter the last name:"
      last_name = gets.chomp.upcase
    puts "Please enter email address:"
      email = gets.chomp.upcase
    puts "Please enter notes:"
      notes = gets.chomp
      @first_name = first_name
      @last_name = last_name
      @email = email
      @notes = notes
  end

  def modify
    puts "Enter ID of person you want to update:"
      id = gets.chomp.to_i
    info
    Contact.update(id, @first_name, @last_name, @email, @notes)
  end

end

test = CRM.new
