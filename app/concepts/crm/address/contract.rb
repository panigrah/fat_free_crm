module CRM
    module Address::Contract
      class Create < CRM::EntityForm
        property :street1
        property :street2
        property :city
        property :state
        property :zipcode
        property :country
        property :full_address
        property :address_type
        property :addressable
        property :address_type

        #validation :default do
        # key(:address_type) { filled? }

          #TBD Rules are failing
          #rule(reject_blank_address: [:street1. :street2, :city, :state, :zipcode, :country, :full_address]) do |street1, street2, city, state, zipcode, country, full_address|
              # empty = [street1, street2, city, state, zipcode, country, full_address].map {|attribute| attribute.blank?}.all?
              # #set destroy = 1 if this is an empty address or do we care?
              # empty
              #end
        #end
    end
  end
end
