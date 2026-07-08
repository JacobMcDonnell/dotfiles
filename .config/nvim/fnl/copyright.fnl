(fn copyright_comment []
  (when (not= vim.bo.commentstring "")
      (let [commentString (.. (vim.trim (: vim.bo.commentstring :gsub "%%s" "")) " ")
            copyright (os.getenv :COPYRIGHT_COMMENT)]
          (when (not= copyright nil)
              (let [targetLine (- (vim.fn.line ".") 1)
                    copyrightGood (icollect [_ line (ipairs (vim.split copyright "\n"))]
                                    (.. commentString line))]
                  (vim.api.nvim_buf_set_lines 0 targetLine targetLine false copyrightGood))))))

