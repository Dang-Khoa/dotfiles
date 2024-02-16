return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        event = "BufReadPre",
        config = { 
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        }
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = opts,
        event = "BufReadPre",
        dependencies = "williamboman/mason.nvim",
    },
}
