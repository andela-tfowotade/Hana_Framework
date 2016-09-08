require "hana/version"
require "hana/controller.rb" 
require "hana/utils.rb"
require "hana/dependencies.rb"
require "hana/routing.rb"

module Hana
  class Application
    def call(env)
      if env["PATH_INFO"] == "/favicon.ico"
        return [ 500, {}, [] ]
      end
      get_rack_app(env).call(env)
    end
  end
end
