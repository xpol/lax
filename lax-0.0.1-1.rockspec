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
build = {
  type = 'builtin',
  modules = {
    -- C module
    ['lax'] = {
      sources = {'src/lax.c'},
      incdirs = {'libevent/include'},
    },
    ['lax.http'] = {
      sources = {'src/lax_http.c'},
      incdirs = {'libevent/include'},
    },
    ['lax.net'] = {
      sources = {'src/lax_net.c'},
      incdirs = {'libevent/include'},
    },
  },
  -- Override default build options
  platforms = {
    unix = { -- for all unix system like linux, macos, bsd, cygwin...
      modules = {
        ['lax'] = {
          libraries = {'event'}
        }
      }
    },
    windows = {
      modules = {
        ['lax'] = {
          sources = {'src/lax.c'},
          incdirs = {'libevent/include', 'libevent/WIN32-Code'},
          defines = {'WIN32'},
          libraries = {'libevent/libevent'}
        },
        ['lax.http'] = {
          sources = {'src/lax_http.c'},
          incdirs = {'libevent/include', 'libevent/WIN32-Code'},
          defines = {'WIN32'},
          libraries = {'libevent/libevent'}
        },
        ['lax.net'] = {
          sources = {'src/lax_net.c'},
          incdirs = {'libevent/include', 'libevent/WIN32-Code'},
          defines = {'WIN32'},
          libraries = {'libevent/libevent'}
        },
      }
    }
  }
}
