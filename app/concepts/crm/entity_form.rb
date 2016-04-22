require 'reform/form/dry'

module CRM
	class EntityForm < Reform::Form
		include Reform::Form::Dry::Validations

		property :id
		property :created_at
		property :updated_at
		property :deleted_at
	end
end