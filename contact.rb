class Contact

  attr_accessor :first_name, :last_name, :email, :note
  attr_reader :id

    @@contacts = []
    @@next_id = 0


  def self.all
    @@contacts.each do |contact|
      puts "ID:#{contact.id} #{contact.first_name.capitalize} #{contact.last_name.capitalize} #{contact.email.downcase} #{contact.note.capitalize}"
    end
  end

  def self.create(first_name, last_name, email, note)
    # 1. Initialize a new Contact with a unique ID
    new_contact = self.new(first_name, last_name, email, note)

    # 2. Add the new Contact to the list of all contacts
    @@contacts << new_contact

    # 3. Increment the next unique ID
    @@next_id += 1

    # 4. Return result
    new_contact
  end


  def initialize(first_name, last_name, email, note)
    @id = @@next_id
    @first_name = first_name.upcase
    @last_name = last_name.upcase
    @email = email.upcase
    @note = note
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.update(id, first_name, last_name, email, note)
    @@contacts.each do |contact|
      if contact.id == id
        contact.first_name = first_name
        contact.last_name = last_name
        contact.email = email
        contact.note = note
      else
        "No matching ID"
      end
    end
  end

  def self.search(info)
    result = []
    @@contacts.each do |contact|
      case info
        when contact.first_name
          result << contact
        when contact.last_name
          result << contact
        when contact.email
          result << contact
        else
          "Not found"
      end
    end
    puts result
    return result
  end



  def self.delete_all
    @@contacts = [nil]
  end

  def self.delete(id)
    @@contacts.each do |contact|
      if contact.id == id
        @@contacts.delete(contact)
      else
        "No matching ID"
      end
    end
  end

end

test2 = Contact.create("Michelle","manahan","manahan.michelle@gmail.com","hello!")
test1 = Contact.create("Yuri","manahan","yuri.manahan@gmail.com","Hi!")
test3 = Contact.create("marshall", "manahan", "marshall.manahan@gmail.com","Howdy!")
test4 = Contact.create("Benson", "Henderson", "test@test.com","Bellator")
