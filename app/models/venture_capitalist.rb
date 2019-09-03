class VentureCapitalist

    attr_accessor :name, :total_worth
    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select {|fr| fr.venture_capitalist == self}
    end


    def portfolio
        funding_rounds.map {|fr| fr.startup}.uniq
    end

    def biggest_investment
        biggest_investment = 0.0
        funding_rounds.each do |fr|
            if fr.investment > biggest_investment
                biggest_investment = fr.investment
            end
        end
        biggest_investment
    end

    def invested(domain)
        invested_domains = funding_rounds.select {|fr| fr.startup.domain == domain}
        investments = invested_domains.map {|fr| fr.investment}
        investments.sum
    end

    def self.tres_commas_club
        all.select {|vc| vc.total_worth > 1000000000 }
    end

    def self.all
        @@all
    end
end
