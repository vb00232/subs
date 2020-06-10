require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not save invalid user' do
    user = User.new
    user.save
    refute user.valid?
  end

  test 'should save valid user' do
    user = User.new
    user.firstname = "Rishab"
    user.lastname = "Jain"
    user.email = 'rj00338@surrey.ac.uk'
    user.password = 'pass123'
    user.save
    assert user.valid?
  end
end
