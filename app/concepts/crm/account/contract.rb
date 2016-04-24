module CRM
  module Account::Contract
    class Create < CRM::EntityForm
      model :account

      #look at composition; many of these attributes are shared across models TBD
      property :user_id
      property :assigned_to
      property :name
      property :background_info
      property :category

      property :access
      property :website
      property :toll_free_phone
      property :phone
      property :fax
      property :email
      property :background_info
      property :rating
      property :subscribed_users

      property :billing_address, form: Address::Contract::Create, prepopulator: :set_billing_address, populate_if_empty: -> (options) { model.build_billing_address }
      property :shipping_address, form: Address::Contract::Create, prepopulator: :set_shipping_address, populate_if_empty: -> (options) { model.build_shipping_address }

      def set_billing_address
        self.build_billing_address if self.billing_address.nil?
      end

      def set_shipping_address
        self.build_shipping_address if self.billing_address.nil?
      end

      validation :default do
        required(:name) { filled? & unique? }   
        optional(:rating).maybe(inclusion?: [0,1,2,3,4,5])
        optional(:category).maybe(inclusion?: Setting.unroll(:account_category).map { |s| s.last.to_s })	

        configure do
          def unique?(name)
            ::Account.where(:name => name).first.blank?
          end
        
    		  #def users_for_shared_access
        	#	errors.add(:access, :share_account) if self[:access] == "Shared" && !permissions.any?
      		#end
        end
      end
    end
  end
end