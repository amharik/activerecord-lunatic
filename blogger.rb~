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