require './blogger.rb'

Blogger.last_2_users.each{|u| puts u.name}
Blogger.last_2_blogs.each{|b| puts b.title}
Blogger.last_n_posts.each{|p| puts p.content}

Blogger.first_1_comments.each{|c| puts c.content}

Blogger.posts_in_blog.each{|b| b.posts.each{|p| puts p.content}}

Blogger.comments_by_user.each{|u| u.comments.each{|c| puts c.content}}

Blogger.blogs_by_date_2013_7_25.each{|b| puts b}

puts "total number of blogs is #{Blogger.total_blogs}"
puts "total number of users is #{Blogger.total_users}"

#REQUIREMENTS
#posts in a blog
#comment user
#group month
#tot blogs