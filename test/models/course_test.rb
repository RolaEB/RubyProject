require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'valid course' do
    course = Course.new(title: 'PHP', user_id: 3)
    assert course.valid?
  end

  test 'invalid without title' do
    course = Course.new(user_id: 3)
    refute course.valid?, 'course is valid without a title'
    assert_not_nil course.errors[:title], 'no validation error for title present'
  end

  
end
