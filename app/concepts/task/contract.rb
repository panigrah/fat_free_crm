require 'reform/form/dry'

class Task::Contract::Create < Reform::Form
  include Reform::Form::Dry::Validations
  model :task

  property :id
  property :user_id
  property :assigned_to
  property :completed_by
  property :name
  property :asset_id
  property :asset_type
  property :priority
  property :category
  property :bucket
  property :due_at
  property :completed_at
  property :deleted_at
  property :created_at
  property :updated_at
  property :background_info

  validation :default do
    require(:name)
  end

end
