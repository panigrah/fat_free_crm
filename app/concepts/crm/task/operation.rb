module CRM
    module Task
      class Create < Trailblazer::Operation
        include Model
        model Task, :create

        contract Contract::Create
      end
    end
end
