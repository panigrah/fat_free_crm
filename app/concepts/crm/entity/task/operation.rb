module CRM
	module Entity
		module Task
		  class Create < Trailblazer::Operation
		    include Model
		    model Task, :create

		    contract Contract::Create
		  end
		end
	end
end
