module CommonMacros
  using SymbolizeHelper

  def with_json_response
    obj = JSON.parse(last_response.body).deep_symbolize_keys

    yield obj
  end
end
