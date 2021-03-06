module Hana
  class Controller
    attr_reader :request

    def initialize(request)
      @request ||= request
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

    def redirect_to(address, status: 301)
      response([], status, "Location" => address)
    end

    def layout
      File.join(
        APP_ROOT,
        "app",
        "views",
        "layout",
        "application.html.erb"
      )
    end

    def filename(view_name)
      File.join(
        APP_ROOT,
        "app",
        "views",
        controller_name,
        "#{view_name}.html.erb"
      )
    end

    def prepare_templates(view_name)
      layout_template = Tilt::ERBTemplate.new(layout)
      view_template = Tilt::ERBTemplate.new(filename(view_name))

      [layout_template, view_template]
    end

    def render_template(view_name, locals = {})
      layout_template, view_template = prepare_templates(view_name)
      title = view_name.capitalize

      layout_template.render(self, title: title) do
        view_template.render(self, locals)
      end
    end

    def controller_name
      self.class.to_s.gsub(/Controller$/, "").to_snake_case
    end

    def dispatch(action)
      send(action)
      render(action) unless get_response
      get_response
    end
  end
end
