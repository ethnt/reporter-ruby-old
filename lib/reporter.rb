require 'oj'
require 'hashie'

require 'reporter/version'
require 'reporter/snapshot'
require 'reporter/response'

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
