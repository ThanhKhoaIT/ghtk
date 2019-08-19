require "http"
require "ghtk/version"
require "ghtk/error"
require "ghtk/config"
require "ghtk/request"
require "ghtk/validations/order_validation"
require "ghtk/validations/shipping_fee_validation"
require "ghtk/order"
require "ghtk/shipping_fee"

module Ghtk

  def self.setup
    @config ||= Ghtk::Config.new
    yield @config if block_given?
    @config
  end

end
