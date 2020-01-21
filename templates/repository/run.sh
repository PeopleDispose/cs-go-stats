category=<services|extension|infrastructure|...>
service=<solution-name>
version=<major.minor.patch>

cd ./../../automation_scripts

#<project_context> <repository>
./verify.sh $category $service

#<project_context> <project_name> <package_version> <pack_nuget> <pack_objects> <pack_docker>
./push.sh $category $service $version no yes yes

if [ "$#" -eq "1" ]; then
	#<service_name> <version>
	./deploy.sh $service $version
fi