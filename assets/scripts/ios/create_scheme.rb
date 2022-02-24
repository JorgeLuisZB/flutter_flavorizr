require 'xcodeproj'

if ARGV.length != 2
  puts 'We need exactly two arguments'
  exit
end

project_path = ARGV[0]
scheme_name = ARGV[1]

project = Xcodeproj::Project.open(project_path)
target = project.targets.first

scheme = Xcodeproj::XCScheme.new
scheme.launch_action.build_configuration = "Debug-#{scheme_name.split('_').collect(&:capitalize).join}"
scheme.set_launch_target(target)
scheme.test_action.build_configuration = "Debug-#{scheme_name.split('_').collect(&:capitalize).join}"
scheme.profile_action.build_configuration = "Release-#{scheme_name.split('_').collect(&:capitalize).join}"
scheme.analyze_action.build_configuration = "Debug-#{scheme_name.split('_').collect(&:capitalize).join}"
scheme.archive_action.build_configuration = "Release-#{scheme_name.split('_').collect(&:capitalize).join}"
scheme.save_as(project_path, scheme_name)