cmake_minimum_required (VERSION 2.8)
project (lax)

find_program(LUA_EXECUTABLE NAMES lua)

include(cmake/Modules/FindLua.cmake)
find_package(Lua REQUIRED)


include_directories(${LUA_INCLUDE_DIR} libevent/include)

if(WIN32)
  include_directories(libevent/WIN32-Code)
endif()


add_library(lax src/lax.c src/lax_http.c src/lax_net.c)

target_link_libraries(lax ${LUA_LIBRARIES})
