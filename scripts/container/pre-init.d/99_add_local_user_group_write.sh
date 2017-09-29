#!/usr/bin/env sh
if [ "$DEPLOY_ENV" == "local" ]; then
  chgrp -R "${LOCAL_USER_GROUP}" "${SYMFONY_ROOT_DIR}/app"
  chgrp -R "${LOCAL_USER_GROUP}" "${SYMFONY_ROOT_DIR}/src"
  chmod g+w -R "${SYMFONY_ROOT_DIR}/app"
  chmod g+w -R "${SYMFONY_ROOT_DIR}/src"
fi
