require 'cell/translation'

module CRM
  class Account::Cell < Cell::Concept
    include ::Cell::Translation 
    include ActionView::Helpers::TranslationHelper
    include ActionView::Helpers::NumberHelper

    property :name
    property :website
    property :email
    property :toll_free_phone
    property :phone
    property :fax
    property :billing_address
    property :shipping_address
    property :category
    property :assigned_to
    property :background_info
    property :tag_list

    def pipeline
      model.opportunities.pipeline.map(&:weighted_amount).compact.sum
    end

    def won
      model.opportunities.won.map(&:amount).compact.sum
    end

    def lost
      model.opportunities.lost.map(&:amount).compact.sum
    end

    def rating
    end

    def show
      render
    end

    def panel
      render
    end
  end
end