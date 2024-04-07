# Set up i18n variables
for i in $(locale); do
  unset ${i%=*}
done

if [[ "${TERM}" = linux ]]; then
  export LANG=${LFS_LOCALE_LANG}
else
  source /etc/locale.conf

  for i in $(locale); do
    key=${i%=*}
    if [[ -v ${key} ]]; then
      export ${key}
    fi
  done
fi
