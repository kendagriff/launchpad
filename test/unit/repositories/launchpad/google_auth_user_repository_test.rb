require 'test_helper'

module Launchpad
  class GoogleAuthUserRepositoryTest < ActiveSupport::TestCase
    setup do
      @auth = {
        'uid' => 'http://teachbanzai.com/openid?id=12345',
        'info' => {
          'first_name' => 'Kendall',
          'last_name' => 'Buchanan',
          'email' => 'kendall@teachbanzai.com'
        }
      }
    end

    test "create a user from an omniauth hash" do
      assert_difference "GoogleAuthUser.count" do
        user = GoogleAuthUserRepository.create(@auth)
        assert !user.new_record?
        assert_equal @auth.fetch('uid'), user.identifier_url
        assert_equal @auth.fetch('info').fetch('first_name'), user.first_name
        assert_equal @auth.fetch('info').fetch('last_name'), user.last_name
        assert_equal @auth.fetch('info').fetch('email'), user.email
      end
    end

    test "find or create" do
      assert_difference "GoogleAuthUser.count" do
        user = GoogleAuthUserRepository.find_or_create(@auth)
        user_two = GoogleAuthUserRepository.find_or_create(@auth)
        assert_equal user.id, user_two.id
      end
    end

    test "find a user by id" do
      user = GoogleAuthUserRepository.find_or_create(@auth)
      assert GoogleAuthUserRepository.find(user.id)
    end
  end
end
