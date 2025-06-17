--[[
 ________  ___  ___  ________   ________  ___  ___  ___     
|\   ____\|\  \|\  \|\   ___  \|\   ____\|\  \|\  \|\  \    
\ \  \___|\ \  \\\  \ \  \\ \  \ \  \___|\ \  \\\  \ \  \   
 \ \_____  \ \  \\\  \ \  \\ \  \ \_____  \ \   __  \ \  \  
  \|____|\  \ \  \\\  \ \  \\ \  \|____|\  \ \  \ \  \ \  \ 
    ____\_\  \ \_______\ \__\\ \__\____\_\  \ \__\ \__\ \__\
   |\_________\|_______|\|__| \|__|\_________\|__|\|__|\|__|
   \|_________|                   \|_________|              
                                                            
                                                            
]]--


local PLUGIN = PLUGIN

PLUGIN.name = "HelixRP Lib"
PLUGIN.author = "Sunshi"
PLUGIN.description = "."

if SERVER then




local player = FindMetaTable("Player")
local character = ix.meta.character

function character:ID()
 return self:GetData("id")
end



function IDtoCharacter(id,name)
  for client, character in ix.util.GetCharacters() do
    if character:ID() == id && character:GetName() == name then
      return character 
    end
  end
end

function character:CreateID()
    local id = tostring(math.random(10000, 99999))..tostring(self:GetID())
    local inv = self:GetInventory()
    
    self:SetData("id", tonumber(id))

    inv:Add("idcard", 1, {
        name = self:GetName(),
        id = id
    })
    print("\27[38;2;153;0;187m"..self:GetName().." id created ("..id..")".."\27[0m")
end

function PLUGIN:OnCharacterCreated(client, character)
  character:CreateID()
end

-- Dégradé magenta foncé
local colors = {
    "\27[38;2;102;0;153m",  -- Dark Magenta
    "\27[38;2;128;0;170m",
    "\27[38;2;153;0;187m",
    "\27[38;2;178;0;204m",
    "\27[38;2;204;0;221m",
    "\27[38;2;221;51;238m",
    "\27[38;2;238;102;255m" -- Lighter magenta
}
local reset = "\27[0m"
local total = #colors

for i = 1, total do
    local bar = ""

    -- Crochet gauche (magenta foncé)
    bar = bar .. colors[1] .. "["

    -- Contenu de la barre en dégradé
    for j = 1, total do
        if j <= i then
            bar = bar .. colors[j] .. "="
        else
            bar = bar .. colors[#colors] .. " "
        end
    end

    -- Crochet droit (magenta clair)
    bar = bar .. colors[#colors] .. "]"

    -- Texte latéral (teinte moyenne)
    bar = bar .. colors[4] .. " Loading HLXRPBASE by Sunshi..." .. reset

    print(bar)
end

-- Ligne de séparation sans emoji, en vert
local green = "\27[38;2;102;204;102m"
print(green .. "-----------[HLXRPBASE LOADED]-----------" .. reset)

end

if CLIENT then
-------[Fonts]-------

  surface.CreateFont("Default:30", {
    font = "Arial",
    size = 30,
    weight = 800
  })
  surface.CreateFont("Default:20", {
    font = "Arial",
    size = 20,
    weight = 800
  })  

surface.CreateFont( "CloseCaption_Normal:50", {
  font = "CloseCaption_Normal", -- On Windows/macOS, use the font-name which is shown to you by your operating system Font Viewer. On Linux, use the file name
  extended = false,
  size = 50,
  weight = 500,
  italic = false,
} )


end