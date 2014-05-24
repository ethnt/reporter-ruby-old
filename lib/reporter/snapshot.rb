module Reporter
  class Snapshot
    def initialize(source)
      source.each do |key, value|
        case key
        when 'audio'
          result = Reporter::Audio.new(value)
        when 'background'
          result = false

          if value == 1
            result = true
          end
        when 'connection'
          options = [:cellular, :wifi, :none]

          result = options[value]
        when 'date'
          # If it's a BigDecimal, convert to float — that is the time since
          # Jan. 1, 2001. Need to convert that to date.
        when 'draft'
          result = false

          if value == 1
            result = true
          end
        when 'firedNotification'
          result = Reporter::Notification.new(value)
        when 'location'
          result = Reporter::Location.new(value)
        when 'photoSet'
          result = []

          value['photos'].each { |photo| result << Reporter::Photo.new(photo) }
        when 'responses'
          responses = []

          value.each do |response|
            responses << Reporter::Response.new(response)
          end

          result = responses
        when 'weather'
          result = Reporter::Weather.new(value)
        when 'reportImpetus'
          options = [:tapped, :asleep, :notification, :to_asleep, :to_awake]

          result = options[value]
        else
          result = value
        end

        instance_variable_set("@#{key}".to_sym, result)
        instance_eval "def #{key}() @#{key} end"
      end
    end
  end
end
