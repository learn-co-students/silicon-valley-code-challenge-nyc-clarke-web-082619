class VentureCapitalist
    attr_accessor :name, :total_worth
    @@all = []
    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def offer_contract(startup,type,investment)
        FundingRound.new(startup,self,type,investment)
    end

    def funding_rounds
        FundingRound.all.select{|x| x.venture_capitalist == self}
    end

    def portfolio
        arr = []
        funding_rounds.each{|x| arr << x.startup}
        arr.uniq
    end

    def biggest_investment
        arr = []
        funding_rounds.each{|x| arr << x.investment}
        arr.max
    end

    def invested(d)
        sum = 0
        funding_rounds.select{|x| x.domain == d}.each{|y| sum+= y.investment}
        sum
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        @@all.select{|x| x.total_worth > 1000000000}
    end

end
