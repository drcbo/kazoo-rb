module Kazoo
  class User
    attr_reader :auth

    def initialize(auth)
      instance_variable_set :@auth, auth
      @base_uri = 'http://' + @auth.host + ":" + @auth.port + '/' + @auth.version + '/' + 'accounts/' + @auth.account_id
    end

    def all
      users_url = @base_uri  + '/users?auth_token=' + @auth.token
      Nestful.get(users_url)
    end

  end
end
