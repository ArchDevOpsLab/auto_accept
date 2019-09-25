require "rubygems"

greetings = ["Hey", "Howdy", "Hi there"]
happy = ["great to be connected", "glad to meet you", "thanks for connecting with me", "appreciate the connection"]
whatup = ["How are things going?", "Anything exciting happening?", "What's got you busy these days?"]

person = "Fritz"

message = "#{greetings.shuffle.first}, #{person}, #{happy.shuffle.first}. #{whatup.shuffle.first}"

puts message