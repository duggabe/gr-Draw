# Copyright 2011,2012,2016,2018,2019 Free Software Foundation, Inc.
#
# This file was generated by gr_modtool, a tool from the GNU Radio framework
# This file is a part of gr-draw
#
# SPDX-License-Identifier: GPL-3.0-or-later
#

########################################################################
# Setup library
########################################################################
include(GrPlatform) #define LIB_SUFFIX

list(APPEND draw_sources
)

set(draw_sources "${draw_sources}" PARENT_SCOPE)
if(NOT draw_sources)
    MESSAGE(STATUS "No C++ sources... skipping lib/")
    return()
endif(NOT draw_sources)

add_library(gnuradio-draw SHARED ${draw_sources})
target_link_libraries(gnuradio-draw gnuradio::gnuradio-runtime)
target_include_directories(gnuradio-draw
    PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/../include>
    PUBLIC $<INSTALL_INTERFACE:include>
  )
set_target_properties(gnuradio-draw PROPERTIES DEFINE_SYMBOL "gnuradio_draw_EXPORTS")

if(APPLE)
    set_target_properties(gnuradio-draw PROPERTIES
        INSTALL_NAME_DIR "${CMAKE_INSTALL_PREFIX}/lib"
    )
endif(APPLE)

########################################################################
# Install built library files
########################################################################
include(GrMiscUtils)
GR_LIBRARY_FOO(gnuradio-draw)

########################################################################
# Print summary
########################################################################
message(STATUS "Using install prefix: ${CMAKE_INSTALL_PREFIX}")
message(STATUS "Building for version: ${VERSION} / ${LIBVER}")

########################################################################
# Build and register unit test
########################################################################
include(GrTest)

# If your unit tests require special include paths, add them here
#include_directories()
# List all files that contain Boost.UTF unit tests here
list(APPEND test_draw_sources
)
# Anything we need to link to for the unit tests go here
list(APPEND GR_TEST_TARGET_DEPS gnuradio-draw)

if(NOT test_draw_sources)
    MESSAGE(STATUS "No C++ unit tests... skipping")
    return()
endif(NOT test_draw_sources)

foreach(qa_file ${test_draw_sources})
    GR_ADD_CPP_TEST("draw_${qa_file}"
        ${CMAKE_CURRENT_SOURCE_DIR}/${qa_file}
    )
endforeach(qa_file)
