Pod::Spec.new do |s|
    s.name             = 'YHLUI'
    s.version          = '0.1.2'
    s.summary          = 'A short description of YHLUI.'
    s.description      = <<-DESC
    TODO: Add long description of the pod here.
    DESC
    
    s.homepage         = 'https://github.com/yanghl/YHLUI.git'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { '272789124@qq.com' => '272789124@qq.com' }
    s.source           = { :git => 'https://github.com/yanghl/YHLUI.git', :tag => s.version.to_s }
    s.swift_version = '5.0'
    s.ios.deployment_target = '10.0'
    s.source_files = 'YHLUI/Classes/**/{*.swift,*.h,*.m}'
    s.resource_bundles = {
        'YHLUI' => ['YHLUI/Assets/**/{*}', 'YHLUI/Classes/**/{*.storyboard,*.xib}']
    }
    s.static_framework = true
    
    s.dependency 'RxSwift'
    s.dependency 'RxCocoa', '~> 5'
    s.dependency 'SnapKit'
    s.dependency 'Kingfisher'
    s.dependency 'SwiftyUserDefaults'
    s.dependency 'Toast-Swift', '~> 5.0.0'
    s.dependency 'Moya'
    s.dependency 'MoyaMapper'
    s.dependency 'MoyaMapper/MMCache'
    s.dependency 'SwiftyJSON' , '~> 5.0' #序列化
#    s.dependency 'R.swift', '~> 5.1.0'  #加载图片
    s.dependency 'HandyJSON'
    s.dependency 'SwifterSwift'
    s.dependency 'EmptyDataSet-Swift'
    s.dependency 'SwiftyRSA'
    s.dependency 'MJRefresh'
    s.dependency 'UITableView+FDTemplateLayoutCell'
    s.dependency 'URLNavigator'
    s.dependency 'YHLCore'
end
