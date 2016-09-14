module Hana
  class Controller
    attr_reader :request

    def initialize(env)
      @request ||= Rack::Request.new(env)
    end

    def params
      request.params
    end

    def response(body, status = 200, header = {})
      @response = Rack::Response.new(body, status, header)
    end

    def get_response
      @response
    end

    def render(*args)
      response(render_template(*args))
    end

    def render_template(view_name, locals = {})
      filename = File.join("app", "views", controller_name, "#{view_name}.html.erb")
      template = Tilt::ERBTemplate.new(filename)

      vars = {}

      instance_variables.each do |var|
        key = var.to_s.delete("@").to_sym
        vars[key] = instance_variable_get(var)
      end

      template_data = template.render(self, locals.merge(vars))
    end

    def controller_name
      self.class.to_s.gsub(/Controller$/, "").to_snake_case
    end

    def dispatch(action)
      send(action)

      if get_response
        get_response
      else
        render(action)
        get_response
      end
    end

    def self.action(action_name)
      -> (env) { new(env).dispatch(action_name) }
    end
  end
end
