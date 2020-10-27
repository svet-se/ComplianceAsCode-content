# platform = Java Runtime Environment
JAVA_PROPERTIES="/etc/.java/deployment/deployment.properties"

grep -q "^deployment.security.askgrantdialog.show=.*$" ${JAVA_PROPERTIES} && \
sed -i "s/deployment.security.askgrantdialog.show=.*/deployment.security.askgrantdialog.show=false/g" ${JAVA_PROPERTIES}
if ! [ $? -eq 0 ] ; then
  echo "deployment.security.askgrantdialog.show=false" >> ${JAVA_PROPERTIES}
fi
