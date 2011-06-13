require 'test_helper'

class SubjectTest < ActiveSupport::TestCase
  
  def setup
    @subject_name = "MySubject"
    @code = "MyCode"
  end
  
  test "should not save subject without a code" do
    subject = Subject.new(:name => @subject_name)
    assert !subject.valid?, "Saved subject without a code"
  end
  
  test "should not save subject without a name" do
    subject = Subject.new(:code => @code)
    assert !subject.valid?, "Saved subject without a name"
  end
  
  test "should not save two subjects with same code" do
    subject1 = Subject.new(:code => @code, :name => "MySubject1")
    subject1.save
    subject2 = Subject.new(:code => @code, :name => "MaySubject2")
    assert !subject2.valid?, "Saved two subjects with same code"
  end
  
  test "should not save subject with negative credits" do
    subject = Subject.new(:code => @code, :name => @subject_name, :credits => -1)
    assert !subject.valid?, "Subject saved with negative credits"
  end
  
  test "should not save subject with non-integer credits" do
    subject = Subject.new(:code => @code, :name => @subject_name, :credits => 1.33)
    assert !subject.valid?, "Subject saved with non-integer credits"
  end
  
  test "should create a valid subject" do
    subject = Subject.new(:code => @code, :name => @subject_name, :credits => 3)
    assert subject.save, "Valid subject not created"
    subject = Subject.find_by_code(@code)
    assert_not_nil subject, "Valid subject not found in database"
  end
end
