require 'rubygems'
require 'active_record'
require 'logger'
require 'yaml'

# puts "!!!!!!!!!!!!"
# puts ARGV
# puts (ARGV[0])?ARGV[0].to_i : nil
# puts "!!!!!!!!!!!!"


task :default => :environment do
  puts "USAGE: rake [db:fun | db:migrate | db:drop | db:populate]"
end

task :fun=> :environment do
  load('model/user.rb')
  load('model/blog.rb')
  load('model/post.rb')
  load('model/comment.rb')
  
  buck = User.create name: 'Buck'
  alice = User.create name: 'Alice'
  
  blogByBuck = Blog.create title: "Buck's Blog", content: "Anything in praise of Buck"
  blogByAlice = Blog.create title: "Alice's Blog", content: "Anything in praise of Alice"
  
  postByBuck= Post.create content: 'Buck is Great. Some Long Blah! Blah!.. by Buck'
  postByAlice= Post.create content: 'Alice is Great. Some Long Blah! Blah!.. by Alice'
  
  commentByAlice = Comment.create content: "Buck, Trust me dude! I'm greater than u - BY Alice"
  commentByBuck = Comment.create content: "Alice, Trust me dude! I'm greater than u - BY Buck"
  
  alice.comments.push commentByAlice
  postByBuck.comments.push commentByAlice
  buck.posts.push postByBuck
  blogByBuck.posts.push postByBuck
  buck.blogs.push blogByBuck
  
  buck.comments.push commentByBuck
  postByAlice.comments.push commentByBuck
  alice.posts.push postByAlice
  blogByAlice.posts.push postByAlice
  alice.blogs.push blogByAlice
  
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  buck.posts.each{|p| puts p.content}
#   puts postByBuck
  puts postByBuck.user.name
  puts postByBuck.blog.title
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
end


task :environment do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  @config = YAML::load_file('./database.yml')
  ActiveRecord::Base.establish_connection(@config)
end

namespace :db do
  task :migrate => :environment do
    ActiveRecord::Migrator.migrate("db/migration",nil)
  end
  task :drop => :environment do
    #     cool method to drop tables
    ActiveRecord::Migrator.migrate("db/migration",ARGV[0]?ARGV[0].to_i : nil)
  end
  task :populate => :environment do
    #make_blogs
    #make_posts
    #make_users
    load('model/user.rb')
    usr = User.new
    usr.name='Alice'
    usr.save
    
  end
end