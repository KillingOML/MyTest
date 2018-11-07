

Pod::Spec.new do |s|

s.name         = "ActionResponse"
s.version      = "0.0.4"
s.summary      = "Notification HUD for ios."
s.homepage     = "https://github.com/KillingOML/FPSLabel.git"

s.description  = <<-DESC
                   我是说明我是说明我是说明我是说明我是说明我是说明
                   我是说明我是说明我是说明我是说明我是说明我是说明
			                   DESC

s.license      = "MIT"
s.author       = { "KillingOML" => "908070962@qq.com" }
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/KillingOML/FPSLabel.git", :tag => "0.0.4" }
s.source_files = "ActionResponse/Class/**/*{.h,.m}"
s.prefix_header_file = 'ActionResponse/SS_PrefixHeader.pch','ViewController.h'


s.dependency 'lottie-ios'

end

