module CRM
  module Entity
    module Account::Contract
      class Create < CRM::Entity::Form
        model :account

        #look at composition; many of these attributes are shared across models TBD
        property :user_id
        property :assigned_to
        property :name
        property :completed_at
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

        property :billing_address, form: Address::Contract::Create, prepopulator: :set_billing_address, populate_if_empty: -> (*) {Address.new(:type => 'Billing')}
        property :shipping_address, form: Address::Contract::Create, prepopulator: :set_shipping_address, populate_if_empty: -> (*) {Address.new(:type => 'Shipping')}

        def set_billing_address
          self.billing_address = Address.new(:address_type => 'Billing') if self.billing_address.nil?
        end

        def set_shipping_address
          self.shipping_address = Address.new(:address_type => 'Shipping') if self.billing_address.nil?
        end

        validation :default do
          key(:name) { filled? && unique? }    
          optional(:rating).maybe(inclusion?: 0..5)
          optional(:category).maybe(inclusion?: Setting.unroll(:account_category).map { |s| s.last.to_s })	

          configure do
            def unique?(name)
              Account.where(:name => name).one.blank?
            end
          
      		#def users_for_shared_access
          	#	errors.add(:access, :share_account) if self[:access] == "Shared" && !permissions.any?
        		#end
          end
        end
      end
    end
  end
end