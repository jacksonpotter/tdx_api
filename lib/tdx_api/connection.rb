module TdxApi
  module Connection
    include TdxApi::Snakeify

    def POST endpoint, payload
      response = RestClient.post(
        "https://api.teamdynamix.com/TDWebApi/api#{endpoint}",
        payload,
        content_type: :json,
        accept: :json,
        Authorization: "Bearer #{@bearer_token}")
      snakeify(JSON.parse(response.body))
    end

    def GET endpoint
      response = RestClient.get(
        "https://api.teamdynamix.com/TDWebApi/api#{endpoint}",
        content_type: :json,
        accept: :json,
        Authorization: "Bearer #{@bearer_token}")
      snakeify(JSON.parse(response.body))
    end

    def DELETE
    end

    def PATCH
    end

    def underscore_key(key)
      snake_case(key.to_s).to_sym
    end

    def snake_case(camel_cased_word)
      camel_cased_word.to_s.gsub(/::/, '/')
        .gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
        .gsub(/([a-z\d])([A-Z])/,'\1_\2')
        .tr("-", "_")
        .downcase
    end

    def snakeify(value)
      case value
        when Array
          value.map { |v| snakeify(v) }
          # or `value.map(&method(:snakeify))`
        when Hash
          Hash[value.map { |k, v| [underscore_key(k), snakeify(v)] }]
        else
          value
       end
    end

  end
end
