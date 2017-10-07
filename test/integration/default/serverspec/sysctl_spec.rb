require 'serverspec'

# Required by serverspec
set :backend, :exec

describe "sysctl networking tunings" do

  describe command('sysctl net.core.rmem_max') do
      its(:exit_status) { should eq 0 }
  end

  describe command('sysctl net.core.wmem_max') do
      its(:exit_status) { should eq 0 }
  end

end

describe "sysctl virtual memory tunings" do

  describe command('sysctl vm.dirty_background_ratio') do
      its(:exit_status) { should eq 0 }
  end

  describe command('sysctl vm.dirty_ratio') do
      its(:exit_status) { should eq 0 }
  end

end
