module CryptoVal
  class List
    # Gets all cryptocurrency name and symbols
    
    def fetch
      formatted
    end
    
    def self.fetch
      new.fetch
    end
  
    private
    
    def default_data
      @default_data ||= CryptoVal::List::CryptoCompare.fetch
    end
    
    def formatted
      @formatted ||= default_data.map{|d| { symbol: d[:symbol], name: d[:name] } }
    end
  end
end
