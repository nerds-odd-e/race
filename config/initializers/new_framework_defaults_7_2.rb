# Be sure to restart your server when you modify this file.
#
# This file documents the Rails 7.2 framework defaults. `config.load_defaults 7.2`
# in config/application.rb already activates all of these; the settings below are
# kept commented as a reference for what changed relative to 7.1. Uncommenting a
# line with an explicit value would OVERRIDE the 7.2 default, so leave them off
# unless you intend to opt out. This file can be safely removed.
#
# Read the Guide for Upgrading Ruby on Rails for more info on each option.
# https://guides.rubyonrails.org/upgrading_ruby_on_rails.html

###
# Controls whether Active Job's `#perform_later` and similar methods automatically defer
# the job queuing to after the current Active Record transaction is committed.
#++
# Rails.application.config.active_job.enqueue_after_transaction_commit = :default

###
# Adds image/webp to the list of content types Active Storage considers as an image
# Prevents automatic conversion to a fallback PNG, and assumes clients support WebP.
#++
# Rails.application.config.active_storage.web_image_content_types = %w[image/png image/jpeg image/gif image/webp]

###
# Enable validation of migration timestamps. When set, an ActiveRecord::InvalidMigrationTimestampError
# will be raised if the timestamp prefix for a migration is more than a day ahead of the current time.
#++
# Rails.application.config.active_record.validate_migration_timestamps = true

###
# Controls whether the PostgresqlAdapter should decode dates automatically with manual queries.
#++
# Rails.application.config.active_record.postgresql_adapter_decode_dates = true

###
# Enables YJIT as of Ruby 3.3, to bring sizeable performance improvements. If you are
# deploying to a memory constrained environment you may want to set this to `false`.
#++
# Rails.application.config.yjit = true
