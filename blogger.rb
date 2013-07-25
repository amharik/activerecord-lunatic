require './require_libs.rb'

class Blogger
  def self.method_missing method, *args, &block
    super unless method =~ /[a-z]+_[inby0-9]+_[a-z0-9_]+/
    case method
    when /[a-z]+_[n0-9]+_[a-z]+/
      position,count,table= method.to_s.split "_"
      return (count=="n")? (eval "#{table.capitalize.singularize}.all;") :(eval "#{table.capitalize.singularize}.#{position}(#{count});")
    when /[a-z]+_(in|by)_[a-z]+/
      child,relation,parent= method.to_s.split "_"
      puts "finding "+child+" in "+parent
      #     ELIMINATES N+1 PROBLEM  Blog.includes(:posts).all
      return (eval "#{parent.capitalize}.includes(:#{child}).all");
    else
      puts "NOT RECOGNIZD!"
    end
  end
end

Blogger.last_2_users.each{|u| puts u.name}
Blogger.last_2_blogs.each{|b| puts b.title}
Blogger.last_n_posts.each{|p| puts p.content}

Blogger.first_1_comments.each{|c| puts c.content}

Blogger.posts_in_blog.each{|b| b.posts.each{|p| puts p.content}}

Blogger.comments_by_user.each{|u| u.comments.each{|c| puts c.content}}

Blogger.blogs_by_date_1212
#comments GARAGE

# Blogger.test  

#     puts "getting "+position+" - "+count+" records of "+table
#     users=User.includes(:posts).last(3)


#   def self.test   
#     users=User.includes(:posts).last(3)
#     #     ELIMINATES N+1 PROBLEM
#     users.each{|u|
#                puts u.name
#               u.posts.each{|p|
#                            puts "\t* POST BY "+u.name+" : "+p.content
#                           }  
#               }
#   end
#   
#     users=User.find :all, order:"updated_at DESC",include:{posts:{}}, limit:10
#     users=User.includes(:posts)
#     users=User.joins(:posts).last(3)
# 
# def get_binding
#   return binding
# end


# puts "!!!!!!!!!!!"
# Blog.includes(:posts).all.each{|b| puts b.posts}
# puts "!!!!!!!!!!!"


# SELECT date
# FROM blog 
# ORDER BY YEAR(date) DESC, MONTH(date) DESC 
# GROUP BY DATE_FORMAT(date, "%m-%y")




#IMP
# 
#       #       for now returns count
#     when /[a-z]+_by_date_[0-9]+/
#       table,date = method.to_s.split "_by_date_"
# #       puts "finding all "+table+" at "+date
#       return "HI"



#posts in a blog
#comment user
#group month
#tot blogs
