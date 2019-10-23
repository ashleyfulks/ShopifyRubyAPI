=begin

Hi there. This file is used to delete products or customers in bulk.
This app runs on your local computer and connects to Shopify's API using basic authentication.
This is especially helpful in automating difficult tasks, such as mass deleting customers.
We are using HTTParty to connect to the shop's API.

To start, you will have to install these 3 gems on your system and have ruby installed. Enter the commands below into terminal. Skip this if you already have these installed!

First install Homebrew:
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

Then install Ruby using Homebrew:
brew install ruby

Run these commands:
sudo gem install httparty
sudo gem install dotenv

To access the shop backend, you need to create an app that is allowed to access the store your working on.
You will be creating API keys and storing them in a secret file that will not upload to Github, called a ".env" file.
This is what the require 'dotenv' library does above, lets you access that data in another file.

Open the ".env" file and follow the instuctions there. After that, come back here and continue.

You will need to compile a list of products or customers to delete and add them to this file in the array called @deleteIds.
Get this data from a CSV or SQL and use something like https://delim.co/ to convert it to an array. 
Don't forget to wrap them in quotes! (ie "4326764454","654234565")

Next scroll to the bottom of this app and uncomment the function you wish to run, deleteCustomers or deleteProducts. 

Running the app

When you want to run your program, use terminal, navigate to the directory where you 
stored this file and then type this command and press enter:

ruby basicApp.rb

This will attempt to run the app, if everything is set correctly the delete process will start. Allow it to run until 
it is done!

=end

# Delete this dummy data and replace it with your ids to delete
@deleteIds = [
  "803461955695",
  "805660524655",
  "845475872879",
  "1022933041263"
]

# Initialize the libraries...
puts "Starting program. Initializing libraries..."
require 'httparty'
require 'dotenv'
Dotenv.load

# Next you want to declare your private app variables
puts "Declaring Variables..."
API_KEY = ENV['API_KEY']
API_SECRET = ENV['API_SECRET']
API_SHOP = ENV['API_SHOP']

#Setup Basic Authentication for httparty
# https://stackoverflow.com/questions/7627419/how-to-use-basic-authentication-with-httparty-in-a-rails-app
puts "Setting Up HTTParty Basic Auth..."
@auth = {:username => API_KEY, :password => API_SECRET}
@loopNumber = 0

#Run app
puts "running app test now..."

# this function deletes customers
def deleteCustomers

  @deleteIds.each { |deleteId|
    response = HTTParty.delete("https://" + API_SHOP + "/admin/customers/" + deleteId + ".json", :basic_auth => @auth)
    @loopNumber = @loopNumber + 1
    puts "Deleting " + @deleteId.to_s + " Customer ID:" + deleteId + response.to_s
    # Lets not flood API calls so sleep for a small time. Confirmed with Splunk this is fine and should not be throttled.
    sleep(0.20)
  }
end

# this function deletes products
def deleteProducts

  @deleteIds.each { |deleteId|
    response = HTTParty.delete("https://" + API_SHOP + "/admin/products/" + deleteId + ".json", :basic_auth => @auth)
    @loopNumber = @loopNumber + 1
    puts "Deleting " + @deleteId.to_s + " Product ID:" + deleteId + response.to_s
    # Lets not flood API calls so sleep for a small time. Confirmed with Splunk this is fine and should not be throttled.
    sleep(0.20)
  }
end

# When the program runs, this code calls your function/method and starts the operation. 
# Uncomment the function you want to run

#deleteCustomers
#deleteProducts
