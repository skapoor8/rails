require "test_helper"

class DepartmentTest < ActiveSupport::TestCase
  def department
    @department ||= Department.new
  end

  def test_valid
    assert department.valid?
  end
end
