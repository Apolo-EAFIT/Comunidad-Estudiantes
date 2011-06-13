require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  
  test "should not save teacher without a first name" do
    teacher = Teacher.new(:last_name => "Gonzalez")
    assert !teacher.save, "Saved teacher without a first name"
  end
  
  test "should not save teacher without a last name" do
    teacher = Teacher.new(:first_name => "Juan")
    assert !teacher.save, "Saved teacher without a last name"
  end
 
end
