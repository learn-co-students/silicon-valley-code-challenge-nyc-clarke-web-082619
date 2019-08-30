require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

pied_piper = Startup.new("Pied Piper", "Richard Hendricks", "Compression")
pied_piper_coin = Startup.new("Pied Piper Coin", "Richard Hendricks", "Cryptocurrency")
bitcoin = Startup.new("Bitcoin", "Satoshi Nakamoto", "Cryptocurrency")

peter_gregory = VentureCapitalist.new("Peter Gregory", 9999999999.00)
gavin_belson = VentureCapitalist.new("Gavin Belson", 123456789.1)

round4 = bitcoin.sign_contract(peter_gregory, "Series A", 2666666666)
round1 = pied_piper.sign_contract(peter_gregory, "Angel", 1000000.21)
round2 = pied_piper.sign_contract(gavin_belson, "Pre-seed",20000000.4)
round3 = pied_piper.sign_contract(peter_gregory, "Series A", 55000000.0)
round5 = pied_piper_coin.sign_contract(peter_gregory, "Series A", 111111.0)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line