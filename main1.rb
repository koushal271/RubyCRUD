class Class

  @@student_count =0

  def initialize 
    @students = {}
  end

  # csv create
  def create_csv
    @file = File.new("student.csv", "w+")
    @file.puts("Name, Address")
    @students.each do |key, value|
      @file.puts("#{value.name}, #{value.address}")
    end
    @file.close
  end

  # Get csv
  def get_csv
    # puts "csv"
    file = File.open("student.csv")
    file.rewind
    file.each { |line| puts line}
    file.close
  end

  # Add Student
  def add_student student_obj
    @@student_count+=1
    @students[@@student_count] = student_obj
    puts "-----------------------------------------"
    puts "<<<<<<<<<< Student Added >>>>>>>>>>"
    puts "-----------------------------------------" 
  end

  # Get All Student
  def all_students
    puts "-----------------------------------------"
    puts "<<<<<<<<<< Student Data >>>>>>>>>>"
    puts "-----------------------------------------"
    puts "Total data is #{@students.size}"
    puts
    puts "-----------------------------------------"
    puts
    @students.each do |key, value|
      puts "#{key} #{value.name}, #{value.address}"
    end
    puts "-----------------------------------------"
  end

  # Delete Student
  def delete_student key
    if(@students.delete(key))
      puts "-----------------------------------------"
      puts "<<<<<<<<<< Student Deleted >>>>>>>>>>"
      puts "-----------------------------------------"
    else
      puts "Student not exist...Enter valid Id"
    end
  end

  # Edit Student
  def edit_student key
    puts "Existing Details : #{@students[key].name} #{@students[key].address}"
    puts "Enter new name"
    new_name = gets.chomp
    puts "Enter new address"
    new_address = gets.chomp
    @students[key].name = new_name
    @students[key].address = new_address
    puts "-----------------------------------------"
    puts "<<<<<<<<<< Student Updated >>>>>>>>>>"
    puts "-----------------------------------------"
  end
end


# Student Class
class Student 
  attr_accessor :name, :address

  def initialize(name, address)
    @name = name
    @address = address
  end
end


# Choice List
def make_choice
  puts "Make your choice : \n 1. Adding Student \n 2. Edit Student \n 3. Delete Student \n 4. All Students \n 5. Print CSV \n 0. Quit"
  puts "-----------------------------------------"
end


# Selected Choice
def selected_choice choice, cls
  case choice
  when 1
    puts "Enter Student name : "
    name = gets.chomp
    puts "Enter Student address : "
    address = gets.chomp
    cls.add_student Student.new(name, address)    
  when 2
    puts "Enter Student Id"
    key = gets.to_i
    cls.edit_student key
  when 3
    puts "Enter Student Id"
    key = gets.to_i
    cls.delete_student key 
  when 4
    cls.all_students 
  when 5
    cls.create_csv
    cls.get_csv
  else
    puts "Invalid Choice"
  end
end



# main 
cls = Class.new

while true
  make_choice
  user_option=gets.to_i
  break if user_option==0
  selected_choice user_option, cls
end

END{
  puts "-----------------------------------------"
  puts "<<<<<<<<<< Thank you for using >>>>>>>>>>"
  puts "-----------------------------------------"
}



