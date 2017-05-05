require 'rubygems'
require 'active_resource'

# Issue model on the client side
class Issue < ActiveResource::Base
  self.site = 'http://www.redmine.org'
  self.user = 'admin'
  self.password = 'admin'
  self.include_root_in_json = false
end

# Retrieving an issue
#
start_date = Time.parse("2016-10-25")
end_date = Time.parse("2016-11-25")

# issues = Issue.find(:all, :conditions => {:created_at => start_date..end_date})

issues = Issue.find(:all)

# puts issues.subject

# issues.find_each do |i|
#   puts issues.subject
# end
# issues.find_each do |i|
#   puts i.subject
# end
