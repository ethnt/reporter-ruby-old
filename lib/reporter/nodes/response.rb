module Reporter
  class Response < Node
    def initialize(source)
      super(source)

      if @locationResponse
        @locationResponse = Reporter::LocationResponse.new(@locationResponse)
      end
    end
  end
end
