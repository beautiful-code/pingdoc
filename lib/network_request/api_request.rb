module NetworkRequest
  module ApiRequest

    def conn
      @conn ||= Faraday.new 'http://0.0.0.0:3000' do |conn|
        conn.request :json
        conn.response :json, :content_type => /\bjson$/

        conn.use :instrumentation
        conn.adapter Faraday.default_adapter
      end
    end


    def post_data(url, body)
      response = conn.post do |req|
        req.url url
        req.body= body
      end

    end


    def get_data(url, data)
      response = conn.get url, data
    end

  end
end