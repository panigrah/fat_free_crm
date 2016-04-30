module CRM
  class ContactsController < CRM::ApplicationController
    before_action :get_data_for_sidebar, only: :index
    before_filter :load_search_ui, :only => :index
    respond_to :html, :json

      # GET /contacts
      #----------------------------------------------------------------------------
      def index
        ::Contact.all
        #@q = ::Account.ransack(params[:q])
        #collection CRM::Account::Search
        #respond_with({:data => @collection})
      end

      def new
        #form CRM::Account::Create
        @contact = ::Contact.new
        @account = ::Account.new(user: current_user)
      end

      def create
        run CRM::Account::Create do |op|
          return redirect_to op.model
        end

        render action: :new
      end

      def edit
        form CRM::Account::Update
        render action: :new
      end

      def update
        run CRM::Account::Update do |op|
          return redirect_to op.model
        end

        render action: :new
      end

      def show
        present CRM::Contact::Update
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

    def load_search_ui
      klass ||= controller_path.classify.constantize
          @ransack_search = ::Account.search(params[:q])
          @ransack_search.build_grouping if @ransack_search.groupings.empty?
          @ransack_search
        end
  end
end