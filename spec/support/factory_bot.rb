# spec/support/factory_bot.rb
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

Dir[Rails.root.join("spec", "factories", "*.rb")].each { |file| require file }
