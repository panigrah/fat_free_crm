module Crm
	class AccountsController < CRM::ApplicationController
		# GET /accounts
  		#----------------------------------------------------------------------------
	  def index
	  	collection CRM::Account::Index
	  end
	end
end