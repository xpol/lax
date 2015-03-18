cmake_minimum_required (VERSION 2.8)

project (lax)

find_program(LUA_EXECUTABLE NAMES lua)

include(cmake/Modules/FindLua.cmake)
find_package(Lua REQUIRED)


include_directories(${LUA_INCLUDE_DIR} libevent/include)

if(WIN32)
  include_directories(libevent/WIN32-Code)
endif()

file(GLOB lax_SRC "src/*.h" "src/*.c")

add_library(core MODULE ${lax_SRC})

target_link_libraries(core ${LUA_LIBRARIES})

install(TARGETS core DESTINATION "${LAX_INSTALL_PREFIX}/lib/lax")
