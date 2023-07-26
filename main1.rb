# frozen_string_literal: true

$LOAD_PATH << '.'

require 'methods'

# class for crud operations
class Class
  def initialize
    @student_count = 0
    @students = {}
  end

  # Selected Choice
  def options(choice)
    case choice
    when 1 then add(create)
    when 2, 3 then edit_delete(choice)
    when 4 then all_students
    when 5 then create_csv
    else puts 'Invalid Choice'
    end
  end

  # Add Student
  def add(obj)
    @student_count += 1
    @students[@student_count] = obj
    puts '<<<<<<<<<<<<<<<<  Student Added  >>>>>>>>>>>>>>>>'
  end

  # Student Object Creation
  def create
    attributes = { name: 'name', age: 'age', contact: 'contact no.', email: 'email', address: 'address' }
    student_data = {}
    attributes.each do |attribute, attribute_name|
      puts "Enter Student #{attribute_name.capitalize} :"
      student_data[attribute] = get_valid_input(attribute)
    end
    Student.new(*student_data.values)
  end

  def get_valid_input(attribute)
    validations = { email: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, contact: /\A\d{10}\z/, name: /\A[a-zA-Z\s'-]+\z/,
                    age: /\A\d{1,3}\z/, address: /\A[a-zA-Z\s\-']+\z/ }
    loop do
      input = gets.chomp
      return input if validations[attribute] && input.match?(validations[attribute])

      puts "Invalid #{attribute} format. Please enter a valid #{attribute}:"
    end
  end

  # Choosing Edit Or Delete
  def edit_delete(choice)
    all_students
    puts '--------------------------------------------------'
    puts 'Enter Student Id'
    key = gets.to_i
    if @students.empty?
      puts 'No data Exist'
    else
      choice == 2 ? edit(key) : remove(key)
    end
  end

  # Delete Student
  def remove(key)
    if @students.delete(key)
      puts '<<<<<<<<<<<<<<< Student Deleted >>>>>>>>>>>>>>>'
    else
      puts 'Student not exist...Enter valid Id'
    end
  end

  # Edit Student
  def edit(key)
    loop do
      @students[key].student_details
      puts ' 0. Exit'
      puts 'Which feild you want to change : '
      input = gets.chomp
      break if input.match?(/\A\d+\z/) && input.to_i.zero?

      input.match?(/\A\d+\z/) ? specific_edit(input.to_i, key) : puts('Invalid input. Please enter a valid choice.')
    end
  end

  # Edit Specific Details
  def specific_edit(opt, key)
    case opt
    when 1 then update_student_attribute(key, :name, 'name')
    when 2 then update_student_attribute(key, :age, 'age')
    when 3 then update_student_attribute(key, :contact_number, 'contact')
    when 4 then update_student_attribute(key, :email, 'email')
    when 5 then update_student_attribute(key, :address, 'address')
    else puts 'Invalid choice'
    end
  end

  # Update Student Atrribute
  def update_student_attribute(key, attribute, attribute_name)
    puts "Enter new #{attribute_name}"
    new_value = get_valid_input(attribute)
    # new_value = gets.chomp
    @students[key].send("#{attribute}=", new_value)
    puts "<<<<<<<<<< Student #{attribute_name} updated >>>>>>>>>>"
  end

  # Get All Student
  def all_students
    puts "Total data is #{@students.size}"
    puts '--------------------------------------------------'
    puts 'Id  | Name  | Age  | Contact  | Email  | Address  '
    puts '--------------------------------------------------'
    @students.each do |key, value|
      puts "#{key} | #{value.name} | #{value.age} |  #{value.contact_number} | #{value.email} | #{value.address}"
    end
  end

  # CSV Create
  def create_csv
    time = Time.now
    @file = File.new("#{time.strftime('%Y-%m-%d %H:%M:%S')}.csv", 'w+')
    @file.puts('Name, Age, Contact, Email, Address')
    @students.each do |_, value|
      @file.puts("#{value.name}, #{value.age}, #{value.contact_number}, #{value.email}, #{value.address}")
    end
    @file.close
  end

  # For run the program
  def run_app
    # Loop for Making choice
    loop do
      Methods.make_choice
      input = gets.chomp
      break if input.match?(/\A\d+\z/) && input.to_i.zero?

      input.match?(/\A\d+\z/) ? options(input.to_i) : puts('Invalid input. Please enter a valid choice.')
    end
  end
end

# Student Class
class Student
  attr_accessor :name, :age, :contact_number, :email, :address

  def initialize(name, age, contact_number, email, address)
    @name = name
    @age = age
    @contact_number = contact_number
    @email = email
    @address = address
  end

  def student_details
    puts 'Details of Student :'
    puts " 1. Name : #{@name} \n 2. Age : #{@age}"
    puts " 3. Contact : #{@contact_number} \n 4. Email : #{@email} \n 5. Address : #{@address}"
  end
end
