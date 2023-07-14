class Class

  @@student_count =0

  def initialize 
    @students = {}
  end

  def get_csv
    puts "csv"
    # @file = File.open("student.csv","w")
    # @file.puts("#{student_obj.name}, #{student_obj.address}")
    # @file.close
  end

  def add_student student_obj
    @@student_count+=1
    @students[@@student_count] = student_obj
  end

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

  def delete_student key
    if(@students.delete(key))
      puts "-----------------------------------------"
      puts "<<<<<<<<<< Student Deleted >>>>>>>>>>"
      puts "-----------------------------------------"
    else
      puts "Student not exist...Enter valid Id"
    end
  end

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



class Student 
  attr_accessor :name, :address

  def initialize(name, address)
    @name = name
    @address = address
  end
end

def make_choice
  puts "Make your choice : \n 1. Adding Student \n 2. Edit Student \n 3. Delete Student \n 4. All Students \n 0. Quit"
  puts "-----------------------------------------"
end

def selected_choice choice, cls
  case choice
  when 1
    puts "Enter Student name : "
    name = gets.chomp
    puts "Enter Student address : "
    address = gets.chomp

    cls.add_student Student.new(name, address)
    puts "-----------------------------------------"
    puts "<<<<<<<<<< Student Added >>>>>>>>>>"
    puts "-----------------------------------------" 
    
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
  else
    puts "Invalid Choice"
  end
end

# main 
BEGIN{
  File.new("student.csv", "w+")
}
cls = Class.new

while true
  make_choice
  user_option=gets.to_i
  break if user_option==0
  selected_choice user_option, cls
end

END{
puts
puts "Thank you for using"
}



