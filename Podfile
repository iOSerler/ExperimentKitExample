# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

def local_pod(name, **kwargs)
    kwargs[:path] = "./Modules/#{name}"
    pod name, kwargs
end

install! 'cocoapods', :generate_multiple_pod_projects => true
inhibit_all_warnings!
use_modular_headers!

target 'ExperimentKitTest' do
  # Comment the next line if you don't want to use dynamic frameworks
  # use_frameworks!

  # Pods for RemoteConfigTest

local_pod 'ExperimentKit'

end

