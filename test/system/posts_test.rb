require_relative "../test_helper"

ActiveSupport::TestCase.test_order = :sorted
module Minitest
  # disable Minitest's random testcase ordering
  def self.__run reporter, options
    Runnable.runnables.map { _1.run reporter, options }
  end
end


class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome
end

Capybara.server = :puma, { Silent: true }

class PostsTest1 < ApplicationSystemTestCase
  self.use_transactional_tests = true

  test "1) initial visit" do
    post = Post.create!(title: "FooBar1")
    visit post_path(post)
    assert_text "FooBar"
  end
end

class PostsTest2 < ActiveSupport::TestCase
  self.use_transactional_tests = false
  test "2) threaded transactions" do
    Array.new(5) {
      Thread.new {
        Post.first
      }
    }.map(&:join)
    assert_equal 1, 1
  end
end

class PostsTest3 < ApplicationSystemTestCase
  self.use_transactional_tests = true

  test "3) visiting with a bad transaction" do
    post = Post.create!(title: "FooBar2")
    visit post_path(post)
    assert_text "FooBar"
  end
end
