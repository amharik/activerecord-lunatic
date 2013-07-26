require './blogger.rb'

Blogger.last_2_users.each{|u| puts u.name}
Blogger.last_2_blogs.each{|b| puts b.title}
Blogger.last_n_posts.each{|p| puts p.content}
Blogger.first_1_comments.each{|c| puts c.content}

Blogger.posts_in_blog.each{|b| b.posts.each{|p| puts p.content}}

Blogger.comments_by_user.each{|u| u.comments.each{|c| puts c.content}}

# groups blog by "month-year"
puts "The number of blogs created at 07-13 is "
puts Blogger.group_blogs["07-13"]
puts "The Blogs are:"
(Blogger.blogs_by_date year:'13',month:'07').each_with_index{|b,i|puts "#{i+1}. #{b.title}"}

puts "total number of blogs is #{Blogger.total_blogs}"
puts "total number of users is #{Blogger.total_users}"
