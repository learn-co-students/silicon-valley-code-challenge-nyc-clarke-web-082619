class VentureCapitalist
attr_accessor :name, :total_worth  
@@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end 

    def offer_contract(startup, type, inv_amt) #good
        FundingRound.new(startup, self, type, inv_amt)
    end 

    def funding_rounds #good
        FundingRound.all.select {|fr| fr.venture_capitalist == self }
    end

    def portfolio #good
        funding_rounds.map {|fr| fr.startup.name}.uniq
    end

    def biggest_investment #GOOD
        funding_rounds.max_by do |fr| 
            fr.investment
        end 
    end 
  
    def invested(domain1) #NOT GOOD - returns the total amount invested in that domain
        Startup.domain.each do |startup| 
            
        # invested = []
        # funding_rounds.each do |fr|
        #     if fr.domain == domain1
        #         invested << fr.investment
        #     end 
        # end 
        # invested.sum
    end 

    def self.all #good
        @@all
    end 

    def self.tres_commas_club  #good
        all.select {|vc| vc.total_worth > 1000000}.map{|vc| vc.name} 
    end 

end
