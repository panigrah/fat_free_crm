module CRM
  module Contact
    class Create < Trailblazer::Operation
      include Model
      model ::Contact, :create
      contract Contract::Create

      def process(params)
        validate(params[:account]) do |f|
          f.save
        end
      end
    end

    class Update < Create
      action :update
    end

    class Index < Trailblazer::Operation
      include Collection

      def model!(params)
        ::Contact.all
     end
    end

    class Search < Trailblazer::Operation
      include Collection
      def model!(params) 
        q = ::Contact.ransack(params[:q])
        results = q.result() #.order(params[:order]).page(params[:page]).include_all #.per(params[:per]).include_all
      end
    end
  end
end
