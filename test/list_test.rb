require 'test_helper'

describe CryptoVal::List do
  let(:list_data) { [ {:symbol=>"USC", :name=>"Ultimate Secure Cash", :algorithm=>"SHA256"},
                      {:symbol=>"DUX", :name=>"DuxCoin", :algorithm=>"Scrypt"}, 
                      {:symbol=>"XPS", :name=>"PoisonIvyCoin", :algorithm=>"Scrypt"} ] }
  let(:list_klass) { Minitest::Mock.new }
  let(:latest) { CryptoVal::List.new(list_klass: list_klass) }
  
  before do
    list_klass.expect :fetch, list_data
  end
  
  describe "#fetch" do
    let(:fetch_data) { latest.fetch }
  
    it "returns the correct number" do
      fetch_data.size.must_equal 3
    end
    
    it "returns the symbol" do
      fetch_data[0][:symbol].must_equal "USC"
    end
    
    it "returns the name" do
      fetch_data[0][:name].must_equal "Ultimate Secure Cash"
    end
  end
  
end
