require 'rubygems'
require 'active_record'
require 'logger'
require 'yaml'

require './model/blog.rb'
require './model/user.rb'
require './model/post.rb'
require './model/comment.rb'


ActiveRecord::Base.logger = Logger.new(STDOUT)
@config = YAML::load_file('./database.yml')
ActiveRecord::Base.establish_connection(@config)