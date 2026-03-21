((. (require :nvim-treesitter.configs) :setup) {:auto_install true
                                                :ensure_installed [:c]
                                                :highlight {:additional_vim_regex_highlighting false
                                                            :enable true}
                                                :sync_install false})

