# encoding: utf-8
require 'bundler/setup'

require 'capybara/dsl'
require 'capybara-webkit'

include Capybara::DSL
Capybara.current_driver = :webkit
Capybara.app_host = 'https://www.facebook.com'
page.visit('/humancoders')

if page.find(:css, ".fsm.fwn.fcg").text.scan(/(\d+) personnes aiment/).flatten.first.to_i == 199
  page.fill_in 'email', with: ARGV[0]
  page.fill_in 'pass', with: ARGV[1]
  page.click_on 'Connexion'
  page.click_button "J’aime"
end
