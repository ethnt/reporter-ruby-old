module Reporter
  class Snapshot
    def initialize(raw)
      raw.each do |key, value|
        if key == 'responses'
          responses = []

          value.each do |response|
            responses << Reporter::Response.new(response)
          end

          instance_variable_set("@#{key}".to_sym, responses)
          instance_eval "def #{key}() @#{key} end"
        else
          instance_variable_set("@#{key}".to_sym, value)
          instance_eval "def #{key}() @#{key} end"
        end
      end
    end
  end
end
