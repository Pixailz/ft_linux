[ -d /usr/local/lib/pkgconfig ] \
	&& pathappend /usr/local/lib/pkgconfig PKG_CONFIG_PATH
[ -d /usr/local/bin ] \
	&& pathprepend /usr/local/bin
[ -d /usr/local/sbin -a ${EUID} -eq 0 ] \
	&& pathprepend /usr/local/sbin
[ -d /usr/local/share ] \
	&& pathprepend /usr/local/share XDG_DATA_DIRS

# Set some defaults before other applications add to these paths.
pathappend /usr/share/man  MANPATH
pathappend /usr/share/info INFOPATH
