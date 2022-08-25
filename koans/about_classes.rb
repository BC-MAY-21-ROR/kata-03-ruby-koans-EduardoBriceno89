require File.expand_path(File.dirname(__FILE__) + '/neo')

#AboutClasses class
class AboutClasses < Neo::Koan
  #Dog class
  class Dog
  end

  def test_instances_of_classes_can_be_created_with_new
    fido = Dog.new
    assert_equal AboutClasses::Dog, fido.class
  end

  # ------------------------------------------------------------------
  #Dogtwo class
  class Dogtwo
    def set_name(a_name)
      @name = a_name
    end
  end

  def test_instance_variables_can_be_set_by_assigning_to_them
    fido = Dogtwo.new
    fido.set_name('Fido')
  end

  def test_instance_variables_cannot_be_accessed_outside_the_class
    fido = Dogtwo.new
    fido.set_name('Fido')
  end

  def test_you_can_politely_ask_for_instance_variable_values
    fido = Dogtwo.new
    fido.set_name('Fido')
  end

  def test_you_can_rip_the_value_out_using_instance_eval
    fido = Dogtwo.new
    fido.set_name('Fido')

    assert_equal 'Fido', fido.instance_eval('@name', __FILE__, __LINE__) # string version
    assert_equal 'Fido', fido.instance_eval { @name } # block version
  end

  # ------------------------------------------------------------------
  #Dogthree class
  class Dogthree
    def set_name(a_name)
      @name = a_name
    end

    attr_reader :name
  end

  def test_you_can_create_accessor_methods_to_return_instance_variables
    fido = Dogthree.new
    fido.set_name('Fido')
  end

  # ------------------------------------------------------------------
  #Dogfour class
  class Dogfour
    attr_reader :name

    def set_name(a_name)
      @name = a_name
    end
  end

  def test_attr_reader_will_automatically_define_an_accessor
    fido = Dogfour.new
    fido.set_name('Fido')
  end

  # ------------------------------------------------------------------
  #Dogfive class
  class Dogfive
    attr_accessor :name
  end

  def test_attr_accessor_will_automatically_define_both_read_and_write_accessors
    fido = Dogfive.new

    fido.name = 'Fido'
  end

  # ------------------------------------------------------------------
  #Dogsix class
  class Dogsix
    attr_reader :name

    def initialize(initial_name)
      @name = initial_name
    end
  end

  def test_initialize_provides_initial_values_for_instance_variables
    fido = Dogsix.new('Fido')
    assert_equal 'Fido', fido.name
  end

  def test_args_to_new_must_match_initialize
    assert_raise(ArgumentError) do
      Dogsix.new
    end
    # THINK ABOUT IT:
    # Why is this so?
    # this happens when, we call the method with wrong arguments
  end

  def test_different_objects_have_different_instance_variables
    fido = Dogsix.new('Fido')
    rover = Dogsix.new('Rover')

    assert_equal true, rover.name != fido.name
  end

  # ------------------------------------------------------------------
  #Dogseven class
  class Dogseven
    attr_reader :name

    def initialize(initial_name)
      @name = initial_name
    end

    def get_self
      self
    end

    def to_s
      @name
    end

    def inspect
      "<Dog named '#{name}'>"
    end
  end

  def test_inside_a_method_self_refers_to_the_containing_object
    fido = Dogseven.new('Fido')

    fidos_self = fido.get_self
    assert_equal fido, fidos_self
  end

  def test_to_s_provides_a_string_version_of_the_object
    fido = Dogseven.new('Fido')
    assert_equal 'Fido', fido.to_s
  end

  def test_to_s_is_used_in_string_interpolation
    fido = Dogseven.new('Fido')
    assert_equal 'My dog is Fido', "My dog is #{fido}"
  end

  def test_inspect_provides_a_more_complete_string_version
    fido = Dogseven.new('Fido')
    assert_equal "<Dog named 'Fido'>", fido.inspect
  end

  def test_all_objects_support_to_s_and_inspect
    array = [1, 2, 3]

    assert_equal '[1, 2, 3]', array.to_s
    assert_equal '[1, 2, 3]', array.inspect

    assert_equal 'STRING', 'STRING'.to_s
    assert_equal '"STRING"', 'STRING'.inspect
  end
end
