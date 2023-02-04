require "bundler"
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require "router"
require "controller"
require "article"
require "view"

Router.new.perform