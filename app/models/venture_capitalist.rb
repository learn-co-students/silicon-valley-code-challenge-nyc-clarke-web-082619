class VentureCapitalist
    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        @@all.select {|vc| vc.total_worth > 1000000000}
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select {|fr| fr.venture_capitalist == self}
    end

    def portfolio
        funding_rounds.map {|fr|fr.startup}.uniq {|x|x}
    end

    def biggest_investment
        funding_rounds.max {|f1, f2| f1.investment <=> f2.investment}
    end

    def invested(domain)
        funding_rounds.select {|fr|fr.startup.domain == domain}.reduce(0) {|start, fr| start + fr.investment}
    end

end
