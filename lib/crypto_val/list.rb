module CryptoVal
  class List
    # Gets all cryptocurrency name and symbols
    
    def initialize opts={}
      @list_klass = opts[:list_klass] || CryptoVal::List::CryptoCompare
    end
    
    def fetch
      formatted
    end
    
    def self.fetch opts={}
      new(opts).fetch
    end
  
    private
    
    def default_data
      @default_data ||= @list_klass.fetch
    end
    
    def formatted
      @formatted ||= default_data.map{|d| { symbol: d[:symbol], name: d[:name] } }
    end
  end
end
