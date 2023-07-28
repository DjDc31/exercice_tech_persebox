# config/initializers/locale.rb
I18n.default_locale = :fr
Rails.application.config.i18n.default_locale = :fr

# Pour définir la devise par défaut sur l'euro
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag.html_safe
end

MoneyRails.configure do |config|
  config.default_currency = :eur
end
