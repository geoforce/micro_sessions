module MicroSessions
  class Railtie < Rails::Railtie
    ActiveSupport.on_load(:action_controller) do
      include MicroSessions::Helpers::UrlHelper
      include MicroSessions::Controller
    end

    ActiveSupport.on_load(:action_view) do
      include MicroSessions::Helpers::UrlHelper
      include MicroSessions::Helpers::FormTagHelper
    end
  end
end

