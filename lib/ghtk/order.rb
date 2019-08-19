module Ghtk
  class Order

    def self.create(serializer)
      Ghtk::Validations::OrderValidation.new(serializer).valid!
      Ghtk::Request.post('/services/shipment/order', serializer.attributes)
    rescue Ghtk::ForbiddenError
      raise Ghtk::CreateOrderError.new(serializer.attributes)
    end

    def self.get_detail(tracking_code)
      raise Ghtk::BadParamsError.new('Tracking code is blank!') if tracking_code.blank?
      Ghtk::Request.get("/services/shipment/v2/#{tracking_code}")
    end

    def self.cancel(tracking_code)
      raise Ghtk::BadParamsError.new('Tracking code is blank!') if tracking_code.blank?
      Ghtk::Request.post("/services/shipment/cancel/#{tracking_code}")
    end

  end
end
