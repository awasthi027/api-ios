echo "Present directory"
pwd

echo "Give Permisson"
chmod 777 .github/workflows/scripts/permissions.sh .github/workflows/scripts/permissions.sh

echo "Install Library to show Test Result"

.github/workflows/scripts/pre_test_script.sh

echo "List available Xcode versions"

ls /Applications | grep Xcode

echo "Set up Xcode version"

sudo xcode-select -s /Applications/Xcode_15.4.app/Contents/Developer

echo "Show current version of Xcode"

xcodebuild -version

echo "erase all simulator"

xcrun simctl erase all

echo "Killing all active simulator==="

killall "Simulator" || true


#echo "List of simulators"
#
#xcrun simctl list

cd iOSUITests

echo "Present directory"
pwd

echo "Running Pod Install"

pod install

echo "Build Project"

xcodebuild clean build -workspace UITestPOC.xcworkspace -scheme UITestPOCUITests -destination 'platform=iOS Simulator,name=iPhone 15,OS=17.5'

echo "Run Tests"

xcodebuild clean test -workspace UITestPOC.xcworkspace -scheme UITestPOCUITests -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 15,OS=17.5' -resultBundlePath TestResults

echo "Show Test Result"

../.github/workflows/scripts/post_test_script.sh



