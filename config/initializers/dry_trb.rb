require 'i18n'
require 'dry/validation'
require 'reform/form/dry'

Dry::Validation::Schema::Form.configure do |config|
  #config.messages = :yaml
  config.messages_file =  "#{Rails.root}/config/locales/en/dry-v-custom-messages.yml"
end