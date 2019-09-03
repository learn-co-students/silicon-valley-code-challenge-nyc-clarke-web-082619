require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

st1 = Startup.new("Jump Socks", "Jeffrey Socksman", "clothing")
vc1 = VentureCapitalist.new("Joy", 1560472)
fr1 = FundingRound.new(st1, vc1, "Angel", 20000)

st2 = Startup.new("things", "people", "subject")
st2.sign_contract(vc1, "seed", 10000)

st3 = Startup.new("Banana Peeler", "Abigail Splitz", "Home Goods")
vc2 = VentureCapitalist.new("Jenny", 156046574658564846393729283072)
fr2 = FundingRound.new(st3, vc2, "Angel", 29999999000)

st4 = Startup.new("stuff", "humans", "subject")
vc2.offer_contract(st4, "seed", 875965964)
binding.pry
0 #leave this here to ensure binding.pry isn't the last line