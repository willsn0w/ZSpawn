require "ISUI/ISPanel"

zSpawnItems = ISPanel:derive("zSpawnItems");
zSpawnItems.buttons = {} -- Create a table to hold our buttons so we can loop through them later.

function zSpawnItems:initialise()
	ISPanel.initialise(self); -- Initialize the panel.
	self:create() -- Call the create function - where most of the work will be done.
end

function zSpawnItems:new (x, y, width, height) -- Create our new panel so we can add to to a window in the ZSpawnWindow.lua file.
	local o = {};
	o = ISPanel:new(x, y, width, height);
	setmetatable(o, self);
	self.__index = self;
	return o;
end

function zSpawnItems:create()

	-- Create each of our buttons using the CreateItemButton function below.
    self:CreateItemButton(0, 0, "Kettle");
    self:CreateItemButton(1, 0, "Mugl");
    self:CreateItemButton(2, 0, "RoastingPan");

    self:CreateItemButton(0, 1, "Pot");
    self:CreateItemButton(1, 1, "Notebook");
    self:CreateItemButton(2, 1, "SheetPaper");

    self:CreateItemButton(0, 2, "PoolBall");
    self:CreateItemButton(1, 2, "Teabag");
    self:CreateItemButton(2, 2, "Doorknob");

    self:CreateItemButton(0, 3, "Hinge");
    self:CreateItemButton(1, 3, "Bowl");
    self:CreateItemButton(2, 3, "KatePic");

    self:CreateItemButton(0, 4, "WhiskeyEmpty");
    self:CreateItemButton(1, 4, "Belt");
    self:CreateItemButton(2, 4, "Sheet");

    self:CreateItemButton(0, 5, "RippedSheets");
    self:CreateItemButton(1, 5, "Pillow");
    self:CreateItemButton(2, 5, "Door");

    self:CreateItemButton(0, 6, "Socks");
    self:CreateItemButton(1, 6, "Socks2");
    self:CreateItemButton(2, 6, "TinOpener");

    self:CreateItemButton(0, 7, "WineEmpty");
    self:CreateItemButton(1, 7, "WineEmpty2");
    self:CreateItemButton(2, 7, "DishCloth");

    self:CreateItemButton(0, 8, "Nails");
    self:CreateItemButton(1, 8, "Saw");
    self:CreateItemButton(2, 8, "Log");

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

function zSpawnItems:CreateItemButton(x, y, item)
	local new_x = 55 + (110*x); -- Generate new coordinates so I don't have to manually find the x, y location for buttons.
	local new_y = 45 + (35*y);
	butt = ISButton:new(new_x, new_y, 100, 25, item, butt, zSpawnItems.SpawnItem); -- Create the button
	butt.internal = item; -- Give it an internal value
	table.insert(self.buttons, butt); -- Insert button into table.
end

--------------------------------------------------------------------------
-- Function to spawn items into the players inventory :: Input = Button --
--------------------------------------------------------------------------

function zSpawnItems:SpawnItem(button)
	local inventory = getPlayer():getInventory(); -- Get the players inventory.
	local item = button.internal; -- Grab the name of the item.
	inventory:AddItem('Base.' .. item); --Add the item to the inventory.
end