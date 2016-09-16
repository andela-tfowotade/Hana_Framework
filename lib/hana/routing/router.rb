module Hana
  module Routing
    class Router
      def draw(&block)
        instance_eval &block
      end

      [:get, :post, :put, :patch, :delete].each do |method_name|
        define_method(method_name) do |path, to:|
          path = "/#{path}" unless path[0] = "/"
          klass_and_method = controller_and_action_for(to)
          @route_data = { path: path,
                          pattern: pattern_for(path),
                          klass_and_method: klass_and_method
                        }
          endpoints[method_name] << @route_data
        end
      end

      def root(to)
        get "/", to: to
      end

      def endpoints
        @endpoints ||= Hash.new { |hash, key| hash[key] = [] }
      end

      private

      def pattern_for(path)
        placeholders = []
        path.gsub!(/(:\w+)/) do |match|
          placeholders << match[1..-1].freeze
          "(?<#{placeholders.last}>[^/?#]+)"
        end
        [/^#{path}$/, placeholders]
      end

      def controller_and_action_for(path_to)
        controller_path, action = path_to.split("#")
        controller = "#{controller_path.capitalize}Controller"
        [controller, action.to_sym]
      end
    end
  end
end
