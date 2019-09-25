require "rubygems"
require "watir"

# couple different ways to click a button: 
# - chain methods together
# - or make an xpath

# chain method
$browser.element(tag_name: "form", class: "login__form").button(type:"submit" ).click

# xpath method
$browser.element(:xpath => "//form[@class='login__form']//button[@type='submit']").click

# can you see the similarities between the two?

# other examples: 

# click on a button with a certain string of text on it
$browser.element(:xpath => "//button[text() = 'Sign in']").click

# you can also match if the text contains a certain substring
$browser.element(:xpath => "//button[contains(text() = 'Sign in')]").click

# it also works on different attributes too! 
$browser.element(:xpath => "//button[contains(@type, 'sub')]").click
$browser.element(:xpath => "//button[@type='submit']").click
