module Reporter
  class LocationResponse < Node
    def initialize(source)
      super(source)

      if @location
        @location = Reporter::Location.new(@location)
      end
    end
  end
end
