require "ISUI/ISPanel"

zSpawnItems_d = ISPanel:derive("zSpawnItems_d");
zSpawnItems_d.buttons = {} -- Create a table to hold our buttons so we can loop through them later.

function zSpawnItems_d:initialise()
	ISPanel.initialise(self); -- Initialize the panel.
	self:create() -- Call the create function - where most of the work will be done.
end

function zSpawnItems_d:new (x, y, width, height) -- Create our new panel so we can add to to a window in the ZSpawnWindow.lua file.
	local o = {};
	o = ISPanel:new(x, y, width, height);
	setmetatable(o, self);
	self.__index = self;
	return o;
end

function zSpawnItems_d:create()

	-- Create each of our buttons using the CreateItemButton function below.
    self:CreateItemButton(0, 0, "Empty");
    self:CreateItemButton(1, 0, "Empty");
    self:CreateItemButton(2, 0, "Empty");
    self:CreateItemButton(3, 0, "Empty");

    self:CreateItemButton(0, 1, "Empty");
    self:CreateItemButton(1, 1, "Empty");
    self:CreateItemButton(2, 1, "Empty");
    self:CreateItemButton(3, 1, "Empty");

    self:CreateItemButton(0, 2, "Empty");
    self:CreateItemButton(1, 2, "Empty");
    self:CreateItemButton(2, 2, "Empty");
    self:CreateItemButton(3, 2, "Empty");

    self:CreateItemButton(0, 3, "Empty");
    self:CreateItemButton(1, 3, "Empty");
    self:CreateItemButton(2, 3, "Empty");
    self:CreateItemButton(3, 3, "Empty");

    self:CreateItemButton(0, 4, "Empty");
    self:CreateItemButton(1, 4, "Empty");
    self:CreateItemButton(2, 4, "Empty");
    self:CreateItemButton(3, 4, "Empty");

    self:CreateItemButton(0, 5, "Empty");
    self:CreateItemButton(1, 5, "Empty");
    self:CreateItemButton(2, 5, "Empty");
    self:CreateItemButton(3, 5, "Empty");

    self:CreateItemButton(0, 6, "Empty");
    self:CreateItemButton(1, 6, "Empty");
    self:CreateItemButton(2, 6, "Empty");
    self:CreateItemButton(3, 6, "Empty");

    self:CreateItemButton(0, 7, "Empty");
    self:CreateItemButton(1, 7, "Empty");
    self:CreateItemButton(2, 7, "Empty");
    self:CreateItemButton(3, 7, "Empty");

    self:CreateItemButton(0, 8, "Empty");
    self:CreateItemButton(1, 8, "Empty");
    self:CreateItemButton(2, 8, "Empty");
    self:CreateItemButton(3, 8, "Empty");

    -- Loop through our buttons table to initialize our buttons and give them their parent.
    for k,v in ipairs(self.buttons) do
		v:initialise();
		self:addChild(v);
	end

	-- Credits, because, y'know, I love my fame. :~)
	streetCred = ISLabel:new(327, 361, 0, "Mod by Spyder638, Dylan1313 & ExcentriCreation", 1, 1, 1, 1, UIFont.Small);
    streetCred:initialise();
    self:addChild(streetCred);

end

---------------------------------------------------------------------------------------------------------------------------------
-- Function to create buttons in a grid layout and add to a table. :: Input = Grid x coord, Grid y coord, string of items name --
---------------------------------------------------------------------------------------------------------------------------------

function zSpawnItems_d:CreateItemButton(x, y, item)
	local new_x = 45 + (110*x); -- Generate new coordinates so I don't have to manually find the x, y location for buttons.
	local new_y = 45 + (35*y);
	butt = ISButton:new(new_x, new_y, 100, 25, item, butt, zSpawnItems_d.SpawnItem); -- Create the button
	butt.internal = item; -- Give it an internal value
	table.insert(self.buttons, butt); -- Insert button into table.
end

--------------------------------------------------------------------------
-- Function to spawn items into the players inventory :: Input = Button --
--------------------------------------------------------------------------

function zSpawnItems_d:SpawnItem(button)
	local inventory = getPlayer():getInventory(); -- Get the players inventory.
	local item = button.internal; -- Grab the name of the item.
	inventory:AddItem('Base.' .. item); --Add the item to the inventory.
end