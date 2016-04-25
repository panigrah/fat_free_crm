=begin
require 'representable/json'
module API::V1
  module CRM
  	module Account
  	class Index < Trailblazer::Operation
      include Trailblazer::Operation::Representer, Responder
      representer Representer::Index

      def model!(params)
        ::Account.all
      end

      def to_json(*) 
        options = {user.options: {}}
        options[user_options][:params] = @params
        super(options)
      end
  	end
    
    class Create < ::CRM::Account::Create
      include Representer
      representer Representer::Create
    end
  end
end
end



=end
