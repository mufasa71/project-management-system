module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^I press "([^"]*)"$/ do |button|
  click_button(button)
end

Then /^I should not see "([^"]*)"$/ do |text|
  page.has_content?(text).should be_false
end

Then /^(?:|I )should see "([^"]*)"(?: within "([^"]*)")?$/ do |text, selector|
  with_scope(selector) do
    if page.respond_to? :should
      page.should have_content(text)
    else
      assert page.has_content?(text)
    end
  end
end

When /^I follow "([^"]*)"$/ do |link|
 click_link(link)
end

Then /^I should be redirected to ([\w ]+) page$/ do |path|
  current_path.should == eval("#{path.gsub(/\W+/, '_')}_path")
end
