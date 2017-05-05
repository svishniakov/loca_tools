require 'rubygems'
require 'redmine_rest'

RedmineRest::Models.configure_models user: 'admin', password: 'mir25ca07la88', site: 'http://locateam.co'

include RedmineRest::Models

issues_by_project = Issue.all.group_by_project
issues_by_project.each do |project, issues|
  puts project.name
  issues.each { |i| puts i.subject }
end
