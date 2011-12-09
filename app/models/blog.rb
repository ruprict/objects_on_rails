class Blog
  attr_reader :entries
  attr_writer :post_maker

  def initialize
    @entries = []
  end
  def title
    "Watching"
  end

  def subtitle
    "stuff"
  end

  def new_entry(*args)
    post_maker.call(*args).tap do |p|
      p.blog = self
    end
  end

  def add_entry(entry)
    @entries << entry
  end

  private

  def post_maker
    @post_maker ||= Post.public_method(:new)
  end
end
