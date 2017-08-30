require 'test_helper'

describe CryptoVal::Latest do
  let(:crypto_symbol) { "BTC" }
  let(:currency) { "PHP" }
  let(:current_date) { Date.today }
  let(:exchange_rate) { 51.23 }
  let(:price) { 100.34 }
  let(:crypto_data) { { symbol: crypto_symbol,
                        currency: currency,
                        price: price } 
                      }
  let(:fiat_data) { { source: "USD",
                          target: currency,
                          date: current_date,
                          rate: exchange_rate } 
                      }
  let(:crypto_klass) { Minitest::Mock.new }
  let(:fiat_klass) { Minitest::Mock.new }
  let(:latest) { CryptoVal::Latest.new(symbol: crypto_symbol, currency: currency, crypto_klass: crypto_klass, fiat_klass: fiat_klass) }
  
  before do
    crypto_klass.expect :fetch, crypto_data, [{ symbol: crypto_symbol }]
    fiat_klass.expect :fetch, fiat_data, [{ target_currency: currency }]
  end
  
  describe "#fetch" do
    let(:fetch_data) { latest.fetch }
  
    it "returns the symbol" do
      fetch_data[:symbol].must_equal crypto_symbol
    end
    
    it "returns the currency" do
      fetch_data[:currency].must_equal currency
    end
    
    it "returns the value" do
      val = (price * exchange_rate).round(2)
      fetch_data[:value].must_equal val
    end
  end
  
end
