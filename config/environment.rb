# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Timesheet::Application.initialize!
Time::DATE_FORMATS[:due_time]="%I:%M %p"
