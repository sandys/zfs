dnl #
dnl # Default ZFS kernel configuration 
dnl #
AC_DEFUN([ZFS_AC_CONFIG_KERNEL], [
	dnl # Kernel build make options
	dnl # KERNELMAKE_PARAMS="V=1"	# Enable verbose module build
	KERNELMAKE_PARAMS=

	KERNELCPPFLAGS="$KERNELCPPFLAGS -Wall -Wstrict-prototypes -Werror"
	KERNELCPPFLAGS="$KERNELCPPFLAGS -Wno-switch"
	KERNELCPPFLAGS="$KERNELCPPFLAGS -Wno-uninitialized -fno-strict-aliasing"

	KERNELCPPFLAGS="$KERNELCPPFLAGS -DHAVE_SPL -D_KERNEL"
	KERNELCPPFLAGS="$KERNELCPPFLAGS -DTEXT_DOMAIN=\\\"zfs-linux-kernel\\\""

	KERNELCPPFLAGS="$KERNELCPPFLAGS -I$splsrc -I$splsrc/include -I$TOPDIR"

	if test "$kernelbuild" != "$kernelsrc"; then
		KERNELMAKE_PARAMS="$KERNELMAKE_PARAMS O=$kernelbuild"
	fi

        AC_SUBST(KERNELMAKE_PARAMS)
        AC_SUBST(KERNELCPPFLAGS)

	ZFS_AC_CONFIG_KERNEL_BIO_ARGS
])