Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie) unless Movie.exists?(movie)
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  regexp = /#{e1}.*#{e2}/m
  expect(page).to have_content regexp
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(',').each do |r|
    rating_selection = "ratings_#{r}"
    if uncheck
      step "I uncheck \"#{rating_selection}\""
    else
      step "I check \"#{rating_selection}\""
    end
  end
end

Then /I expect (not )?to see movies with ratings: (.*)/ do |negate, rating_list|
  rating_list.split(',').each do |r|
    regexp = /\s#{r}\s[0-9]/
    if negate
      expect(page).to have_no_content regexp
    else
      expect(page).to have_content regexp
    end
  end
end

Then /I should see all the movies/ do
  Movie.all.each do |m|
    regexp = /\s#{m.title}\s/
    expect(page).to have_content regexp
  end
end
