require './require_libs.rb'

class Blogger
  def self.test   
    users=User.includes(:posts).last(3)
    #     SOLUTION FOR EAGER LOADING
    users.each{|u|
               puts u.name
              u.posts.each{|p|
                           puts "\t* POST BY "+u.name+" : "+p.content
                          }  
              }
  end
  
  def self.method_missing method, *args, &block
    super unless method =~ /[a-z]+_[0-9]+_[a-z]+/
    position,count,table= method.to_s.split "_"
    puts "getting "+position+" - "+count+" records of "+table
    #     users=User.includes(:posts).last(3)
    case position
    when /first/
      case table
      when /users/
	users=User.includes(:posts).first(3)
      when /blogs/
	users=User.includes(:posts).first(3)
      when /posts/
	users=User.includes(:posts).first(3)
      when /comments/
	users=User.includes(:posts).first(3)
      else
      end
    when /last/
      case table
      when /users/
	users=User.includes(:posts).last(3)
      when /blogs/
	users=User.includes(:posts).last(3)
      when /posts/
	users=User.includes(:posts).last(3)
      when /comments/
	users=User.includes(:posts).last(3)
      else
      end
    else
    end
  end
end

# Blogger.test  
Blogger.last_3_users
Blogger.last_3_blogs
#     users=User.find :all, order:"updated_at DESC",include:{posts:{}}, limit:10
#     users=User.includes(:posts)
#     users=User.joins(:posts).last(3)