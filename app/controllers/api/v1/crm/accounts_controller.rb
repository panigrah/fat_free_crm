=begin
module API::V1
  module CRM
    class AccountsController < ApplicationController
      def index
        respond Account::Index, present: true
      end
    end
  end
end=end
