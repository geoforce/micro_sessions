require "rails"
require "action_controller"
require "action_view"

module MicroSessions
  extend ActiveSupport::Concern
  extend ActiveSupport::Autoload

  PARAM = '_msid'
  KEY   = '_micro_sessions'

  autoload :Controller
  autoload :Helpers
  autoload :MicroSession

  included do
    include MicroSessions::Controller
  end

  class Engine < ::Rails::Engine; end
end

require "micro_sessions/railtie"
