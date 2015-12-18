require 'json'
require 'webrick'

module Phase4
  class Session
    # find the cookie for this app
    # deserialize the cookie into a hash
    def initialize(req)
      @req = req
      @cookie_val = get_cookie_val(@req.cookies, '_rails_lite_app')
    end

    def [](key)
      @cookie_val[key]
    end

    def get_cookie_val(cookies, cookie_name)
      cookies.each do |cookie|
        if cookie.name == cookie_name
          return JSON.parse(cookie.value)
        end
      end
      {}
    end

    def []=(key, val)
      @cookie_val[key] = val
    end

    # serialize the hash into json and save in a cookie
    # add to the responses cookies
    def store_session(res)
      json_cookie_val = @cookie_val.to_json
      res.cookies << WEBrick::Cookie.new('_rails_lite_app', json_cookie_val)
    end

  end
end
