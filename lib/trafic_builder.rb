require 'watir'

# Define the number of iterations
iterations = 1000

# List of possible search queries
search_queries = [
  'the sale lover brand',
  'The Sale Lover SAPPHIRE',
  'The Sale Lover Discover Exquisite Fragrances Shop Perfumes'
]

# Loop for the specified number of times
iterations.times do |i|
  puts "Iteration #{i+1}/#{iterations}"

  # Start Chrome browser
  browser = Watir::Browser.new(:chrome)

  # Open Google and search for the website
  browser.goto('https://www.google.com')
  search_bar = browser.textarea(name: 'q')
  search_query = search_queries.sample
  search_bar.set(search_query)
  search_bar.send_keys(:enter)

  # Wait for search results to load
  sleep(rand(2..5))

  # Click on the first search result
  first_link = browser.element(css: '#search .g a')
  first_link.click

  # Wait for the page to load
  sleep(rand(2..5))

  # Switch to the first iframe
  browser.iframe(index: 0).click

  # Wait for a few seconds
  sleep(rand(2..5))

  # Scroll down to the bottom of the page
  browser.execute_script('window.scrollTo(0, document.body.scrollHeight);')

  # Wait for a few seconds
  sleep(rand(2..5))

  # Close the browser
  browser.close
end
