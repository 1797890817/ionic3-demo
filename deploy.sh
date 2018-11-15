CIRCLE_SHA1=$1
GIT_COMMIT_DESC=$(git log --format=oneline -n 1 $CIRCLE_SHA1)
echo "printing git commit message"
echo $GIT_COMMIT_DESC
curl \
-F "status=2" \
-F "notify=2" \
-F "notes=NOTES:$GIT_COMMIT_DESC" \
-F "notes_type=0" \
-F "ipa=@platforms/android/app/build/outputs/apk/debug/app-debug.apk" \
-H "X-HockeyAppToken: 2161769b31f54dc3a4dc9bef41b74300" \
https://rink.hockeyapp.net/api/2/apps/1b5edbbfbdb94a3a8eba43ef6a5f8f09/app_versions/upload