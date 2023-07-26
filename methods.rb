# frozen_string_literal: true

# Module for common methods
module Methods
  # Choice List
  def self.make_choice
    puts 'Make your choice :'
    puts " 1. Add Student\n 2. Edit Student\n 3. Delete Student\n 4. All Students\n 5. Print CSV\n 0. Quit"
    puts 'Your choice : '
  end
end

# def get_valid_input(attribute)
  #   loop do
  #     input = gets.chomp
  #     return input if attribute == :email && valid_email?(input)
  #     return input if attribute == :contact && valid_contact?(input)
  #     return input if attribute == :name && valid_name?(input)
  #     return input if attribute == :age && valid_age?(input)
  #     return input if attribute == :address && valid_address?(input)

  #     puts "Invalid #{attribute} format. Please enter a valid #{attribute}:"
  #   end
  # end

  # def valid_email?(email)
  #   /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.match?(email)
  # end

  # def valid_contact?(contact)
  #   /\A\d{10}\z/.match?(contact)
  # end

  # def valid_name?(name)
  #   /\A[a-zA-Z\s'-]+\z/.match?(name)
  # end

  # def valid_age?(age)
  #   /\A\d{1,3}\z/.match?(age)
  # end

  # def valid_address?(address)
  #   /\A[a-zA-Z\s\-']+\z/.match?(address)
  # end

