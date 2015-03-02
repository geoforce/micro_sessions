module MicroSessions
  module Controller
    extend ActiveSupport::Concern

    module ClassMethods
      def micro_sessions(options = {})
        options.stringify_keys!
        options.assert_valid_keys(:param_type, :length, :counter)

        options[:param_type] ||= :hash
        options[:length]     ||= 10
        options[:counter]    ||= 1

        class_attribute :micro_session_options
        self.micro_session_options = options

        class_eval do
          before_filter :grab_micro_session_from_headers

          def micro_session
            @micro_session ||= MicroSessions::MicroSession.new(self)
          end

          helper_method :micro_session
          helper_method :micro_session_options

          private

          def grab_micro_session_from_headers
            if request.headers[header_name]
              params[MicroSessions::PARAM] = request.headers[header_name]
            end
          end

          def header_name
            "HTTP_X#{MicroSessions::PARAM.upcase}_TOKEN"
          end
        end
      end
    end
  end
end
