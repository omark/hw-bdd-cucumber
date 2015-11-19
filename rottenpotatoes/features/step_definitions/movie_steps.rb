# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie) unless Movie.exists?(movie)
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  fail "Unimplemented"
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(',').each do |r|
    rating_selection = "ratings_#{r}"
    if uncheck == 'un'
      step "I uncheck \"#{rating_selection}\""
    else
      step "I check \"#{rating_selection}\""
    end
  end
end

Then /I should see movies with ratings: (.*)/ do |rating_list|
  rating_list.split(',').each do |r|
    step "I should see \"#{r}\""
  end
end

Then /I should not see movies with ratings: (.*)/ do |rating_list|
  rating_list.split(',').each do |r|
    step "I should not see \"#{r}\""
  end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  fail "Unimplemented"
end
