# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

url = "https://api.wazirx.com/api/v2/tickers"
response = RestClient.get(url)
value = JSON.parse(response)

keys = value.keys
i = 0

while i <= 347
    CryptoInfo.create!(label: keys[i], name: value[keys[i]]["name"], last: value[keys[i]]["last"], low: value[keys[i]]["low"], high: value[keys[i]]["high"], buy: value[keys[i]]["buy"], sell: value[keys[i]]["sell"], volume: value[keys[i]]["volume"])
    i = i + 1 
end
