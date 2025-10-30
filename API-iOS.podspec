Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '15.0'
s.name = "API-iOS"
s.summary = "This framework I have created to test automation flow, First step for automation flow to automatically publish the pod file."
s.requires_arc = true

# 2
s.version = "1.0.9"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Ashish Awasthi" => "myemail.awasthi@gmail.com" }

# 5 - Replace this URL with your own GitHub page's URL (from the address bar)
s.homepage = "https://github.com/awasthi027/api-ios"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/awasthi027/api-ios.git", 
             :tag => "#{s.version}" }

s.source_files  = "API-iOS/**/*.{h,m,c,swift}"


# 9
#s.resources = "API-iOS/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"

# 10
s.swift_version = "5.5"

end
