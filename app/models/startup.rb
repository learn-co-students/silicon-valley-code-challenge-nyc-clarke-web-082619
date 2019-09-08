class Startup
attr_accessor :name
attr_reader :founder, :domain
@@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end 

    def pivot(name, domain) #good
        self.name = name 
        self.domain = domain 
        self
    end 
   
    def sign_contract(vc, type, inv) #good
        FundingRound.new(self, vc, type, inv)
    end 

    def num_funding_rounds #good
        fr = FundingRound.all.select {|fr| fr.startup == self }
        return fr.count
    end 

    def all_investments #good
        FundingRound.all.select {|fr| fr.startup == self }
    end 

    def total_funds #good
        self.all_investments.sum { |inv| inv.investment }
    end 

    def investors #good
        self.all_investments.map {|inv| inv.venture_capitalist.name}.uniq
    end 

    def big_investors #GOOD
        big_inv = []
        self.investors.each do |inv| 
            if VentureCapitalist.tres_commas_club.include?(inv) 
                big_inv << inv 
            end 
        end 
        big_inv 
    end 

    def self.find_by_founder(founder_name) #good
        all.find {|startup| startup.founder == founder_name}
    end 

    def self.domains #good
        all.map {|startup| startup.domain}
    end 

    def self.all #good
        @@all
    end 

end
