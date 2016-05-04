require 'cell/translation'
require "gravatar_image_tag"

#render "shared/address_show", :asset => @contact, :type => 'business', :title => :address
#render "fields/sidebar_show", :asset => @contact

module CRM
  module Contact
    module Cell
      class Show < Trailblazer::Cell
        include ::Cell::Translation 
        include ActionView::Helpers::TranslationHelper
        include ActionView::Helpers::NumberHelper
        include ::ApplicationHelper
        include GravatarImageTag

        def controller_path
          "crm.contact"
        end
        
        property :full_name
        property :phone
        property :email
        property :mobile
        property :alt_email
        property :lead
        property :assigned_to
        property :assignee
        property :background_info
        property :tag_list
        property :title
        property :job_title
        property :account
        property :department
        property :created_at

        def contact
          return @model
        end

        def work_details
          contact = @model
          text = if !title.blank? && account
                 # works_at: "{{h(job_title)}} at {{h(company)}}"
                 content_tag :div, t(:works_at, job_title: h(title), company: h(account_with_url_for(@model))).html_safe
               elsif !title.blank?
                 content_tag :div, h(title)
               elsif account
                 content_tag :div, account_with_url_for(contact)
               else
                 ""
          end
          text << t(:department_small, h(department)) unless department.blank?
          text
        end

        def avatar_photo
          avatar_for(@model, :size => "50x50", :class=> "gravatar profile-user-img img-responsive img-circle'")
        end

        def social_icons
          web_presence_icons(@model)
        end

        def tags
          tag_list.inspect
        end

        private
        def h(v)
          v
        end
      end

      class Panel < Show
      end

      class Brief < Show
        def summary
          text = ""
          account_text = ""
          #account_text = link_to_if(can?(:read, account), h(account.name), account_path(account)) if account.present?
          account_text = "<a href='#{account_path(account)}'>#{h(account.name)}</a>"if account.present?

          text << if title.present? && department.present?
                    t(:account_with_title_department, title: h(title), department: h(department), account: account_text)
                  elsif title.present?
                    t(:account_with_title, title: h(title), account: account_text)
                  elsif department.present?
                    t(:account_with_title, title: h(department), account: account_text)
                  elsif account_text.present?
                    t(:works_at, job_title: "", company: account_text)
                  else
                    ""
              end
          text.html_safe
        end
      end

      class Detail < Brief
      end
    end
  end
end