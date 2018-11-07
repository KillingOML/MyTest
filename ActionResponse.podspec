

Pod::Spec.new do |s|

s.name         = "ActionResponse"
s.version      = "0.0.1"
s.summary      = "Notification HUD for ios."
s.homepage     = "https://github.com/KillingOML/FPSLabel.git"

s.description  = <<-DESC
                   我是说明我是说明我是说明我是说明我是说明我是说明
                   我是说明我是说明我是说明我是说明我是说明我是说明
			                   DESC

s.license      = "MIT"
s.author       = { "KillingOML" => "908070962@qq.com" }
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/KillingOML/FPSLabel.git", :tag => "0.0.1" }
s.source_files = "ActionResponse/**/*{.h,.m}"
s.prefix_header_contents = '#import "PrefixHeader.pch"'
 #s.prefix_header_file = 'ActionResponse/Classes/Global/LTSpeech-prefix.pch'


  s.dependency 'lottie-ios'

end

