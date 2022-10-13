require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "should not save post without title" do
    post = Post.new
    if assert_not post.save
      puts "Good, the post was not saved without a title"
    else
      post.errors.full_messages.each do |message|
        puts message
      end
      puts "Post was saved without a title"
    end
  end
  test "should not save post without description" do
    post = Post.new
    if assert_not post.save
      puts "Good, the post was not saved without a description"
    else
      puts "Post was saved without a description"
    end
  end
end
