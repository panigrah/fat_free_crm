module CRM
  module Campaign::Contract
    class Create < CRM::EntityForm
      model :campaign

      property :user
      property :assignee
      property :name
      property :access
      property :status
      property :budget
      property :title
      property :target_leads
      property :target_revenue
      property :target_conversion
      property :leads_count
      property :opportunities_count
      property :revenue
      property :starts_on
      property :ends_on
      property :objectives
      property :background_info
      property :subscribed_users

      validation :default do
        required(:name) { filled? }
        #validate name is unique for user
        #validate start date is > than end date
        #validate if shared access - then must have 1 user in subscribed_users
        #validate a valid status from Settings:campaign_status
      end
    end
  end
end