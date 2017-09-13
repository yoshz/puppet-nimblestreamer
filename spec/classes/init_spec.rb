require 'spec_helper'
describe 'nimblestreamer' do
  context 'with default values for all parameters' do
    it { should contain_class('nimblestreamer') }
  end
end
