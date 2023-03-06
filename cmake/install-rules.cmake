install(
    TARGETS photo-album_exe
    RUNTIME COMPONENT photo-album_Runtime
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
