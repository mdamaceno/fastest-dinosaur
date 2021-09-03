# frozen_string_literal: true

if !ENV['APP_ENV']
  ENV['APP_ENV'] = 'development'
else
  valid_envs = %w[development production test]
  unless valid_envs.include?(ENV['APP_ENV'])
    puts "Environment '#{ENV['APP_ENV']}' is invalid, must be one of #{valid_env}"
    exit(1)
  end
end

require 'rubygems'
require 'bundler'

Bundler.require(:default)

if %w[development test].include? ENV['APP_ENV']
  Bundler.require(:development)
  Bundler.require(:test)
end

loader = Zeitwerk::Loader.new
loader.push_dir(File.expand_path('../lib', __dir__))
loader.setup

module Dinosaur
  class Application
    include Singleton

    ROOT_PATH = File.expand_path('../', __dir__)
    ENVIRONMENT = ENV['APP_ENV']
  end
end
