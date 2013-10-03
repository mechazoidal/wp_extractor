
# -*- ruby -*-

require 'rubygems'
require 'hoe'

Hoe.spec 'wp_extractor' do
  developer('Scott Francis', 'scott@kurokoproject.com')

  extra_deps << ['sequel', '3.33.0']
  extra_deps << ['json', '1.6.5']
  extra_deps << ['addressable', '2.2.8']
  # self.rubyforge_name = 'wp_extractorx' # if different than 'wp_extractor'
end

desc 'open a pry console'
task :console do
  require 'sequel'
  DB = Sequel.mysql('kp_blog', :host=>'127.0.0.1', :user=>'devuser', :password=>'devuser')
  require_relative 'lib/wp_extractor.rb'
  require_relative 'lib/wp_extractor/post.rb'
  require_relative 'lib/wp_extractor/term.rb'
  require_relative 'lib/wp_extractor/comment.rb'
  require 'pry'
  binding.pry
  # 
end

# vim: syntax=ruby
