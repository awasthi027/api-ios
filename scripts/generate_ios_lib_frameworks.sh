
echo "Remove directory if exist"

dirname='./builds'

if [ -d "$dirname" ]; then
    echo "$dirname exists and is a directory."
     echo "$dirname Removing"
    rm -rf builds
else
    echo "$dirname does not exist."
fi


scheme_name="API-iOS"

skip_install=false 
code_signing_required=false
code_sign_identity_name=""
build_library_for_distribution=true 

for ARGUMENT in "$@"
do
   KEY=$(echo $ARGUMENT | cut -f1 -d=)

   KEY_LENGTH=${#KEY}
   VALUE="${ARGUMENT:$KEY_LENGTH+1}"
   export "$KEY"="$VALUE"
done


echo "Scheme Name: $scheme_name"
echo "Skip Install: $skip_install"
echo "Build Library For Distribution: $build_library_for_distribution"
echo "Code Signing Required: $code_signing_required"
echo "Code Signing Identity Name: $code_sign_identity_name"

echo "Archiving for Apple and Intel simulator Architecture"
xcodebuild archive \
-scheme $scheme_name \
-archivePath ./builds/sim-x86_64-arm64.xcarchive \
-sdk iphonesimulator \
-arch arm64 -arch x86_64 \
 SKIP_INSTALL=$skip_install \
 BUILD_LIBRARIES_FOR_DISTRIBUTION=$build_library_for_distribution

echo "Archiving for Device Architecture which is same"
xcodebuild archive \
-scheme $scheme_name  \
-archivePath ./builds/ios-arm64.xcarchive \
-sdk iphoneos -arch arm64 \
 SKIP_INSTALL=$skip_install \
 BUILD_LIBRARIES_FOR_DISTRIBUTION=$build_library_for_distribution
 STRIP_STYLE=non-global \
 STRIP_INSTALLED_PRODUCT=YES \
 CODE_SIGN_IDENTITY="" \
 CODE_SIGNING_REQUIRED=NO \
 CODE_SIGN_ENTITLEMENTS="" \
 CODE_SIGNING_ALLOWED=NO

echo "Replaceing - with _ Because command creating framework Like this API_iOS.framework\
 Remove below schema doesn't contain -"

scheme_name="${scheme_name//-/_}"

simulator_framework_path=./builds/sim-x86_64-arm64.xcarchive/Products/Library/Frameworks/$scheme_name.framework
echo "Simulator frameworkPath: $simulator_framework_path"

device_framework_path=./builds/ios-arm64.xcarchive/Products/Library/Frameworks/$scheme_name.framework
echo "Divice frameworkPath: $device_framework_path"

xcframework_path=./builds/$scheme_name.xcframework

xcodebuild -create-xcframework \
-framework $simulator_framework_path \
-framework $device_framework_path \
-output $xcframework_path

echo "$scheme_name.xcframework has been generated at path: $xcframework_path"
