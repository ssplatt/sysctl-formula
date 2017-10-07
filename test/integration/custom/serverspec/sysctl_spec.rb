require 'serverspec'

# Required by serverspec
set :backend, :exec

describe "sysctl networking tunings" do

  describe file('/etc/sysctl.d/networking.conf') do
      it { should be_file }
      it { should be_mode 600 }
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
      its(:content) { should match /net.core.rmem_max=12582912/ }
      its(:content) { should match /net.core.wmem_max=12582912/ }
  end

  describe command('sysctl net.core.rmem_max') do
      its(:stdout) { should match /net.core.rmem_max = 12582912/ }
      its(:exit_status) { should eq 0 }
  end

  describe command('sysctl net.core.wmem_max') do
      its(:stdout) { should match /net.core.wmem_max = 12582912/ }
      its(:exit_status) { should eq 0 }
  end

end

describe "sysctl virtual memory tunings" do

  describe file('/etc/sysctl.d/virtualmemory.conf') do
      it { should be_file }
      it { should be_mode 600 }
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
      its(:content) { should match /vm.dirty_background_ratio=5/ }
      its(:content) { should match /vm.dirty_ratio=60/ }
  end

  describe command('sysctl vm.dirty_background_ratio') do
      its(:stdout) { should match /vm.dirty_background_ratio = 5/ }
      its(:exit_status) { should eq 0 }
  end

  describe command('sysctl vm.dirty_ratio') do
      its(:stdout) { should match /vm.dirty_ratio = 60/ }
      its(:exit_status) { should eq 0 }
  end

end
