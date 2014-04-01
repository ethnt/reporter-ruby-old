module Reporter
  class Response
    def initialize(raw)
      raw.each do |key, value|
        instance_variable_set("@#{key}".to_sym, value)
        instance_eval "def #{key}() @#{key} end"
      end
    end
  end
end
