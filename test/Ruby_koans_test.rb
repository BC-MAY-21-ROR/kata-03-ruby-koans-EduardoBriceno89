require 'minitest/autorun'
require '../koans/about_array_assignment'

#about_array_assignment test class
class Test_about_array_assignment < MiniTest::Test
 
  def test_non_parallel_assignment
    names = %w[John Smith]
    assert_equal %w[John Smith], names
  end

  def test_parallel_assignments
    first_name = 'John'
    last_name = 'Smith'
    assert_equal 'John', first_name
    assert_equal 'Smith', last_name
  end

  def test_parallel_assignments_with_extra_values
    first_name, *last_name = %w[John Smith III]
    assert_equal 'John', first_name
    assert_equal %w[Smith III], last_name
  end

  def test_parallel_assignments_with_splat_operator
    first_name, *last_name = %w[John Smith III]
    assert_equal 'John', first_name
    assert_equal %w[Smith III], last_name
  end
end