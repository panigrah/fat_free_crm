module CRM
	module Account
	  class Create < Trailblazer::Operation
	    include Model
	    model ::Account, :create
	    contract Contract::Create

	    def process(params)
	    	puts params[:account].inspect

	    	validate(params[:account]) do |f|
	    		f.save
	    	end
	    end
	  end

	  class Update < Create
	  	action :update
	  end
	end
end
