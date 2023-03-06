# Parent project does not export its library target, so this CML implicitly
# depends on being added from it, i.e. the testing is done only from the build
# tree and is not feasible from an install location

project(photo-albumTests LANGUAGES CXX)

# ---- Dependencies ----

find_package(Catch2 REQUIRED)
include(Catch)

# ---- Tests ----

add_executable(photo-album_test source/photo-album_test.cpp)
target_link_libraries(
    photo-album_test PRIVATE
    photo-album_lib
    Catch2::Catch2WithMain
)
target_compile_features(photo-album_test PRIVATE cxx_std_20)

catch_discover_tests(photo-album_test)

# ---- End-of-file commands ----

add_folders(Test)
