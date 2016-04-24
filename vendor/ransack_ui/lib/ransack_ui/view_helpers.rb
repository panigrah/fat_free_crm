module RansackUI
  module ViewHelpers
    def ransack_ui_search(options = {})
      render 'ransack_ui/search', :options => options
    end

    def link_to_add_fields(name, f, type, options)
      new_object = f.object.send "build_#{type}"
      fields = f.send("#{type}_fields", new_object, :child_index => "new_#{type}") do |builder|
        render "ransack_ui/#{type.to_s}_fields", :f => builder, :options => options
      end

      link_to nil, :class => "add_fields btn btn-small btn-primary", "data-field-type" => type, "data-content" => "#{fields}" do
        "<i class=\"fa fa-plus\"></i><span>#{name}</span>".html_safe
      end
    end

    def link_to_remove_fields(name, f, options)
      link_to '<i class="fa fa-trash"></i>'.html_safe, nil, :class => "remove_fields btn btn-mini btn-danger"
    end
  end
end
