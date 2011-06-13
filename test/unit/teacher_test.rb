require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  
  def setup
    @first_name = "Juan"
    @last_name = "Gonzalez"
  end
  
  test "should not save teacher without a first name" do
    teacher = Teacher.new(:last_name => @last_name)
    assert !teacher.valid?, "Saved teacher without a first name"
  end
  
  test "should not save teacher without a last name" do
    teacher = Teacher.new(:first_name => @first_name)
    assert !teacher.valid?, "Saved teacher without a last name"
  end
 
  test "should create a valid teacher" do
    teacher = Teacher.new(:first_name => @first_name, :last_name => @last_name)
    assert teacher.save, "Valid teacher note created"
    teacher_id = teacher.id
    teacher = Teacher.find(teacher_id)
    assert_not_nil teacher, "Valid teacher not found in database"
  end
 
end
