# auto_accept

A simple script that accepts inbound connections for you on LinkedIn, and opens the conversation with an intro message. Great way to break the ice!

# To use
You'll need to install Ruby from rubyinstaller.org if you haven't already. 

Then you'll need to install the Watir gem by typing "gem install watir"

Finally, set up your username and password in the example login.json file. Don't share that info with anyone btw :) 

Run the script from the Ruby Command Prompt (which comes as part of a Ruby install) by typing "ruby auto_accept.rb" 

# Notes
This doesn't have the logic to skip past connection requests that have a custom message. Please be sure to handle those first before using this script. 

