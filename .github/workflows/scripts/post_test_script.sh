echo "Creating test report"

xchtmlreport TestResults.xcresult

echo "Generate Junit Reports"

xchtmlreport -j TestResults

echo "Generate JSON Reports"

xchtmlreport --json TestResults
