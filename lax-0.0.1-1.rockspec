package = "lax"
version = "0.0.1-1"
source = {
  url = 'https://github.com/xpol/lax/archive/lax-0.0.1.tar.gz',
  dir = 'lax-0.0.1',
}

description = {
  summary = "An async network library for Lua based on libevent.",
  detailed = [[
    This module API is inspired by the Nodejs HTTP and Net module.
  ]],
  homepage = "https://github.com/xpol/lax",
  license = "MIT"
}

dependencies = {
  "lua >= 5.1"
}

-- cmake -Bbuild -H. -DBUILD_SHARED_LIBS=ON
-- cmake --build build --target install --config Release
build = {
  type = 'cmake',
  variables = {
    LAX_INSTALL_PREFIX = "$(PREFIX)",
    BUILD_SHARED_LIBS="ON",
  }
}
