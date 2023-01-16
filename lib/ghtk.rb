require "ghtk/support/hash"
require "ghtk/version"
require "ghtk/error"
require "ghtk/config"
require "ghtk/flexible_params"
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

  def self.is_blank?(object)
    case object
    when NilClass, FalseClass
      return true
    when TrueClass, Numeric, Fixnum
      return false
    when Array, Hash
      return object.empty?
    when String
      return object.empty? || !object.match(/\A[[:space:]]*\z/).nil?
    else
      return object.respond_to?(:empty?) ? !!object.empty? : !object
    end
  end

end
