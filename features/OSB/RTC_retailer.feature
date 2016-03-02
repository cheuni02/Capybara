@OSB
Feature: OSB first step
  As A VW user
  I want to be able to book a service

Scenario: Selecting a retailer
  Given I am on the OSB homepage
  When I enter a postcode 'W3 6AA'
  And press submit
  Then I should have some results