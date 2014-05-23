require 'oj'
require 'hashie'

require 'reporter/version'
require 'reporter/snapshot'
require 'reporter/node'
require 'reporter/nodes/audio'
require 'reporter/nodes/notification'
require 'reporter/nodes/photo'
require 'reporter/nodes/response'
require 'reporter/nodes/location'
require 'reporter/nodes/location_response'
require 'reporter/nodes/weather'

module Reporter
  class Client
    attr_accessor :snapshots

    def initialize(files)
      @snapshots = []

      files.each do |file|
        file = Oj.load_file(file, mode: :strict)

        file['snapshots'].each do |snapshot|
          @snapshots << Reporter::Snapshot.new(snapshot)
        end
      end
    end
  end
end
