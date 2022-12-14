require File.expand_path(File.dirname(__FILE__) + '/neo')

#AboutHashes class
class AboutHashes < Neo::Koan
  def test_creating_hashes
    empty_hash = {}
    assert_equal Hash, empty_hash.class
    assert_equal({}, empty_hash)
    assert_equal 0, empty_hash.size
  end

  def test_hash_literals
    hash = { one: 'uno', two: 'dos' }
    assert_equal 2, hash.size
  end

  def test_accessing_hashes
    hash = { one: 'uno', two: 'dos' }
    assert_equal 'uno', hash[:one]
    assert_equal 'dos', hash[:two]
    assert_equal nil, hash[:doesnt_exist]
  end

  def test_accessing_hashes_with_fetch
    hash = { one: 'uno' }
    assert_equal 'uno', hash.fetch(:one)
    assert_raise(KeyError) do
      hash.fetch(:doesnt_exist)
    end

    # THINK ABOUT IT:
    #
    # Why might you want to use #fetch instead of #[] when accessing hash keys?
  end

  def test_changing_hashes
    hash = { one: 'uno', two: 'dos' }
    hash[:one] = 'eins'

    expected = { one: 'eins', two: 'dos' }
    assert_equal expected, hash

    # Bonus Question: Why was "expected" broken out into a variable
    # rather than used as a literal?
  end

  def test_hash_is_unordered
    hashone = { one: 'uno', two: 'dos' }
    hashtwo = { two: 'dos', one: 'uno' }

    assert_equal true, hashone == hashtwo
  end

  def test_hash_keys
    hash = { one: 'uno', two: 'dos' }
  end

  def test_hash_values
    hash = { one: 'uno', two: 'dos' }
  end

  def test_combining_hashes
    hash = { 'jim' => 53, 'amy' => 20, 'dan' => 23 }
    new_hash = hash.merge({ 'jim' => 54, 'jenny' => 26 })

    assert_equal true, hash != new_hash

    expected = { 'jim' => 53, 'amy' => 20, 'dan' => 23, 'jenny' => 26 }
    assert_equal false, expected == new_hash
  end

  def test_default_value
    hashone = {}
    hashone[:one] = 1

    hashtwo = Hash.new('dos')
    hashtwo[:one] = 1
  end

  def test_default_value_is_the_same_object
    hash = Hash.new([])

    hash[:one] << 'uno'
    hash[:two] << 'dos'

    assert_equal %w[uno dos], hash[:three]
  end

  def test_default_value_with_block
    hash = Hash.new { |hash, key| hash[key] = [] }

    hash[:one] << 'uno'
    hash[:two] << 'dos'

    assert_equal [], hash[:three]
  end
end
