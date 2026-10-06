require('vis')

vis.events.subscribe(vis.events.INIT, function()
    vis:command("set theme base16-google-light")
    vis.options.autoindent = true
    vis.options.shell = "/usr/bin/env zsh"
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
    win.options.tabwidth = 4
    win.options.relativenumbers = true
    win.options.showspaces = true
    win.options.showtabs = true
    win.options.expandtab = true
    vis:map(vis.modes.VISUAL, " y", '"+y"')
    vis:map(vis.modes.NORMAL, " P", '"+P"')

    if win.syntax == 'makefile' or win.syntax == 'go' then
        win.options.expandtab = false
    end
end)

