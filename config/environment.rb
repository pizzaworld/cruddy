# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Cruddy::Application.initialize!

ActionView::Base.default_form_builder = FormBuilder
