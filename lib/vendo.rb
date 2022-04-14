# frozen_string_literal: true

require_relative "vendo/version"

module Vendo
  autoload :Client, "vendo/client"
  autoload :Object, "vendo/object"
  autoload :Account, "vendo/objects/account"
  autoload :Instance, "vendo/objects/instance"
  autoload :Order, "vendo/objects/account/order"
  autoload :Address, "vendo/objects/account/address"
  autoload :Collection, "vendo/collection"
  class Error < StandardError; end
  # Your code goes here...
end
