require 'spec_helper'

describe FogBackup::Base do

  it '' do
    backup = FogBackup::Base.new
    backup.run
  end


end