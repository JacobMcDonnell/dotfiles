(local gknapsettings
       {:texoutputext :pdf
        :textopdf "tectonic %docroot%"
        :textopdfviewerlaunch "sioyek %outputfile%"
        :textopdfviewerrefresh "kill -HUP %pid%"})

(set vim.g.knap_settings gknapsettings)

