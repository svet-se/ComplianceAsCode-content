# platform = multi_platform_all
DIRS="/lib /lib64 /usr/lib /usr/lib64"
for dirPath in $DIRS; do
	find "$dirPath" -perm /022 -type f -exec chmod go-w '{}' \;
done
