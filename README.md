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


### Framework

* 1 Add FILE_LICENSE file to current folder.

* 1 Added Headers to public. Build Phases -> Headers

* 2 Create new target in framework project. Cross-platform -> Aggregate

* 3 Add Run Script. Build Phases -> Add. For framework's all platform.
```
#!/bin/sh

UNIVERSAL_OUTPUTFOLDER=${BUILD_DIR}/${CONFIGURATION}-universal

# make sure the output directory exists
mkdir -p "${UNIVERSAL_OUTPUTFOLDER}"

# Step 1. Build Device and Simulator versions
xcodebuild -target "${PROJECT_NAME}" ONLY_ACTIVE_ARCH=NO -configuration ${CONFIGURATION} -sdk iphoneos  BUILD_DIR="${BUILD_DIR}" BUILD_ROOT="${BUILD_ROOT}" clean build
xcodebuild -target "${PROJECT_NAME}" -configuration ${CONFIGURATION} -sdk iphonesimulator ONLY_ACTIVE_ARCH=NO BUILD_DIR="${BUILD_DIR}" BUILD_ROOT="${BUILD_ROOT}" clean build

# Step 2. Copy the framework structure (from iphoneos build) to the universal folder
cp -R "${BUILD_DIR}/${CONFIGURATION}-iphoneos/${PROJECT_NAME}.framework" "${UNIVERSAL_OUTPUTFOLDER}/"

# Step 3. Copy Swift modules from iphonesimulator build (if it exists) to the copied framework directory
SIMULATOR_SWIFT_MODULES_DIR="${BUILD_DIR}/${CONFIGURATION}-iphonesimulator/${PROJECT_NAME}.framework/Modules/${PROJECT_NAME}.swiftmodule/."
if [ -d "${SIMULATOR_SWIFT_MODULES_DIR}" ]; then
cp -R "${SIMULATOR_SWIFT_MODULES_DIR}" "${UNIVERSAL_OUTPUTFOLDER}/${PROJECT_NAME}.framework/Modules/${PROJECT_NAME}.swiftmodule"
fi

# Step 4. Create universal binary file using lipo and place the combined executable in the copied framework directory
lipo -create -output "${UNIVERSAL_OUTPUTFOLDER}/${PROJECT_NAME}.framework/${PROJECT_NAME}" "${BUILD_DIR}/${CONFIGURATION}-iphonesimulator/${PROJECT_NAME}.framework/${PROJECT_NAME}" "${BUILD_DIR}/${CONFIGURATION}-iphoneos/${PROJECT_NAME}.framework/${PROJECT_NAME}"

# Step 5. Convenience step to copy the framework to the project's directory
cp -R "${UNIVERSAL_OUTPUTFOLDER}/${PROJECT_NAME}.framework" "${PROJECT_DIR}"

# Step 6. Convenience step to open the project's directory in Finder
open "${PROJECT_DIR}"

```

* 4 Run current target-> Generic iOS Device.

* 5 Check result framework's platforms.
`
lipo -info ***.framework/*** 
`
Output 'i386 x86_64 armv7 arm64'  is good.

* 6 Compress result framework file and FILE_LICENSE file to zip.

* 7 Upload zip file to your website.

* 8 Create config file.

* 9 Edit config file.
```
Pod::Spec.new do |spec|
  spec.name         = "MBZipLib"
  spec.version      = "0.3"
  spec.summary      = "Zip for NSString."
  spec.description  = <<-DESC
  Framework for zip NSString.
                   DESC
  spec.homepage     = "http://mxcode.com"
  spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  spec.author       = { "benyao" => "yao.h@163.com" }
  spec.source       = { :http => "https://****/MBZip0.1.zip" }
  spec.vendored_frameworks ='MBZip.framework'
  spec.ios.deployment_target = '8.0'
end

```

* 10 Check and Push.
