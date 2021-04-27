Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '11.4'
s.name = "UserAcquisition"
s.summary = "UserAcquisition"
s.requires_arc = true

# 2
s.version = "0.3"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Alex Lebed" => "al@createx.by" }

# 5 - Replace this URL with your own GitHub page's URL (from the address bar)
s.homepage = "https://github.com/AlCreatex/UserAcquisition"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/AlCreatex/UserAcquisition.git",
             :tag => "#{s.version}" }

# 7
s.static_framework = true
s.dependency 'SwiftyStoreKit'

# 8
s.source_files = "UserAcquisition/**/*.{swift}"

# 10
s.swift_version = "5"

end