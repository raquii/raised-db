require_relative "config/environment.rb"
require "sinatra/activerecord/rake"

desc "start console"
task :console do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    Pry.start
end