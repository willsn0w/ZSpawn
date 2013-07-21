require "ISUI/ISPanel"

zSpawnItems_c = ISPanel:derive("zSpawnItems_c");
zSpawnItems_c.buttons = {} -- Create a table to hold our buttons so we can loop through them later.

function zSpawnItems_c:initialise()
	ISPanel.initialise(self); -- Initialize the panel.
	self:create() -- Call the create function - where most of the work will be done.
end

function zSpawnItems_c:new (x, y, width, height) -- Create our new panel so we can add to to a window in the ZSpawnWindow.lua file.
	local o = {};
	o = ISPanel:new(x, y, width, height);
	setmetatable(o, self);
	self.__index = self;
	return o;
end

function zSpawnItems_c:create()

	-- Create each of our buttons using the CreateItemButton function below.
    self:CreateItemButton(0, 0, "Sandbag");
    self:CreateItemButton(1, 0, "Paintbrush");
    self:CreateItemButton(2, 0, "PaintBlue");

    self:CreateItemButton(0, 1, "PaintBrown");
    self:CreateItemButton(1, 1, "PaintCyan");
    self:CreateItemButton(2, 1, "PaintGreen");

    self:CreateItemButton(0, 2, "PaintGrey");
    self:CreateItemButton(1, 2, "PaintLightBlue");
    self:CreateItemButton(2, 2, "PaintLightBrown");

    self:CreateItemButton(0, 3, "PaintOrange");
    self:CreateItemButton(1, 3, "PaintPink");
    self:CreateItemButton(2, 3, "PaintPurple");

    self:CreateItemButton(0, 4, "PaintTurquoise");
    self:CreateItemButton(1, 4, "PaintWhite");
    self:CreateItemButton(2, 4, "PaintYellow");

    self:CreateItemButton(0, 5, "BookCarpentry1");
    self:CreateItemButton(1, 5, "BathTowel");
    self:CreateItemButton(2, 5, "Bandaid");

    self:CreateItemButton(0, 6, "Comb");
    self:CreateItemButton(1, 6, "Dice");
    self:CreateItemButton(2, 6, "Lipstick");

    self:CreateItemButton(0, 7, "Locket");
    self:CreateItemButton(1, 7, "Bleach");
    self:CreateItemButton(2, 7, "Mirror");

    self:CreateItemButton(0, 8, "CardDeck");
    self:CreateItemButton(1, 8, "ToyBear");
    self:CreateItemButton(2, 8, "Vitamins");

    -- Loop through our buttons table to initialize our buttons and give them their parent.
    for k,v in ipairs(self.buttons) do
		v:initialise();
		self:addChild(v);
	end

	-- Credits, because, y'know, I love my fame. :~)
	streetCred = ISLabel:new(109, 361, 0, "Mod by Spyder638", 1, 1, 1, 1, UIFont.Small);
    streetCred:initialise();
    self:addChild(streetCred);

end

---------------------------------------------------------------------------------------------------------------------------------
-- Function to create buttons in a grid layout and add to a table. :: Input = Grid x coord, Grid y coord, string of items name --
---------------------------------------------------------------------------------------------------------------------------------

function zSpawnItems_c:CreateItemButton(x, y, item)
	local new_x = 55 + (110*x); -- Generate new coordinates so I don't have to manually find the x, y location for buttons.
	local new_y = 45 + (35*y);
	butt = ISButton:new(new_x, new_y, 100, 25, item, butt, zSpawnItems_c.SpawnItem); -- Create the button
	butt.internal = item; -- Give it an internal value
	table.insert(self.buttons, butt); -- Insert button into table.
end

--------------------------------------------------------------------------
-- Function to spawn items into the players inventory :: Input = Button --
--------------------------------------------------------------------------

function zSpawnItems_c:SpawnItem(button)
	local inventory = getPlayer():getInventory(); -- Get the players inventory.
	local item = button.internal; -- Grab the name of the item.
	inventory:AddItem('Base.' .. item); --Add the item to the inventory.
end