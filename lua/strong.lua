function Block (el)
  if el.t == "Para" or el.t == "Plain" then
    for k,_ in ipairs(el.content) do

      if el.content[k].t == "Str" and el.content[k].text == "Sparks,"
      and el.content[k+1].t == "Space"
      and el.content[k+2].t == "Str" and el.content[k+2].text:find("^A.") then

          local _,e = el.content[k+2].text:find("^A.")
          local rest = el.content[k+2].text:sub(e+1)  -- empty if e+1>length
          el.content[k] = pandoc.Strong { pandoc.Str("Sparks, A.") }
          el.content[k+1] = pandoc.Str(rest)
          table.remove(el.content, k+2)  -- safe? another way would be to set element k+2 to Str("")
          -- no real need to skip ipairs items here

      end

    end
  end
  return el
end
