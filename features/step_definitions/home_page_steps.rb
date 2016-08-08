When(/^I am on the homepage$/) do
  visit "/"
end

Then(/^I should see the "([^"]*)" button$/) do |arg1|
  expect(page).to have_button(I18n.t(arg1))
end


Then(/^I should see "([^"]*)"$/) do |arg1|
  expect(page).to have_content(I18n.t(arg1))
end
