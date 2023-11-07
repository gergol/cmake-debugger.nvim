local M = {}


function M.setup(opts)
    print('Hello from nvim-cmake-debugger setup')
    local ok, dap = pcall(require, 'dap')
    if not ok then
        print('ERROR: cmake-debugger requires nvim-dap')
        return
    end

    local cmake_build_dir = opts.cmake_build_dir
    if cmake_build_dir then
        if type(cmake_build_dir) == 'function' then
            cmake_build_dir = cmake_build_dir()
        end
        assert(type(cmake_build_dir) == 'string', 'cmake_build_dir must be a string or a function that returns a string')
    else
        cmake_build_dir = vim.g.cmake_build_dir
    end
    if not cmake_build_dir then
        cmake_build_dir = './build'
    end

    cmake_build_dir = vim.fn.expand(cmake_build_dir)
    print('cmake_build_dir: ', cmake_build_dir)


    dap.adapters.cmake = {
        type = 'pipe',
        pipe = '${pipe}',
        executable = {
            command = 'cmake',
            args = { '--debugger', '--debugger-pipe=${pipe}', cmake_build_dir }
        }
    }

    dap.configurations.cmake = {
        {
            type = "cmake",
            name = "Debug",
            request = "launch",
            program = "${file}",
        },
    }
end

return M
