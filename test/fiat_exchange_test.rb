require 'test_helper'

describe CryptoVal::FiatExchange do
  let(:source_currency) { "USD" }
  let(:target_currency) { "PHP" }
  let(:current_date) { Date.today }
  let(:exchange_rate) { 51.23 }
  let(:exchange_data) { { source: source_currency,
                          target: target_currency,
                          date: current_date,
                          rate: exchange_rate } 
                      }
  let(:exchange) { Minitest::Mock.new }
  let(:fiat_exchange) { CryptoVal::FiatExchange.new(source_currency: source_currency, target_currency: target_currency, exchange_class: exchange) }
  
  before do
    exchange.expect :fetch, exchange_data, [{source_currency: source_currency, target_currency: target_currency}]
  end
  
  describe "#fetch" do
    let(:fetch_data) { fiat_exchange.fetch }
  
    it "returns the source currency" do
      fetch_data[:source_currency].must_equal source_currency
    end
    
    it "returns the target currency" do
      fetch_data[:target_currency].must_equal target_currency
    end
    
    it "returns the date" do
      fetch_data[:date].to_s.must_equal current_date.to_s
    end
    
    it "returns the rate" do
      fetch_data[:rate].must_equal exchange_rate
    end
  end
  
end
