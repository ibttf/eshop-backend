require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Wms
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.


# BELOW IS WHAT I HAD INITIALLY

    # config.middleware.use ActionDispatch::Cookies    
    # config.middleware.use ActionDispatch::Session::CookieStore
    # config.api_only = false

# BELOW IS WHAT I JUST ADDED OFF DOCS TO TRY AND MAKE SESSIONS LOGIN WORK
  config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*'
      resource '*', headers: :any, methods: [:get, :post, :options]
    end
  end


  # config.session_store :cookie_store, key: '_interslice_session'

  # config.middleware.use ActionDispatch::Cookies
  
  # config.middleware.use config.session_store, config.session_options



    #BELOW IS WHAT I'M ADDING OFF A FORMER PROJECT TO SEE IF ANYTHING CHANGES
   config.api_only = true

   # Adding back cookies and session middleware
   config.middleware.use ActionDispatch::Cookies
   config.middleware.use ActionDispatch::Session::CookieStore

   # Use SameSite=Strict for all cookies to help protect against CSRF
   config.action_dispatch.cookies_same_site_protection = :strict
 end

  end
end
