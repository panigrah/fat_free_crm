# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
module Ransack
  Configuration.class_eval do
    # Set default predicate options for predicate_select in form builder
    # This is ignored if any options are passed
    def default_predicates=(options)
      self.options[:default_predicates] = options
    end

    def ajax_options=(options)
      self.options[:ajax_options] = options
    end
  end
end



Ransack.configure do |config|
  config.default_predicates = {
    compounds: true,
    only: [
      :cont, :not_cont, :blank, :present, :true, :false, :eq, :not_eq,
      :lt, :gt, :null, :not_null, :matches, :does_not_match
    ]
  }

  config.ajax_options = {
    url: '/:controller/auto_complete.json',
    type: 'POST',
    key: 'auto_complete_query'
  }
end
