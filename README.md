# MBZip

## Cocoapods test


### Open Source Code

* 1 Check cocoapods account 
`
pod trunk me
`

* 2 Need register user when no user
`
pod trunk register 邮箱地址 ‘用户名’ —description='描述信息'
`

* 3 Create resource on Github.
    
* 4 Create "Framework & Library" -> "Framework"
    
* 5 Create xcworkspace on same place as xcodeproj file of framework.

* 6 Create Demo project in child folder.

* 7 Open Workspace, drag two child projects in current workspace.

* 9 Complated Framework functions.

* 8 Open Demo project, add Group without folder, add framework functions files to group.

* 9 Release a new version on Github.

* 10 Create pod config file.
`
pod spec create 库名称 // pod spec create YCSegmentView
`

* 11 Edit ***.podspec file

```
Pod::Spec.new do |spec|

  spec.name         = "MBZip"
  spec.version      = "0.1"
  spec.summary      = "Zip For NSString."

  spec.description  = <<-DESC
  Zip For NSString and NSData.
                   DESC
  spec.homepage     = "https://github.com/MxcodeBen/MBZip/"
  spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  spec.author       = { "benyao" => "yao.h@163.com" }
  spec.platform     = :ios, "8.0"
  spec.source       = { :git => "https://github.com/MxcodeBen/MBZip.git", :tag => "#{spec.version}" }
  spec.source_files  = 'MBZip/*.{h,m}'

end
```

* 12 Check config file
`
pod lib lint 配置文件//pod lib lint YCSegmentView.podspec
`

* 13 Push to CocasPods
`
pod trunk push 配置文件//pod trunk push YCSegmentView.podspec
`


