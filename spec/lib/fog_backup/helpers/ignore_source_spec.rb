require 'spec_helper'

describe FogBackup::Helpers::IgnoreSource do

  let(:source_files) { Dir[FogBackup.root.join 'spec', 'fixtures/**/*.*'] }
  let(:ignore_file) { 'archive.tar.gz' }
  let(:ignore_source) { FogBackup::Helpers::IgnoreSource.new([ignore_file]) }

  def check_file(file)
    if file.include?(ignore_file)
      expect(ignore_source.ignore? file).to be true
    else
      expect(ignore_source.ignore? file).to be false
    end
  end

  it 'filters by files name ' do
    source_files.each { |file| check_file file }
  end

  it 'filters by gerexp ' do
    ['archive.*.gz$'].each { |file| check_file file }
  end
end