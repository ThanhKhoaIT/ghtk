module Ghtk
  class Order

    def self.create(serializer)
      Ghtk::Validations::OrderValidation.new(serializer).validate!
      Ghtk::Request.post('/services/shipment/order', serializer.attributes)
    rescue Ghtk::ForbiddenError
      raise Ghtk::CreateOrderError.new(serializer.attributes)
    end

    def self.get_detail(tracking_code)
      raise Ghtk::BadParamsError.new('Tracking code is blank!') if Ghtk.is_blank?(tracking_code)
      Ghtk::Request.get("/services/shipment/v2/#{tracking_code}")
    end

    def self.cancel(tracking_code)
      raise Ghtk::BadParamsError.new('Tracking code is blank!') if Ghtk.is_blank?(tracking_code)
      Ghtk::Request.post("/services/shipment/cancel/#{tracking_code}")
    end

  end
end
