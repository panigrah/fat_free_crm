module CRM
  module Task
    class Create < Trailblazer::Operation
      include Model
      model Task, :create

      contract Contract::Create
    end

    class Confirm < Trailblazer::Operation
      include Model
      model Task, :find
      def process(params)
        model.completed_by = params[:current_user]
        model.completed_at = Time.now
        model.save
      end

      # why is this necessary?
      def model!(params)
        ::Task.find(params[:id])
      end
    end

    class Delete < Confirm

      def process(params)
        model.destroy
      end

    end
  end
end
