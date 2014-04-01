module Reporter
  class Snapshot
    def initialize(source)
      source.each do |key, value|
        case key
        when 'audio'
          result = Reporter::Audio.new(value)
        when 'responses'
          responses = []

          value.each do |response|
            responses << Reporter::Response.new(response)
          end

          result = responses
        when 'location'
          result = Reporter::Location.new(value)
        when 'weather'
          result = Reporter::Weather.new(value)
        else
          result = value
        end

        instance_variable_set("@#{key}".to_sym, result)
        instance_eval "def #{key}() @#{key} end"
      end
    end
  end
end
