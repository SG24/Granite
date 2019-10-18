require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
  end

  def test_is_instance_of_task
    task = Task.new
    assert task.is_a?(Task)
  end

  def test_value_of_description_assigned
    task = Task.new(description: 'Description assigned for testing')
    assert_equal task.description, 'Description assigned for testing'
  end

  def test_error_raised
    assert_raises ActiveRecord::RecordNotFound do
      Task.find(SecureRandom.uuid)
    end
  end
end
