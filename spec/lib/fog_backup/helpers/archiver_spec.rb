require 'spec_helper'

describe FogBackup::Helpers::Archiver do

  include FogBackup::Helpers::Archiver

  context '#tar' do
    let(:target) { 'test_folder' }
    let(:target_dir) { FogBackup.root.join 'spec', 'fixtures/' }
    let(:archive_name) { FogBackup.root.join 'tmp/', 'archive.tar.gz' }

    context 'succeeded' do
      after(:each) { File.delete(archive_name) if File.exist?(archive_name) }

      it { expect { tar(target_dir, target, archive_name) }.not_to raise_error }

      it 'creates new archive' do
        tar(target_dir, target, archive_name)
        expect(File.exist?(archive_name)).to be true
      end
    end

    context 'failed' do

      it 'raises exception' do
        expect {
          tar('', '', '')
        }.to raise_error FogBackup::ArchivingError
      end
    end
  end

  context '#untar' do
    let(:target_dir) { FogBackup.root.join 'tmp/' }
    let(:archive_name) { FogBackup.root.join 'spec', 'fixtures/', 'archive.tar.gz' }

    context 'succeeded' do
      after(:each) do
        directory = File.join target_dir, 'test_folder'
        FileUtils.rm_rf(directory) if File.directory?(directory)
      end

      it { expect { untar(target_dir, archive_name) }.not_to raise_error }

      it 'creates new archive' do
        untar(target_dir, archive_name)
        files = File.join target_dir, 'test_folder'
        expect(File.exist?(files)).to be true
      end
    end

    context 'failed' do

      it 'raises exception' do
        expect {
          untar('', '')
        }.to raise_error FogBackup::ArchivingError
      end
    end
  end
end
