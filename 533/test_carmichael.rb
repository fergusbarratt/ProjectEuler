require_relative "carmichael"
require "minitest/autorun"

class TestCarmichael < MiniTest::Test
  def setup 
    @testnums = [47, 2, 4, 50, 1, 3, 5]
    @testprimes = [2, 3, 5, 7, 11, 13, 17, 97]
  end
  def test_ones_coprime
    @testnums.each do |i|
      assert !i.iscoprimewith?(1), 'testnum coprime with 1'
    end
  end
  def test_selfs_coprime
    @testnums.each do |i|
      assert !i.iscoprimewith?(i), 'self coprime'
    end
  end
  def test_primes
    @testprimes.each do |i|
      assert i.isprime?, 'primes are not prime'
    end
  end
  def test_coprimes
    @testnums.each do |testnum|
      (testnum.get_coprimes).each do |i|
        assert i.iscoprimewith?(testnum), 'get_coprimes returns non-coprimes'
      end
    end
  end
  def test_carmichaels
    assert_equal 2, carmichael(8)
    assert_equal 4, carmichael(240)
  end
end
