default_platform(:ios)
podspec_name = "API-iOS.podspec" # Don’t forget to update the podspec_name to the name of your podspec file.

platform :ios do
  desc "Releases a new version automatically"
  lane :release
    pod_lib_lint
    version = version_bump_podspec(path: podspec_name)
    git_add(path: podspec_name)
    git_commit(path: [podspec_name],
               message: "#{version} release")
    add_git_tag(tag: "#{version}")
    push_to_git_remote
    pod_push
  end
end
