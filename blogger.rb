require './require_libs.rb'
module BloggerAPI
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def connect YAML_File
      ActiveRecord::Base.logger = Logger.new(STDOUT)
      @config = YAML::load_file YAML_File
      ActiveRecord::Base.establish_connection(@config)
    end
    def method_missing method, *args, &block
      super unless method =~ /[a-z]+_[a-z0-9_]+/
	  case method
    when /total_[a-z0-9]+/
      emptyString,table = method.to_s.split "total_"
      return eval "#{table.capitalize.singularize}.count;"
      
    when /group_blogs/
      return Blog.group("DATE_FORMAT(created_at, '%m-%y')").count('*')
      
    when /[a-z]+_[n0-9]+_[a-z]+/
      position,count,table= method.to_s.split "_"
      return (count=="n")? (eval "#{table.capitalize.singularize}.all;") :(eval "#{table.capitalize.singularize}.#{position}(#{count});")
      
    when /[a-z]+_by_date/
      table,empty= method.to_s.split "_by_date"
      hash=args[0]
      return eval "#{table.capitalize.singularize}.where(\"DATE_FORMAT(created_at,'%m-%y')='#{hash[:month]}-#{hash[:year]}'\")";
      
    when /[a-z]+_(in|by)_[a-z]+/
      child,relation,parent= method.to_s.split "_"
      puts "finding "+child+" in "+parent
      return (eval "#{parent.capitalize}.includes(:#{child}).all");
      
    else
      puts "WILL BE ADDED IN FUTURE!"
    end
  end
end
end

class Blogger
  include BloggerAPI
  connect 'database.yml'
end