require "hana/version"
require "hana/controller"
require "hana/utils"
require "hana/dependencies"
require "hana/routing/mapper"
require "hana/routing/route"
require "hana/routing/router"
require "hana/orm/base_model"
require "pry"

module Hana
  class Application

    def self.routes
      @@routes ||= Hana::Routing::Router.new
    end

    def call(env)
      @request = Rack::Request.new(env)
      route = mapper.map_to_route(@request)
      if route
        response = route.dispatch
        return response
      end
      [404, {}, ["Route not found"]]
    end

    def mapper
      @mapper ||= Routing::Mapper.new(@@routes.endpoints)
    end
  end
end
