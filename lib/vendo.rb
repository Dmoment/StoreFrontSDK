# frozen_string_literal: true

require_relative "vendo/version"
require 'pry'
require 'pry-nav'

module Vendo
  autoload :Client, "vendo/client"
  autoload :Object, "vendo/object"
  autoload :Account, "vendo/objects/account"
  autoload :Instance, "vendo/objects/instance"
  autoload :Order, "vendo/objects/account/order"
  autoload :Address, "vendo/objects/account/address"
  autoload :Collection, "vendo/collection"
  autoload :Resource, "vendo/resource"
  autoload :AccountResource, "vendo/resources/account_resource"
  autoload :Cart, "vendo/objects/cart"
  autoload :CartResource, "vendo/resources/cart_resource"
  class Error < StandardError; end
  # Your code goes here...
end
