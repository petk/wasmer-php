dnl config.m4 for extension Wasmer

PHP_ARG_ENABLE(wasmer, whether to enable Wasmer support,
    AS_HELP_STRING(--enable-wasmer, Enable Wasmer support))

if test "$PHP_WASMER" != "no"; then
    AC_DEFINE(HAVE_WASMER, 1, [ Have Wasmer support ])

    PHP_SUBST(WASMER_SHARED_LIBADD)
    PHP_ADD_LIBRARY_WITH_PATH(wasmer, ./lib, WASMER_SHARED_LIBADD)

    WASMER_API="src/api/wasmer.c"
    WASMER_API_OBJECTS=""
    WASMER_API_TYPES=""
    WASMER_SOURCES="src/wasmer.c"
    WASMER_ALL_SOURCES="${WASMER_API} ${WASMER_API_OBJECTS} ${WASMER_API_TYPES} ${WASMER_SOURCES}"

    PHP_NEW_EXTENSION(wasmer, $WASMER_ALL_SOURCES, $ext_shared,, $WASMER_CFLAGS)
fi
