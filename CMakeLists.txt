cmake_minimum_required(VERSION 3.14)

include(cmake/prelude.cmake)

project(
    photo-album
    VERSION 0.1.0
    DESCRIPTION "Short description"
    HOMEPAGE_URL "https://github.com/jorgemb/photo-album"
    LANGUAGES CXX
)

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# ---- Declare library ----

add_library(
    photo-album_lib OBJECT
    source/lib.cpp
)

target_include_directories(
    photo-album_lib ${warning_guard}
    PUBLIC
    "$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/source>"
)

target_compile_features(photo-album_lib PUBLIC cxx_std_20)

find_package(fmt REQUIRED)
target_link_libraries(photo-album_lib PRIVATE fmt::fmt)

# ---- Declare executable ----

add_executable(photo-album_exe source/main.cpp)
add_executable(photo-album::exe ALIAS photo-album_exe)

set_property(TARGET photo-album_exe PROPERTY OUTPUT_NAME photo-album)

target_compile_features(photo-album_exe PRIVATE cxx_std_20)

target_link_libraries(photo-album_exe PRIVATE photo-album_lib)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Developer mode ----

if(NOT photo-album_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of photo-album"
  )
endif()

include(cmake/dev-mode.cmake)
