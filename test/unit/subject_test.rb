require 'test_helper'

class SubjectTest < ActiveSupport::TestCase
  
  
  test "should not save subject without a code" do
    subject = Subject.new(:name => "MySubject")
    assert !subject.save, "Saved subject without a code"
  end
  
  test "should not save subject without a name" do
    subject = Subject.new(:code => "MyCode")
    assert !subject.save, "Saved subject without a name"
  end
  
  test "should not save two subjects with same code" do
    subject1 = Subject.new(:code => "MyCode", :name => "MySubject1")
    subject1.save
    subject2 = Subject.new(:code => "MyCode", :name => "MaySubject2")
    assert !subject2.save, "Saved two subjects with same code"
  end
  
  test "should not save subject with negative credits" do
    subject = Subject.new(:code => "MyCode", :name => "MySubject", :credits => -1)
    assert !subject.save, "Subject saved with negative credits"
  end
  
  test "should not save subject with non-integer credits" do
    subject = Subject.new(:code => "MyCode", :name => "MySubject", :credits => 1.33)
    assert !subject.save, "Subject saved with non-integer credits"
  end
end
