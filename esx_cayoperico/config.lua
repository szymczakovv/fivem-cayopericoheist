-- Made by szymczakovv#1937
Config = {
	MinPoliceOnDuty = 0,
	GiveMoneyAmmount = 200000,
	Sound = { -1, "Click", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 },
	ZoneSize     = {x = 1.5, y = 1.5, z = 0.8},
	MarkerColor  = {r = 100, g = 100, b = 204},
	SellZone = { {x = 590.06, y = -3279.81, z = 5.07} },
	MuzeumSell = { {x = 1, y = 1, z = 1} },

	Items = {
		['2'] = 'diamond',
		['3'] = 'gold',
		['4'] = 'paints',
	},
	Price = {
		['1'] = 15000,
		['2'] = 30000,
		['3'] = 300000,
	},
	Amount = {
		['1'] = math.random(1, 5),
		['2'] = math.random(12, 20),
		['3'] = math.random(15, 19),
		['4'] = math.random(1, 6),
		['5'] = math.random(2, 5),
		['6'] = 1,
	},
	Label = {
	--	['1'] = 'Kolekcja Zegarków',
		['2'] = 'Diament',
		['3'] = 'Złoto',
		['4'] = 'Dzieło Sztuki',
	},
	Location = {
		["Cayo"] = {
			safe = { ['x'] = 5010.68, ['y'] = -5757.22, ['z'] = 15.48 },
			window = { ['x'] = 5006.69, ['y'] = -5756.25, ['z'] = 15.48 },
			obraz = { ['x'] = 4997.93, ['y'] = -5745.98, ['z'] = 14.84 },
			label = "Cayo Perico",
			lastrobbed = 0,
		},
	},
}