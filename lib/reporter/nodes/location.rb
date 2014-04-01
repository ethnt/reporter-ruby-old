module Reporter
  class Location < Node
    def initialize(source)
      super(source)

      if @placemark
        @placemark = Reporter::Location::Placemark.new(@placemark)
      end
    end

    class Placemark < Node
    end
  end
end
