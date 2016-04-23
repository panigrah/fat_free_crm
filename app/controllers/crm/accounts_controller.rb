module CRM
	class AccountsController < CRM::ApplicationController
		before_action :get_data_for_sidebar, only: :index

		# GET /accounts
  		#----------------------------------------------------------------------------
	  	def index
	  		collection CRM::Account::Index
	  	end

	  	#TODO: What does this do?
	  	def filter
	  	end

		def get_data_for_sidebar
    		@account_category_total = HashWithIndifferentAccess[
                              ::Setting.account_category.map do |key|
                                [key, ::Account.my.where(category: key.to_s).count]
          					   end
    						]
   			 categorized = @account_category_total.values.sum
    		@account_category_total[:all] = ::Account.my.count
    		@account_category_total[:other] = @account_category_total[:all] - categorized
 		end
	end
end