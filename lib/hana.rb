require "hana/version"

module Hana
  class Application
    def call(env)
      [ 200, { "Content-Type" => "text/html" }, { "Hello World" } ]
    end
  end
end
