module Reporter
  class Location < Node
    def initialize(source)
      super(source)

      if @placemark
        @placemark = Reporter::Location::Placemark.new(@placemark)
      end
    end

    class Placemark < Node
      def initialize(source)
        super(super(source))
      end
    end
  end
end
