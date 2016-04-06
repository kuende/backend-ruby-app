module ApiMacros
  def api_get path, options = {}, headers = {}
    options.merge! :format => :json
    add_headers(merge_headers(headers))
    get '/api/v1' + path, options, {}
  end

  def api_post path, options = {}, headers = {}
    add_headers(merge_headers(headers))
    post '/api/v1' + path, options.to_json, {}
  end

  def api_put path, options = {}, headers = {}
    add_headers(merge_headers(headers))
    put '/api/v1' + path, options.to_json, {}
  end

  def api_delete path, options = {}, headers = {}
    add_headers(merge_headers(headers))
    delete '/api/v1'+ path, options.to_json, {}
  end

  def api_patch path, options = {}, headers = {}
    add_headers(merge_headers(headers))
    patch '/api/v1' + path, options.to_json, {}
  end

  def merge_headers(headers = {})
    { "CONTENT_TYPE" => 'application/json' }.merge(headers)
  end

  def form_api_post path, options = {}, headers = {}
    add_headers(headers)
    post '/api/v1' + path, options
  end

  def form_api_put path, options = {}, headers = {}
    add_headers(headers)
    put '/api/v1' + path, options, {}
  end

  def form_api_patch path, options = {}, headers = {}
    add_headers(headers)
    patch '/api/v1' + path, options, {}
  end

  def form_api_delete path, options = {}, headers = {}
    add_headers(headers)
    delete '/api/v1' + path, options, {}
  end

  def add_headers(headers)
    headers.each do |h, value|
      header h, value
    end
  end
end
