require 'spec_helper'

describe FogBackup::Base do

  context 'success' do
    before do
      expect_any_instance_of(FogBackup::Base).to receive(:download_from_ftp)
      expect_any_instance_of(FogBackup::Base).to receive(:tar)
      expect_any_instance_of(FogBackup::Base).to receive(:upload_to_aws)
      expect(Pony).to receive(:mail)
      expect(File).to receive(:directory?).and_return(true)
      expect(File).to receive(:directory?).and_return(false)
      expect(File).to receive(:exist?).and_return(false)
    end

    it "doesn't raise exception" do
      backup = FogBackup::Base.new
      expect { backup.run }.not_to raise_error
    end
  end

  context 'failure' do
    before do
      expect_any_instance_of(FogBackup::Base).to receive(:download_from_ftp).and_raise(StandardError)
      expect(Pony).to receive(:mail)
      expect(File).to receive(:directory?).and_return(true)
      expect(File).to receive(:directory?).and_return(false)
      expect(File).to receive(:exist?).and_return(false)
    end

    it "when exception was raised" do
      backup = FogBackup::Base.new
      expect { backup.run }.not_to raise_error
    end
  end

end