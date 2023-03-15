#!/bin/sh
set -e

echo "Activating feature 'color'"
echo "The provided favorite color is: ${FAVORITE}"


# The 'install.sh' entrypoint script is always executed as the root user.
#
# These following environment variables are passed in by the dev container CLI.
# These may be useful in instances where the context of the final 
# remoteUser or containerUser is useful.
# For more details, see https://containers.dev/implementors/features#user-env-var
echo "The effective dev container remoteUser is '$_REMOTE_USER'"
echo "The effective dev container remoteUser's home directory is '$_REMOTE_USER_HOME'"

echo "The effective dev container containerUser is '$_CONTAINER_USER'"
echo "The effective dev container containerUser's home directory is '$_CONTAINER_USER_HOME'"

echo "The PATH is: ${PATH}"
echo "The LOCAL_PATH is: ${LOCAL_PATH}"
echo "The ENV_PATH is: ${ENV_PATH}"
echo "The CONTAINER_PATH is: ${CONTAINER_PATH}"

echo "The C_LOCAL_PATH is: ${C_LOCAL_PATH}"
echo "The C_ENV_PATH is: ${C_ENV_PATH}"
echo "The C_CONTAINER_PATH is: ${C_CONTAINER_PATH}"

echo "YOUR_ENV_VAR_NAME: ${YOUR_ENV_VAR_NAME}"
echo "ANOTHER_ENV_VAR_NAME: ${ANOTHER_ENV_VAR_NAME}"


cat > /usr/local/bin/color \
<< EOF
#!/bin/sh
echo "my favorite color is ${FAVORITE}"
EOF

chmod +x /usr/local/bin/color
