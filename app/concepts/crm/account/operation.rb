module CRM
  module Account
    class Create < Trailblazer::Operation
      include Model
      model ::Account, :create
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
        ::Account.all
     end
    end

    class Search < Trailblazer::Operation
      include Collection
      def model!(params) 
        q = ::Account.ransack(params[:q])
        results = q.result() #.order(params[:order]).page(params[:page]).include_all #.per(params[:per]).include_all
      end
    end
  end
end
