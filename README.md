# ShopifyRubyAPI
Ruby code to interact with Shopify API public

Files you need are:

  basicApp.rb - a simple Ruby app to call API commands, has sample delete customers and products methods in it

  .env - a place to store your store and private app variables seperate from the main file

Installation

This file is used to delete products or customers in bulk.
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
it is done.

Feel free to fork and make changes to the code to whatever your needs are!

Cheers,

Ash Fulks
Plus Technical Merchant Support
Shopify
