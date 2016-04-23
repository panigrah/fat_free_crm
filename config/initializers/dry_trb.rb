require 'dry/validation'
Dry::Validation::Schema.configure do |config|
  config.messages_file =  "#{Rails.root}/config/locales/en/error.yml"
end