Given(/^I am on the OSB homepage$/) do
  site.osb_page.visit_page('/owners/service-booking')
end

When(/^I enter a postcode '(.*)'$/) do |arg|
  site.osb_page.enter_postcode(arg)
end

And(/^press submit$/) do
  site.osb_page.find_retailers
end

Then(/^I should have some results$/) do
  #pending
end