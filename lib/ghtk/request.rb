require "http"

module Ghtk
  class Request

    def self.post(endpoint, params={})
      full_endpoint = "#{Ghtk.setup.domain}#{endpoint}?ver=#{Ghtk.setup.version}"
      response = HTTP.headers(
        content_type: 'application/json',
        token: Ghtk.setup.access_token,
      ).post(full_endpoint, json: params)
      raise Ghtk::ForbiddenError.new(full_endpoint) if response.code == 403
      raise Ghtk::ServerError.new(full_endpoint) if response.code == 500
      raise Ghtk::RequestError.new(response.parse) unless response.parse['success']
      response.parse
    end

    def self.get(endpoint, params={})
      full_endpoint = "#{Ghtk.setup.domain}#{endpoint}?ver=#{Ghtk.setup.version}"
      response = HTTP.headers(
        content_type: 'aplication/json',
        token: Ghtk.setup.access_token,
      ).get(full_endpoint, params: params)
      raise Ghtk::ForbiddenError.new(full_endpoint) if response.code == 403
      raise Ghtk::ServerError.new(full_endpoint) if response.code == 500
      response.parse
    end

  end
end
