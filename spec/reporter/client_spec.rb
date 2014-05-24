require 'spec_helper'

describe Reporter::Client do
  let(:client) { Reporter::Client.new(Dir.glob('/Users/ethan/Workspace/reporter-ruby/spec/fixtures/*.json')) }

  describe '.new' do
    it { expect(client).to be_an_instance_of Reporter::Client }
  end

  describe '#snapshots' do
    it { expect(client.snapshots.count).to eql 14 }
    it { expect(client.snapshots.first).to be_an_instance_of Reporter::Snapshot }
  end
end
