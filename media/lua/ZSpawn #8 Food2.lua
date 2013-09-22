require "ISUI/ISPanel"

zSpawnFood_b = ISPanel:derive("zSpawnFood_b");
zSpawnFood_b.buttons = {} -- Create a table to hold our buttons so we can loop through them later.

function zSpawnFood_b:initialise()
	ISPanel.initialise(self); -- Initialize the panel.
	self:create() -- Call the create function - where most of the work will be done.
end

function zSpawnFood_b:new (x, y, width, height) -- Create our new panel so we can add to to a window in the ZSpawnWindow.lua file.
	local o = {};
	o = ISPanel:new(x, y, width, height);
	setmetatable(o, self);
	self.__index = self;
	return o;
end

function zSpawnFood_b:create()

	-- Create each of our buttons using the CreateItemButton function below.
    self:CreateItemButton(0, 0, "BoringBowl4");
    self:CreateItemButton(1, 0, "SimpleBowl4");
    self:CreateItemButton(2, 0, "TastyBowl4");
    self:CreateItemButton(3, 0, "HeartyBowl4");

    self:CreateItemButton(0, 1, "ComplexBowl4");
    self:CreateItemButton(1, 1, "SoupBowl4");
    self:CreateItemButton(2, 1, "RamenBowl");
    self:CreateItemButton(3, 1, "Steak");

    self:CreateItemButton(0, 2, "Steak");
    self:CreateItemButton(1, 2, "Chicken");
    self:CreateItemButton(2, 2, "Salmon");
    self:CreateItemButton(3, 2, "BCCCasserole");

    self:CreateItemButton(0, 3, "CheeseSandwich");
    self:CreateItemButton(1, 3, "GrilledCheese");
    self:CreateItemButton(2, 3, "TVDinner");
    self:CreateItemButton(3, 3, "Egg");

    self:CreateItemButton(0, 4, "Apple");
    self:CreateItemButton(1, 4, "Orange");
    self:CreateItemButton(2, 4, "Banana");
    self:CreateItemButton(3, 4, "Watermelon");

    self:CreateItemButton(0, 5, "WatermelonSliced");
    self:CreateItemButton(1, 5, "WatermelonSmashed");
    self:CreateItemButton(2, 5, "Cheese");
    self:CreateItemButton(3, 5, "Chocolate");

    self:CreateItemButton(0, 6, "TinnedSoup");
    self:CreateItemButton(1, 6, "TinnedBeans");
    self:CreateItemButton(2, 6, "OpenBeans");
    self:CreateItemButton(3, 6, "BeanBowl");

    self:CreateItemButton(0, 7, "BerryPoisonIvy");
    self:CreateItemButton(1, 7, "Strawberry");
    self:CreateItemButton(2, 7, "Candycane");
    self:CreateItemButton(3, 7, "Cupcake");

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

function zSpawnFood_b:CreateItemButton(x, y, item)
	local new_x = 45 + (110*x); -- Generate new coordinates so I don't have to manually find the x, y location for buttons.
	local new_y = 45 + (35*y);
	butt = ISButton:new(new_x, new_y, 100, 25, item, butt, zSpawnFood_b.SpawnItem); -- Create the button
	butt.internal = item; -- Give it an internal value
	table.insert(self.buttons, butt); -- Insert button into table.
end

--------------------------------------------------------------------------
-- Function to spawn items into the players inventory :: Input = Button --
--------------------------------------------------------------------------

function zSpawnFood_b:SpawnItem(button)
	local inventory = getPlayer():getInventory(); -- Get the players inventory.
	local item = button.internal; -- Grab the name of the item.
	inventory:AddItem('Base.' .. item); --Add the item to the inventory.
end