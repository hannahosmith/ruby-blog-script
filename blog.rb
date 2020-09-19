class Blog

    @@post_list = []
    @@total_posts = 0

    # def get_post_list
    #   return @@post_list
    # end

    def self.add_post_to_list(post)
      @@post_list << post
      @@total_posts +=1
    end

    def self.show_posts
      @@post_list.each do |post|
        puts "\n"
        puts "date: #{post.created_at}"
        puts "author: #{post.author}"
        puts "title: #{post.title}"
        puts "content: #{post.content}"
        puts "\n"
    end

    def self.count_posts
        puts "there are currently #{@@total_posts} posts in the blog so far. plenty more where that came from!"
    end

end

class Blogpost < Blog

  def self.make_new_post

    post = new

    puts "who wrote this blog post?"
    post.author = gets.chomp

    puts "what is this post titled?"
    post.title= gets.chomp

    puts "insert the post content here"
    post.content= gets.chomp

    post.created_at = Time.now

    post.save_post

  end

  def author
    @author
  end

  def author=(author)
    @author = author
  end

  def content
    @content
  end

  def content=(content)
    @content = content
  end

  def title
    @title
  end

  def title=(title)
    @title = title
  end

  def created_at
    @date
  end

  def created_at=(date)
    @date = date
  end

  def save_post
    Blogpost.add_post_to_list(self)
  end

end


puts "hey, would you like to create a blog post today? [Y/N]"
response = gets.chomp.downcase

if response == 'y'
  Blogpost.make_new_post
  Blog.count_posts
  Blog.show_posts
  puts "would you like to create another?"
  response = gets.chomp.downcase
  while response == 'y'
    Blogpost.make_new_post
    Blog.count_posts
    Blog.show_posts
    puts "would you like to create another?"
    response = gets.chomp.downcase
  end
  puts "ok, maybe another time"
else
  puts "ok, maybe another time"
end

end
