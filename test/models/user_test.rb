# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @alice = users(:alice)
    @bob = users(:bob)
  end

  test '#following?' do
    assert_not @bob.following?(@alice)
    assert @alice.following?(@bob)
  end

  test '#followed_by?' do
    assert_not @alice.followed_by?(@bob)
    assert @bob.followed_by?(@alice)
  end

  test '#follow' do
    assert_nil Relationship.find_by(following: @alice)
    @bob.follow(@alice)
    assert Relationship.find_by(following: @alice)
  end

  test '#unfollow' do
    assert Relationship.find_by(following: @bob)
    @alice.unfollow(@bob)
    assert_nil Relationship.find_by(following: @bob)
  end

  test '#name_or_email' do
    user = User.new(email: 'foo@example.com', name: '')

    assert_equal 'foo@example.com', user.name_or_email
    user.name = 'Foo Bar'
    assert_equal 'Foo Bar', user.name_or_email
  end
end
