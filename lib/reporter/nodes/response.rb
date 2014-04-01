module Reporter
  class Response < Node
    def initialize(source)
      super(source)

      if @locationResponse
        @locationResponse['location'] = Reporter::Location.new(@locationResponse['location'])
      end
    end
  end
end
