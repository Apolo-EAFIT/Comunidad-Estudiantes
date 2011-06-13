require 'test_helper'

class SubjectsTeachersTest < ActiveSupport::TestCase
  
  test "subject can be added many teachers" do
    subject = Subject.create(:code => "MyCodeWithTeachers", :name => "MySubject")
    teacher1 = Teacher.create(:first_name => "Juan", :last_name => "Gonzalez")
    teacher2 = Teacher.create(:first_name => "Pedro", :last_name => "Arboleda")
    subject.teachers << teacher1
    subject.teachers << teacher2
    assert_equal subject.teachers.count, 2, "Teachers are not being added to subject"
  end
  
end
