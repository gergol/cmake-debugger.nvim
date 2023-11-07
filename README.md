# cmake-debugger.nvim

A simple neovim plugin for debugging cmake files.

## Installation

This plugin requires cmake >= 0.27 and [nvim-dap](https://github.com/mfussenegger/nvim-dap).

Installation using lazy:

```lua
{
  dir = "gergol/cmake-debugger.nvim",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  -- setup using default opts
  opts = {}
}
```

## Configuration

You can configure the cmake build dir using `opts.cmake_build_dir`. If not specified, it defaults to `./build`.

Either pass a string
```lua
opts = {
    cmake_build_dir = './whatever_build_dir'
}

```

or a function returning a string
```lua
opts = {
    cmake_build_dir = function()
      -- In my config, plugins.cmake4vim sets the vim.g.cmake_build_dir variable.
      require('plugins.cmake4vim')
      return vim.g.cmake_build_dir
    end,
}
```

## Usage

Open any `CMakeLists.txt` file and start debugging.

