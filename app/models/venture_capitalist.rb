class VentureCapitalist
    @@all = []

    attr_reader :name
    attr_accessor :total_worth

    def initialize(name, total_worth = 0)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def funding_rounds
        FundingRound.all.select{|round| round.venture_capitalist == self}
    end

    def portfolio
        my_startups = []
        funding_rounds.each do |round|
            if !my_startups.include?(round.startup)
                my_startups << round.startup
            end
        end
        my_startups
    end

    def biggest_investment
        sorted_rounds =  funding_rounds.sort_by {|round| round.investment}
        sorted_rounds.last
    end

    def domains
        my_domains = []
        funding_rounds.each do |round|
            if !my_domains.include?(round.startup.domain)
                my_domains << round.startup.domain
            end
        end
        my_domains
    end

    def invested(query)
        total = 0.0
        funding_rounds.each do |round|
            if round.startup.domain == query then
                total += round.investment
            end
        end
        total
    end

    def self.tres_commas_club
        all.select {|vc| vc.total_worth.to_f >= 1000000000.00}
    end

    def self.all
        @@all
    end
end
