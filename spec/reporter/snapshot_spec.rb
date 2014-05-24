require 'spec_helper'

describe Reporter::Snapshot do
  let(:client)   { Reporter::Client.new(Dir.glob('/Users/ethan/Workspace/reporter-ruby/spec/fixtures/*.json')) }
  let(:snapshot) { client.snapshots.first }

  describe '.new' do
    it { expect(snapshot).to be_an_instance_of Reporter::Snapshot }
  end

  describe '#audio' do
    let(:audio) { snapshot.audio }

    it { expect(audio).to be_an_instance_of Reporter::Audio }
    it { expect(audio.avg).to be_an_instance_of Float }
    it { expect(audio.peak).to be_an_instance_of Float }
  end

  describe '#background' do
    let(:background) { snapshot.background }

    it { expect(background).to be_false } # Always should be false — no background reports.
  end

  describe '#battery' do
    let(:battery) { snapshot.battery }

    it { expect(battery).to be_an_instance_of Fixnum }
  end

  describe '#connection' do
    let(:connection) { snapshot.connection }

    it { expect(connection).to be_an_instance_of Symbol }
    it { expect([:cellular, :wifi, :none]).to include connection  }
  end

  describe '#date' do
    let(:date) { snapshot.date }

    it 'expect date to be_an_instance_of DateTime'
  end

  describe '#draft' do
    let(:draft) { snapshot.draft }

    it { expect(draft).to be_false }
  end

  describe '#location' do
    let(:location) { snapshot.location }

    it { expect(location).to be_an_instance_of Reporter::Location }
  end

  describe '#photoSet' do
    let(:photoSet) { snapshot.photoSet }

    it { expect(photoSet).to be_an_instance_of Array }
    it { expect(photoSet.first).to be_an_instance_of Reporter::Photo }
  end

  describe '#reportImpetus' do
    let(:reportImpetus) { snapshot.reportImpetus }

    it { expect(reportImpetus).to be_an_instance_of Symbol }
    it { expect([:tapped, :asleep, :notification, :to_asleep, :to_awake]).to include reportImpetus }
  end

  describe '#responses' do
    let(:responses) { snapshot.responses }

    it { expect(responses).to be_an_instance_of Array }
    it { expect(responses.first).to be_an_instance_of Reporter::Response }
  end

  describe '#steps' do
    let(:steps) { snapshot.steps }

    it { expect(steps).to be_an_instance_of Fixnum }
  end

  describe '#weather' do
    let(:weather) { snapshot.weather }

    it { expect(weather).to be_an_instance_of Reporter::Weather }
  end
end
