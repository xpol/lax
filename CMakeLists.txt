cmake_minimum_required (VERSION 2.8)
project (lax)

include_directories(libevent/include)

if(WIN32)
  include_directories(libevent/WIN32-Code)
endif()


add_library(lax src/lax_http.c src/lax_net.c)

target_link_libraries(lax)
