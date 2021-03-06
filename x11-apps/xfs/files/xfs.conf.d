# /etc/conf.d/xfs: config file for /etc/init.d/xfs


# Port for xfs to listen on.  Default is set to "-1", meaning
# it will only listen on unix sockets, and not tcp ports.  If
# you however want it to listen on tcp, remember to comment
# "nolisten = tcp" in /etc/X11/fs/config.

XFS_PORT="-1"


# If this is set to "yes", then the xfs rc-script will
# scan all the font directories in /etc/X11/fs/config for
# changes, and if any, will add the required files.  This
# may take a while on very old boxes, so set it to "no"
# if it takes too long for you.

SETUP_FONTDIRS="yes"
