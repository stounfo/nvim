local client_format = function(client_name, spinner, series_messages)
  if #series_messages == 0 then
    return nil
  end
  return {
    name = client_name,
    body = spinner,
  }
end

local format = function(client_messages)
  local function stringify(name, msg)
    return msg and string.format("%s %s", name, msg) or name
  end

  local lsp_clients = {}
  for _, client in ipairs(vim.lsp.get_active_clients()) do
    if
      client.attached_buffers[vim.api.nvim_win_get_buf(
        vim.g.statusline_winid or 0
      )]
    then
      table.insert(lsp_clients, client)
    end
  end

  if #lsp_clients > 0 then
    table.sort(lsp_clients, function(a, b)
      return a.name < b.name
    end)

    local messages_map = {}
    for _, message in ipairs(client_messages) do
      messages_map[message.name] = message.body
    end

    local builder = {}
    for _, client in ipairs(lsp_clients) do
      if
        type(client) == "table"
        and type(client.name) == "string"
        and string.len(client.name) > 0
      then
        if messages_map[client.name] then
          table.insert(
            builder,
            stringify(client.name, messages_map[client.name])
          )
        else
          table.insert(builder, stringify(client.name))
        end
      end
    end
    return "" .. " " .. table.concat(builder, ",")
  else
    return ""
  end
end

return {
  client_format = client_format,
  format = format,
}
