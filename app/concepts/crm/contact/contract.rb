module CRM
  module Contact::Contract
    class Create < CRM::EntityForm
      model :contact

      property :lead
      property :assignee
      property :reportee
      property :first_name
      property :last_name
      property :access
      property :title
      property :department
      property :source
      property :email
      property :alt_email
      property :phone
      property :mobile
      property :fax
      property :blog
      property :linkedin
      property :facebook
      property :skype
      property :twitter
      property :born_on
      property :do_not_call
      property :background_info
      property :subscribed_users

      validation :default do
        required(:first_name) { filled? }
        required(:last_name) { filled? }
      end
    end
  end
end