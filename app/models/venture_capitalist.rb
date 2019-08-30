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
    self.all.select{|person| person.total_worth > 1_000_000_000}
  end

  def offer_contract(startup, type, amt)
    FundingRound.new(startup, self, type, amt)
  end

  def funding_rounds
    FundingRound.all.select{|round| round.venture_capitalist == self}
  end

  def portfolio
    funding_rounds.map{|rounds| rounds.startup}.uniq
  end

  def biggest_investment
    funding_rounds.sort_by{|round| round.investment}[-1]
  end

  def invested(domain)
    domains = funding_rounds.select{|round| round.startup.domain == domain}
    domains.map{|dom| dom.investment}.reduce(&:+)
  end
  
end
