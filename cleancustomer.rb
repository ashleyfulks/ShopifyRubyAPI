# Initialize gems
puts "Setting up Gems..."
require 'shopify_api'
require 'httparty'
require 'dotenv'
Dotenv.load

# Declare variables
puts "Declaring Variables..."
API_KEY = ENV['API_KEY']
API_SECRET = ENV['API_SECRET']
API_SHOP = ENV['API_SHOP']

# Customers from original shop to be deleted. All created with the API by accident in a bad clone.
@CustomerIds = [
  "803461955695",
  "805660524655",
  "845475872879",
  "1022933041263",
  "1022933008495",
  "1022932877423",
  "1022932975727",
  "1022932844655",
  "1022932942959",
  "1022932910191",
  "1022933074031",
  "1022933237871",
  "1022933106799",
  "1022933139567",
  "1022933172335",
  "1022933205103",
  "1022933729391",
  "1022934057071",
  "1022933500015",
  "1022933532783",
  "1022933762159",
  "1022934024303",
  "1022933631087",
  "1022933467247",
  "1022934122607",
  "1022934155375",
  "1022933663855",
  "1022933434479",
  "1022933794927",
  "1022933958767",
  "1022933827695",
  "1022933598319",
  "1022933991535",
  "1022933860463",
  "1022934089839",
  "1022933401711",
  "1022933368943",
  "1022933925999",
  "1022933696623",
  "1022933893231",
  "1022933303407",
  "1022933336175",
  "1022933565551",
  "1022934810735",
  "1022934548591",
  "1022934483055",
  "1022934679663",
  "1022934253679",
  "1022934712431",
  "1022934581359",
  "1022934319215",
  "1022934351983",
  "1022934286447",
  "1022934384751",
  "1022934646895",
  "1022934220911",
  "1022934515823",
  "1022934450287",
  "1022934745199",
  "1022934777967",
  "1022934614127",
  "1022934417519",
  "1022934941807",
  "1022934974575",
  "1022935072879",
  "1022935236719",
  "1022935040111",
  "1022934843503",
  "1022935302255",
  "1022934909039",
  "1022934876271",
  "1022935105647",
  "1022935007343"
]

#Setup Basic Authentication for httparty
# https://stackoverflow.com/questions/7627419/how-to-use-basic-authentication-with-httparty-in-a-rails-app
puts "Setting Up HTTParty Basic Auth..."
@auth = {:username => API_KEY, :password => API_SECRET}

#Run app
puts "running app test now..."
#@test = HTTParty.get("https://" + API_SHOP + "/admin/shop.json", :basic_auth => auth)
#puts @test

# Create access method for code reuse
#def getData(command)
#  gettingData = HTTParty.get("https://" + API_SHOP + command), :basic_auth => auth)
#  return gettingData
#end

# Access customers, download complete list of customers and store in an array
#def getCustomers
#  @getCustomers = HTTParty.get("https://" + API_SHOP + "/admin/customers.json", :basic_auth => @auth)
#puts @getCustomers
#end

def deleteImportedCustomers

  @CustomerIds.each { |custId|
    response = HTTParty.delete("https://" + API_SHOP + "/admin/customers/" + custId + ".json", :basic_auth => @auth)
    puts "Deleting first customer ID:" + custId + response.to_s
    # Lets not flood API calls so sleep for a small time. Confirmed with Splunk this is fine and should not be throttled.
    sleep(0.25)
  }
end

deleteImportedCustomers
