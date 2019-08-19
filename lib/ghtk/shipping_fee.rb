module Ghtk
  class ShippingFee

    def self.check(serializer)
      Ghtk::Validations::ShippingFeeValidation.new(serializer).validate!
      Ghtk::Request.get('/services/shipment/fee', serializer.attributes)
    end

  end
end
