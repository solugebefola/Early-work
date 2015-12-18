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
      @params = route_params
      parse_www_encoded_form(@req.query_string) if @req.query_string
      parse_www_encoded_form(@req.body) if @req.body
    end

    def [](key)
      @params[key.to_s] || @params[key.to_sym]
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
      decoded.each do |(key, value)|
        keys = parse_key(key)
        nested = nested_hash(keys, value, @params)
      end

    end

    # this should return an array
    # user[address][street] should return ['user', 'address', 'street']
    def parse_key(key)
      key.gsub(/(\[|\])/, " ").split(/\s+/)
    end

    def nested_hash(key_array, value, hash)
      nested = hash
      outer_nest = nested
      kal = key_array.length - 1

        key_array.take(kal).each do |key|
          outer_nest[key] ||= {}
          outer_nest = outer_nest[key]
        end
        outer_nest[key_array.last] = value

      nested
    end



  end

end
