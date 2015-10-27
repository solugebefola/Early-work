require 'uri'

module Phase5
  class Params
    # use your initialize to merge params from
    # 1. query string
    # 2. post body
    # 3. route params
    #
    # You haven't done routing yet; but assume route params will be
    # passed in as a hash to `Params.new` as below:
    def initialize(req, route_params = {})
      @req = req
      @route_params = route_params
      @params = {}
      parse_www_encoded_form(req.query_string)
      parse_www_encoded_form(req.body)
    end

    def [](key)
      key = key.to_s
      @params[key]
    end

    # this will be useful if we want to `puts params` in the server log
    def to_s
      @params.to_s
    end

    class AttributeNotFoundError < ArgumentError; end;

    private
    # this should return deeply nested hash
    # argument format
    # user[address][street]=main&user[address][zip]=89436
    # should return
    # { "user" => { "address" => { "street" => "main", "zip" => "89436" } } }
    def parse_www_encoded_form(www_encoded_form)
      decoded = URI.decode_www_form(www_encoded_form)
      nested = {}
      decoded.each do |(key, value)|
        key_array = parse(key)

        nested[key_array.first] ||= {}
        previous_key = key_array.first

        key_array.drop(1).each do |real_key|
          previous_key[real_key] ||= {}
          previous_key = real_key
        end
        key_array.last 

      end
    end

    # this should return an array
    # user[address][street] should return ['user', 'address', 'street']
    def parse_key(key)
      key.gsub(/(\[|\])/, " ").split(/\s+/)
    end


  end

end
