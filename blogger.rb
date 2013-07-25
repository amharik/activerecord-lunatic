require './require_libs.rb'

class Blogger
  def self.method_missing method, *args, &block
    super unless method =~ /[a-z]+_[a-z0-9_]+/
    case method
    when /total_[a-z0-9]+/
      emptyString,table = method.to_s.split "total_"
      return eval "#{table.capitalize.singularize}.count;"
      
    when /[a-z]+_[n0-9]+_[a-z]+/
      position,count,table= method.to_s.split "_"
      return (count=="n")? (eval "#{table.capitalize.singularize}.all;") :(eval "#{table.capitalize.singularize}.#{position}(#{count});")
      
    when /[a-z]+_by_date_[0-9]+/
      table,date = method.to_s.split "_by_date_"
      puts "finding all "+table+" at "+date
      date=date.split "_"
      condition = ""
      (date.length>1 && condition+="YEAR(created_at)=? ")?((date.length>2 && condition+="and MONTH(created_at)=? ")?((date.length>3)?(condition+="and DAY(created_at)=? "):(condition+="and DAY(created_at)=? ")):condition+="and MONTH(created_at)=? "):(condition="YEAR(created_at)=? ");
      #       SELECT `blogs`.* FROM `blogs` WHERE (YEAR(created_at)=2013 and MONTH(created_at)=7 and DAY(created_at)=25 )
      return eval "#{table.capitalize.singularize}.where('#{condition}',#{date[0..2].join ","})";
      
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