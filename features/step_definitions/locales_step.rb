When(/^я меняю язык с английского на русский$/) do
  find('a.dropdown-toggle').click
  click_on I18n.t(:ru)
end