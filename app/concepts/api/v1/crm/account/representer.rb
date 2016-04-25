=begin
module API::V1
  module CRM
  	module Account
  	  module Representer
  	    class Create < ::Roar::Decorator
          feature ::Roar::JSON::HAL
   
          property   :name
          collection :users, embedded: true,
            as: :authors,
           populator: Reform::Form::Populator::External.new do
             property :email
 
             link(:self) { api_v1_user_path(represented.id) }
          end
 
          link(:self) { api_v1_thing_path(represented) }
        end
        
        class Index < ::Roar::Decorator
  	      feature ::Roar::JSON::HAL
  	      collection :to_a, as: :accounts, embedded: true, decorator: Create
  	    end
  	  end
  	end
  end
end

=end
