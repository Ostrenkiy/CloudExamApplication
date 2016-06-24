# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'


def all_pods
    pod 'Alamofire', '2.0.2'
    pod 'SwiftyJSON'
    pod 'Firebase'
    pod 'Firebase/Database' 
end


target 'Currencies' do
  use_frameworks!

  # Pods for Currencies
  all_pods
  target 'CurrenciesTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'CurrenciesUITests' do
    inherit! :search_paths
    # Pods for testing
  end
  
  target 'CurrenciesToday' do
      inherit! :search_paths
      pod 'Firebase'
      pod 'Firebase/Database' 
  end

end
