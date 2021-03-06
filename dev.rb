folder = File.expand_path('.',__dir__)
$:.unshift(folder) unless $:.include?(folder)
folder = File.expand_path('lib',__dir__)
$:.unshift(folder) unless $:.include?(folder)

require 'interfi_capital'
require 'yaml'

@config = YAML.load_file('dev_config.yml')
@req = InterfiCapital::Origination.new(@config['api_key'], @config['username'], @config['password'])

# puts "You now have an instance to use."

# setup
InterfiCapital.configuration = InterfiCapital::Configuration.new(YAML.load_file('dev_config.yml'))

fa = InterfiCapital::Dto::FinancialApplication.new({
  user_id: 'example',
  application_amount: 15_000.00,
  approved_amount: 10_000.00,
  term_in_months: 36,
  purpose: "test application",

})

party = InterfiCapital::Dto::Party.new()
party.detail_type = InterfiCapital::Dto::Party::DETAIL_TYPE.sample
party.association = InterfiCapital::Dto::Party::ASSOCIATION.sample
party.title = "Mr"
party.first_name = "Joe"
party.middle_names = "Bloggs"
party.last_name = "Dirt"
fa.parties = [party]

account = InterfiCapital::Dto::Account.new()
account.product_code = "pc001"
account.description = "a test account"
account.opening_limit = 10_000.00
account.fixed_interest = true
account.fixed_interest_term_in_months = 36
account.interest_only_repayments = false
account.instalment_frequency = InterfiCapital::Dto::Account::INSTALMENT_FREQUENCY.sample

rate = InterfiCapital::Dto::RateComponent.new()
rate.rate_type = InterfiCapital::Dto::RateComponent::RATE_TYPE.sample
rate.start_from = InterfiCapital::Dto::RateComponent::START_FROM.sample
rate.stop_on = InterfiCapital::Dto::RateComponent::STOP_ON.sample
rate.component_type = InterfiCapital::Dto::RateComponent::COMPONENT_TYPE.sample
rate.rate_class_code = 1.2345 #seems like the actual rate
rate.effective_from = (Date.today << 12*1).to_s # << removes a month from a date
rate.effective_to = (Date.today >> 12*5).to_s # >> adds months to a date
rate.number_of_months = 60
rate.add_to_delivery_rate = true

account.rate_components = [rate]

fa.accounts = [account]

puts fa.to_hash.to_yaml


result = @req.originate(fa)

puts result

exit

