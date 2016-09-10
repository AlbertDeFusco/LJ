cmake_minimum_required(VERSION 2.8)
PROJECT(LJ Fortran)

#######
# To build, run the following.
#  $> cmake /path/to/source/dir
#  $> make
# **This means that you build the binary
#   anywhere you wish, but the most common
#   method is just
#   $> cd /path/to/source/dir
#   $> cmake .
#   $> make
# ** I like to use a build directory
#   $> cd /path/to/source/dir
#   $> mkdir build
#   $> cmake <options-below> ../
#   $> make
#
# To enable derivatives
#  $> cmake -DDO_DERIV=yes /path/to/source/dir
#  $> make
#
# To use debug flags
#  $> cmake -DCMAKE_BUILD_TYPE=Debug /path/to/source/dir
#  $> make
#


# Debug means -O0 -g
# Release means at least -O2
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release CACHE STRING
    "Compile for Debug or Release"
    FORCE)
endif(NOT CMAKE_BUILD_TYPE)
message(STATUS "The build type is ${CMAKE_BUILD_TYPE}")



# files with a capital F are automatically run through the Preprocesor
# http://gcc.gnu.org/onlinedocs/gfortran/Preprocessing-and-conditional-compilation.html
# https://software.intel.com/sites/products/documentation/hpc/composerxe/en-us/2011Update/fortran/win/bldaps_for/common/bldaps_use_fpp.htm
# http://striky.ece.jhu.edu/~sasha/SOFTWARE/FORTRAN/007-3696-005/sgi_html/ch06.html
file (GLOB lj_source ${PROJECT_SOURCE_DIR}/*.F90)
file (APPEND lj_source ${PROJECT_SOURCE_DIR}/*.f90)


add_executable(lj ${lj_source})


# I like "make tags"
add_custom_target(tags ctags --langmap=fortran:.f90 ${PROJECT_SOURCE_DIR}
  WORKING_DIRECTORY ${PROJECT_BINARY_DIR})
