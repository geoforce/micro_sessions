module MicroSessions
  module Helpers
    module UrlHelper
      extend ActiveSupport::Concern

      # TODO missing tests, maybe cucumber would be the best
      def url_for(options = {})
        if options.is_a?(Hash) && ms_value = options.delete(:micro_sessions) && !micro_session.empty?
          options[MicroSessions::PARAM] = (ms_value == true ? micro_session.id : ms_value)
        end

        super
      end
    end

    module FormTagHelper
      extend ActiveSupport::Concern

      # TODO missing tests, maybe cucumber would be the best
      def micro_session_meta_tags
        [
          tag('meta', name: 'msid-param', content: MicroSessions::PARAM),
          tag('meta', name: 'msid-token', content: micro_session.id)
        ].join("\n").html_safe
      end

      # TODO missing tests, maybe cucumber would be the best
      def micro_session_hidden_field
        hidden_field_tag MicroSessions::PARAM, micro_session.id
      end
    end
  end
end
