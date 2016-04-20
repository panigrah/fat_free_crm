# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'fat_free_crm/version'

Gem::Specification.new do |gem|
  gem.name = 'fat_free_crm'
  gem.authors = ['Michael Dvorkin', 'Ben Tillman', 'Nathan Broadbent', 'Stephen Kenworthy']
  gem.summary = 'Fat Free CRM'
  gem.description = 'An open source, Ruby on Rails customer relationship management platform'
  gem.homepage = 'http://fatfreecrm.com'
  gem.email = ['mike@fatfreecrm.com', 'nathan@fatfreecrm.com', 'warp@fatfreecrm.com', 'steveyken@gmail.com']
  gem.files = `git ls-files`.split("\n")
  gem.version = FatFreeCRM::VERSION::STRING
  gem.required_ruby_version = '>= 2.0.0'
  gem.license = 'MIT'

  
  # FatFreeCRM has released it's own versions of the following gems:
  #-----------------------------------------------------------------

end
