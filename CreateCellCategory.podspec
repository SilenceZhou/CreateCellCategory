Pod::Spec.new do |s|
   s.name	= 'CreateCellCategory'
   s.version	= '1.0.0'
   s.summary	= 'An easy way to Create Cell Category.'
   s.homepage	= 'https://github.com/SilenceZhou/CreateCellCategory'
   s.license	= 'MIT'
   s.platform	= :ios
   s.author	= {'SilenceZhou' => '1063123603@qq.com'}
   s.ios.deployment_target = '8.0'
   s.source	= {:git => 'https://github.com/SilenceZhou/CreateCellCategory.git', :tag => s.version}
   s.source_files = '.*{h,m}'
   s.requires_arc = true
   s.frameworks	  = 'UIKit','CreateCellCategory'
end
