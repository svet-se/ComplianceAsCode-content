# platform = Red Hat Virtualization 4,multi_platform_fedora,multi_platform_rhel
for LIBDIR in /usr/lib /usr/lib64 /lib /lib64
do
  if [ -d $LIBDIR ]
  then
    find -L $LIBDIR \! -user root -exec chown root {} \; 
  fi
done
