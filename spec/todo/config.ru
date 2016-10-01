APP_ROOT = __dir__

use Rack::MethodOverride

require_relative "./config/application.rb"
require_relative "./config/route.rb"

run TodoApplication.new
