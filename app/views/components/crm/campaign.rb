module Components
  module CRM
    class Campaign < React::Component::Base
      param :model

      def render
      	div do 
          li do
            div(:className => params.model['status']) do
              "#{params.model['status']}"
            end

            div(:className => 'indent') do
              "campaign status"
              "campaign metrics"
            end
          end
      	end
      end
    end
  end
end