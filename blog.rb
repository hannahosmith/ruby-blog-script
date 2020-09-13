class Blog

    def set_post_list
      @post_list = Array.new
    end

    def add_post_to_list(post)
      @post_list.push(post)
      puts "#{@post_list}"
    end

    @@total_posts = 0

    def initialize
      @@total_posts +=1
      set_post_list
    end

    def count_posts
      puts "there are currently #{@@total_posts} in the blog so far. plenty more where that came from!"
    end

end

class Blogpost < Blog

  # @@total_posts = 0
  #
  # def initialize
  #   @@total_posts +=1
  #   set_post_list
  # end

  # def count_posts
  #   puts "there are currently #{@@total_posts} in the blog so far. plenty more where that came from!"
  # end

  def set_author=(author)
    @author = author
  end

  def author
    return @author
  end

  def set_title=(title)
    @title = title
  end

  def title
    return @title
  end

  def set_date
    @date = Date.today
  end

  def date
    return @date
  end

  def set_content=(content)
    @content = content
  end

  def content
    return @content
  end

end

def make_new_post

  blog = Blog.new
  post = Blogpost.new

  require 'date'
  current_time = DateTime.now

  puts "who wrote this blog post?"
  post.set_author = gets.chomp
  post_author = post.author

  puts "what is this post titled?"
  post.set_title= gets.chomp
  post_title= post.title

  puts "insert the post content here"
  post.set_content= gets.chomp
  post_content= post.content

  puts "here are the post details:

  date: #{current_time}
  author: #{post_author}
  title: #{post_title}
  content: #{post_content}"

  blog.add_post_to_list(post)

  @post_list.inspect

end

puts "hey, would you like to create a blog post today? [Y/N]"
response = gets.chomp.downcase

if response == 'y'
  make_new_post
  puts "would you like to create another?"
  response = gets.chomp.downcase
  while response == 'y'
    make_new_post
    puts "would you like to create another?"
    response = gets.chomp.downcase
  end
  puts "ok, maybe another time"
else
  puts "ok, maybe another time"
end
