require './require_libs.rb'

class Blogger
  def self.method_missing method, *args, &block
    super unless method =~ /[a-z]+_[n0-9]+_[a-z]+/
    position,count,table= method.to_s.split "_"
    return (count=="n")? eval "#{table.capitalize.singularize}.all;" : eval "#{table.capitalize.singularize}.#{position}(#{count});"
  end
end

#posts in a blog
#comment user
#group month
#tot blogs

# Blogger.test  
Blogger.last_2_users.each{|u| puts u.name}
Blogger.last_2_blogs.each{|b| puts b.title}
Blogger.last_n_posts.each{|p| puts p.content}

Blogger.first_1_comments.each{|c| puts c.content}

#comments GARAGE
#     puts "getting "+position+" - "+count+" records of "+table
#     users=User.includes(:posts).last(3)


#   def self.test   
#     users=User.includes(:posts).last(3)
#     #     SOLUTION FOR EAGER LOADING
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