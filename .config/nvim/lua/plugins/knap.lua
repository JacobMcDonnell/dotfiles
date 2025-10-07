local gknapsettings = {
    texoutputext = "pdf",
    textopdf = "tectonic %docroot%",
    textopdfviewerlaunch = "sioyek %outputfile%",
    textopdfviewerrefresh = "kill -HUP %pid%"
}
vim.g.knap_settings = gknapsettings

