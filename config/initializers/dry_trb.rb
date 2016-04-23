require 'dry/validation'
Dry::Validation::Schema.configure do |config|
  config.messages =  :i18n #"#{Rails.root}/config/locales/en/error.yml"
end