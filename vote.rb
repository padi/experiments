# rubocop:disable all

# Example of automating votes in a strawpoll.me (voting site)

require 'rubygems'
require 'mechanize'
require 'nokogiri'

100.times.with_index do |n, i|
agent = Mechanize.new

page = agent.get("http://www.strawpoll.me/12840656/r")

agent.page.link_with(:text => "Vote").click
form = agent.page.forms.select { |f| f.method == 'POST' }.first
form.radiobuttons
radio = form.radiobutton_with(value: "121519383")
radio.check
radio.checked?
submitted = agent.submit(form)
# pp form
# pp page
puts i.to_s + '='*100
end
