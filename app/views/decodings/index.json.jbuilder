json.array!(@decodings) do |decoding|
  json.extract! decoding, :id, :plain, :encrypted
  json.url decoding_url(decoding, format: :json)
end
