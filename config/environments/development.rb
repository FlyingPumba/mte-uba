Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  config.assets.cache_store = :null_store  # Disables the Asset cache
  config.sass.cache = false  # Disable the SASS compiler cache
  config.serve_static_files = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  config.action_controller.action_on_unpermitted_parameters = :raise
  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true
  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = false

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = false

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
  #
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
     address: 'smtp.gmail.com',
     port: 587,
     domain: 'gmail.com',
     user_name: 'mteubaauth@gmail.com',
     password: 'MteUba2016',
     authentication: 'plain',
     enable_starttls_auto: true
  }

# Raise exception on mass assignment protection for Active Record models
  #config.active_record.mass_assignment_sanitizer = :strict

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  # UPGRADE Rails 4.0.0 removed Auto-EXPLAIN Queries
  #config.active_record.auto_explain_threshold_in_seconds = 0.5
  BetterErrors::Middleware.allow_ip! ENV['TRUSTED_IP'] if ENV['TRUSTED_IP']

  # Enable threaded mode, unless a rake task (likely Delayed Job) is running:
  #config.threadsafe! unless defined?($rails_rake_task) && $rails_rake_task

  # Raises error for missing translations
   config.action_view.raise_on_missing_translations = false
   config.reload_classes_only_on_change = false
end
