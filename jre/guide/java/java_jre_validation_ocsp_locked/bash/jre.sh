# platform = Java Runtime Environment
JAVA_PROPERTIES="/etc/.java/deployment/deployment.properties"

grep -q "^deployment.security.validation.ocsp.locked$" ${JAVA_PROPERTIES}

if ! [ $? -eq 0 ] ; then
  echo "deployment.security.validation.ocsp.locked" >> ${JAVA_PROPERTIES}
fi
