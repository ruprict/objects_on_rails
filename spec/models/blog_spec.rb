require 'ostruct'
require_relative '../spec_helper'
require_relative "../../app/models/blog"

describe Blog do
  before  do
    @it = Blog.new
  end

  it "should have no entries" do
    @it.entries.must_be_empty
  end

  describe "#new_entry" do
    before do
      @new_post = OpenStruct.new
      @it.post_maker = -> { @new_post}
    end

    it "should return a new post" do
      @it.new_entry.must_equal @new_post
    end

    it "should set the post's blog references to itself" do
      @it.new_entry.blog.must_equal(@it)
    end
  end

  describe "#add_entry" do
    it "should add the entry to the blog" do
      entry = Object.new
      @it.add_entry(entry)
      @it.entries.must_include(entry)
    end

    it "should accept an attribute hash on behalf of the post maker" do
      post_maker = MiniTest::Mock.new
      post_maker.expect(:call, @new_post, [{:x => 42, :y => 'z'}])
      @it.post_maker = post_maker
      @it.new_entry(:x => 42, :y => 'z')
      post_maker.verify
    end
  end
end
