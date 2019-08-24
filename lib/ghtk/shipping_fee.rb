module Ghtk
  class ShippingFee

    def self.check(serializer)
      hash = Ghtk::FlexibleParams.new(serializer).hash
      Ghtk::Validations::ShippingFeeValidation.new(hash).validate!
      Ghtk::Request.get('/services/shipment/fee', hash)
    end

  end
end
