vim.filetype.add({
  pattern = {
    [".*%.ya?ml"] = {
      priority = math.huge,
      function(_, bufnr)
        local first_line = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] or ""
        if
          vim.regex([[^AWSTemplateFormatVersion]]):match_str(first_line)
          or vim.regex([[AWS::Serverless-2016-10-31]]):match_str(first_line)
        then
          return "yaml.cloudformation"
        end
      end,
    },
    [".*%.json"] = {
      priority = math.huge,
      function(_, bufnr)
        local lines = vim.api.nvim_buf_get_lines(bufnr, 0, 2, false)
        local content = table.concat(lines, "\n")
        if
          vim.regex([[['"]AWSTemplateFormatVersion]]):match_str(content)
          or vim.regex([[AWS::Serverless-2016-10-31]]):match_str(content)
        then
          return "json.cloudformation"
        end
      end,
    },
  },
})
