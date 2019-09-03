class VentureCapitalist

    attr_reader :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def offer_contract(startup, type, investment)
        fr = FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select { |round| round.venture_capitalist == self }.uniq
    end

    def biggest_investment
        funding_rounds.max_by(&:investment)
    end

    def portfolio
        funding_rounds.map(&:startup)
    end

    def invested(domain)
        total = 0.0
        funding_rounds.each {|round| total += round.investment if round.startup.domain == domain}
        total
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        all.select {|vc| vc.total_worth > 1000000000}
    end
    



end
