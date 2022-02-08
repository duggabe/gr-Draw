find_package(PkgConfig)

PKG_CHECK_MODULES(PC_GR_DRAW gnuradio-draw)

FIND_PATH(
    GR_DRAW_INCLUDE_DIRS
    NAMES gnuradio/draw/api.h
    HINTS $ENV{DRAW_DIR}/include
        ${PC_DRAW_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    GR_DRAW_LIBRARIES
    NAMES gnuradio-draw
    HINTS $ENV{DRAW_DIR}/lib
        ${PC_DRAW_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
          )

include("${CMAKE_CURRENT_LIST_DIR}/gnuradio-drawTarget.cmake")

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GR_DRAW DEFAULT_MSG GR_DRAW_LIBRARIES GR_DRAW_INCLUDE_DIRS)
MARK_AS_ADVANCED(GR_DRAW_LIBRARIES GR_DRAW_INCLUDE_DIRS)
