function user_job_setup()
	state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
	state.HybridMode:options('Normal','PDT','PetTank','BothDD')
	state.WeaponskillMode:options('Match','Normal', 'SomeAcc', 'Acc', 'FullAcc', 'Fodder')
	state.CastingMode:options('Normal')
	state.IdleMode:options('Normal', 'Refresh', 'Reraise')
	state.RestingMode:options('Normal')
	state.PhysicalDefenseMode:options('PetPDT', 'PDT', 'Reraise', 'PKiller')
	state.MagicalDefenseMode:options('PetMDT','MDT', 'MKiller')
	state.ResistDefenseMode:options('PetMEVA', 'MEVA')
	state.Weapons:options('Dolichenus','PetPDTAxe','DualWeapons','NaegDolich')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','Knockback','Suppa','DWEarrings'}

	gear.PHYKumbha1 = {name="Kumbhakarna", augments={'Pet: Attack+20 Pet: Rng.Atk.+20','Pet: "Dbl.Atk."+4 Pet: Crit.hit rate +4','Pet: TP Bonus+180',}}
	gear.PHYKumbha2 = {name="Kumbhakarna", augments={'Pet: Accuracy+18 Pet: Rng. Acc.+18','Pet: TP Bonus+160',}}
	gear.PDTMABKumbha = {name="Kumbhakarna", augments={'Pet: "Mag.Atk.Bns."+20','Pet: Phys. dmg. taken -4%','Pet: TP Bonus+200',}}
	gear.MABKumbha = {name="Kumbhakarna", augments={'Pet: "Mag.Atk.Bns."+19','Pet: TP Bonus+160',}}

	-- Set up Jug Pet cycling and keybind Ctrl+F7
	-- INPUT PREFERRED JUG PETS HERE
	state.JugMode = M{['description']='Jug Mode', 'ScissorlegXerin','BouncingBertha','BlackbeardRandy','AttentiveIbuki','DroopyDortwin','WarlikePatrick','AcuexFamiliar','SweetCaroline'}
	send_command('bind ^f7 gs c cycle JugMode')

	-- Set up Monster Correlation Modes and keybind Alt+F7
	state.CorrelationMode = M{['description']='Correlation Mode', 'Neutral', 'Favorable'}
	send_command('bind !f7 gs c cycle CorrelationMode')

	-- Set up Pet Modes for Hybrid sets and keybind 'Windows Key'+F7
	state.PetMode = M{['description']='Pet Mode','Tank','DD','Regen'}
	send_command('bind @f7 gs c cycle PetMode')

	-- Set up Reward Modes and keybind Ctrl+Backspace
	state.RewardMode = M{['description']='Reward Mode', 'Theta', 'Zeta', 'Eta'}
	send_command('bind ^backspace gs c cycle RewardMode')

	send_command('bind @f8 gs c toggle AutoReadyMode')
	send_command('bind !` gs c ready default')

	--Example of how to change default ready moves.
	--ready_moves.default.WarlikePatrick = 'Tail Blow'
	
	send_command('bind !w input /equip ring1 "Warp Ring";')
	send_command('bind !q input /equip ring1 "Dim. Ring (Holla)";')

	select_default_macro_book()
end

	-- Additional local binds
	-- CTRL  = ^
	-- ALT   = !
	-- WIN   = @

-- BST gearsets
function init_gear_sets()
	-- PRECAST SETS
	
	sets.AF {
		head={ name="Totemic Helm +3",},
		body={ name="Tot. Jackcoat +3",},
		hands={ name="Totemic Gloves +3",},
		legs={ name="Tot. Trousers +3",},
		feet={ name="Tot. Gaiters +3",},
	}
	sets.Relic {
		head={ name="Ankusa Helm +3",},
		body={ name="An. Jackcoat +3",},
		hands={ name="Ankusa Gloves +3",},
		legs={ name="Ankusa Trousers +3",},
		feet={ name="Ankusa Gaiters +3",},
	}
	sets.Empy {
		head={ name="Nuk. Cabasset +2",},
		body={ name="Nukumi Gausape +2",},
		hands={ name="Nukumi Manoplas +2",},
		legs={ name="Nukumi Quijotes +2",},
		feet={ name="Nukumi Ocreae +2",},
	}	

	sets.precast.JA['Killer Instinct'] = {
		head={ name="Ankusa Helm +3",},
	}
	sets.precast.JA['Bestial Loyalty'] = {
		body={ name="Mirke Wardecors",},
		hands={ name="Ankusa Gloves +3",},
	}
	sets.precast.JA['Call Beast'] = sets.precast.JA['Bestial Loyalty']
	sets.precast.JA.Familiar = {
		legs={ name="Ankusa Trousers +3",},
	}
	sets.precast.JA.Tame = {
		head={ name="Totemic Helm +3",},
	}
	sets.precast.JA.Spur = {
		back={ name="Artio's Mantle",},
		feet={ name="Nukumi Ocreae +2",},
	}
	sets.SpurAxe = {
		main={ name="Skullrender",},
	}
	sets.SpurAxesDW = {
		main={ name="Skullrender",},
		sub={ name="Skullrender",},
	}

	sets.precast.JA['Feral Howl'] = {}

	sets.precast.JA.Reward = {
		neck={ name="Phalaina Locket",},
		ear1={ name="Etiolation Earring",},
		ear2={ name="Domesticator's Earring",},
		head={ name="Stout Bonnet",},
		body={ name="Tot. Jackcoat +3",},
		hands={ name="Regimen Mittens",},
		ring1={ name="Stikini Ring +1",},
		ring2={ name="Stikini Ring +1",},
		back={ name="Pastoralist's Mantle",},
		waist={ name="Klouskap Sash",},
		legs={ name="Ankusa Trousers +3",},
		feet={ name="Ankusa Gaiters +3",},
	}

	sets.precast.JA.Reward.Theta = set_combine(sets.precast.JA.Reward, {
		ammo={ name="Pet Food Theta",},
	} )
	sets.precast.JA.Reward.Zeta = set_combine(sets.precast.JA.Reward, {
		ammo={ name="Pet Food Zeta",},
	} )
	sets.precast.JA.Reward.Eta = set_combine(sets.precast.JA.Reward, {
		ammo={ name="Pet Food Eta",},
	} )
	
	sets.RewardAxe = {}
	sets.RewardAxesDW = {}

	sets.precast.JA.Charm = {}

	-- CURING WALTZ
	sets.precast.Waltz = {
		head=gear.valorous_pet_head,
		neck={ name="Loricate Torque +1",},
		ear1={ name="Enmerkar Earring",},
		ear2={ name="Handler's Earring +1",},
		body={ name="Tot. Jackcoat +3",},
		hands={ name="Regimen Mittens",},
		ring1={ name="Valseur's Ring",},
		ring2={ name="Asklepian Ring",},
		back={ name="Moonlight Cape",},
		waist={ name="Chaac Belt",},
		legs={ name="Dashing Subligar",},
		feet={ name="Valorous Greaves",},
	}

		-- HEALING WALTZ
	sets.precast.Waltz['Healing Waltz'] = {}

		-- STEPS
	sets.precast.Step = {
		ammo={ name="Voluspa Tathlum",},
		head={ name="Gavialis Helm",},
		neck={ name="Combatant's Torque",},
		ear1={ name="Mache Earring +1",},
		ear2={ name="Heartseeker Earring",},
		body={ name="Malignance Tabard",},
		hands={ name="Leyline Gloves",},
		ring1={ name="Ramuh Ring +1",},
		ring2={ name="Ramuh Ring +1",},
		back={ name="Ground. Mantle +1",},
		waist={ name="Olseni Belt",},
		legs={ name="Flamma Dirs +2",},
		feet={ name="Valorous Greaves",},
	}

		-- VIOLENT FLOURISH
	sets.precast.Flourish1 = {}
	sets.precast.Flourish1['Violent Flourish'] = {
		ammo={ name="Voluspa Tathlum",},
		head={ name="Gavialis Helm",},
		neck={ name="Combatant's Torque",},
		ear1={ name="Gwati Earring",},
		ear2={ name="Digni. Earring",},
		body={ name="Malignance Tabard",},
		hands={ name="Leyline Gloves",},
		ring1={ name="Ramuh Ring +1",},
		ring2={ name="Ramuh Ring +1",},
		back={ name="Ground. Mantle +1",},
		waist={ name="Olseni Belt",},
		legs={ name="Flamma Dirs +2",},
		feet={ name="Valorous Greaves",},
	}

	sets.precast.FC = {
		ammo={ name="Impatiens",},
		neck={ name="Voltsurge Torque",},
		ear1={ name="Enchntr. Earring +1",},
		ear2={ name="Loquac. Earring",},
		body={ name="Jumalik Mail",},
		hands={ name="Leyline Gloves",},
		ring1={ name="Kishar Ring",},
		ring2={ name="Prolix Ring",},
	}
		sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
			neck={ name="Magoraga Beads",},
	} )

		-- MIDCAST SETS
	sets.midcast.FastRecast = {
		head={ name="Gavialis Helm",},
		neck={ name="Voltsurge Torque",},
		ear1={ name="Enchntr. Earring +1",},
		ear2={ name="Loquac. Earring",},
		body={ name="Taeon Tabard",},
		hands={ name="Leyline Gloves",},
		ring1={ name="Defending Ring",},
		ring2={ name="Prolix Ring",},
		back={ name="Moonlight Cape",},
		waist={ name="Klouskap Sash",},
		legs={ name="Tali'ah Sera. +2",},
		feet={ name="Tot. Gaiters +3",},
	}

	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {
		back={ name="Mujin Mantle",},
	} )

	sets.midcast.Cure = {
		head={ name="Gavialis Helm",},
		neck={ name="Phalaina Locket",},
		ear1={ name="Enmerkar Earring",},
		ear2={ name="Handler's Earring +1",},
		body={ name="Jumalik Mail",},
		hands={ name="Macabre Gaunt. +1",},
		ring1={ name="Lebeche Ring",},
		ring2={ name="Janniston Ring",},
		back={ name="Pastoralist's Mantle",},
		waist={ name="Klouskap Sash",},
		legs={ name="Tali'ah Sera. +2",},
		feet={ name="Tot. Gaiters +3",},
	}

	sets.midcast.Curaga = sets.midcast.Cure

	sets.Self_Healing = {
		neck={ name="Phalaina Locket",},
		hands={ name="Buremte Gloves",},
		ring2={ name="Kunaji Ring",},
		waist={ name="Gishdubar Sash",},
	}
	sets.Cure_Received = {
		neck={ name="Phalaina Locket",},
		hands={ name="Buremte Gloves",},
		ring2={ name="Kunaji Ring",},
		waist={ name="Gishdubar Sash",},
	}
	sets.Self_Refresh = {
		waist={ name="Gishdubar Sash",},
	}

	sets.midcast.Stoneskin = sets.midcast.FastRecast

	sets.midcast.Cursna = set_combine(sets.midcast.FastRecast, {
		neck={ name="Debilis Medallion",},
		ring1={ name="Haoma's Ring",},
		ring2={ name="Menelaus's Ring",},
	} )

	sets.midcast.Protect = set_combine(sets.midcast.FastRecast, {
		ring2={ name="Sheltered Ring",},
	} )
	sets.midcast.Protectra = sets.midcast.Protect

	sets.midcast.Shell = set_combine(sets.midcast.FastRecast, {
		ring2={ name="Sheltered Ring",},
	} )
	sets.midcast.Shellra = sets.midcast.Shell

	sets.midcast['Enfeebling Magic'] = sets.midcast.FastRecast

	sets.midcast['Elemental Magic'] = sets.midcast.FastRecast

	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic']

		-- WEAPONSKILLS
		-- Default weaponskill sets.
	sets.precast.WS = {
		ammo={ name="Voluspa Tathlum",},
		head={ name="Meghanada Visor +2",},
		neck={ name="Combatant's Torque",},
		ear1={ name="Brutal Earring",},
		ear2={ name="Sherida Earring",},
		body={ name="Meg. Cuirie +2",},
		hands={ name="Meg. Gloves +2",},
		ring1={ name="Regal Ring",},
		ring2={ name="Ilabrat Ring",},
		back={ name="Bleating Mantle",},
		waist={ name="Fotia Belt",},
		legs={ name="Meg. Chausses +2",},
		feet={ name="Meg. Jam. +2",},
	}

	sets.precast.WS.SomeAcc = {
		ammo={ name="Voluspa Tathlum",},
		head={ name="Meghanada Visor +2",},
		neck={ name="Combatant's Torque",},
		ear1={ name="Brutal Earring",},
		ear2={ name="Sherida Earring",},
		body={ name="Meg. Cuirie +2",},
		hands={ name="Meg. Gloves +2",},
		ring1={ name="Regal Ring",},
		ring2={ name="Ilabrat Ring",},
		back={ name="Bleating Mantle",},
		waist={ name="Fotia Belt",},
		legs={ name="Meg. Chausses +2",},
		feet={ name="Meg. Jam. +2",},
	}

	sets.precast.WS.Acc = {
		ammo={ name="Voluspa Tathlum",},
		head={ name="Meghanada Visor +2",},
		neck={ name="Combatant's Torque",},
		ear1={ name="Brutal Earring",},
		ear2={ name="Sherida Earring",},
		body={ name="Meg. Cuirie +2",},
		hands={ name="Meg. Gloves +2",},
		ring1={ name="Regal Ring",},
		ring2={ name="Ilabrat Ring",},
		back={ name="Bleating Mantle",},
		waist={ name="Fotia Belt",},
		legs={ name="Meg. Chausses +2",},
		feet={ name="Meg. Jam. +2",},
	}

	sets.precast.WS.FullAcc = {
		ammo={ name="Voluspa Tathlum",},
		head={ name="Meghanada Visor +2",},
		neck={ name="Combatant's Torque",},
		ear1={ name="Brutal Earring",},
		ear2={ name="Sherida Earring",},
		body={ name="Meg. Cuirie +2",},
		hands={ name="Meg. Gloves +2",},
		ring1={ name="Regal Ring",},
		ring2={ name="Ilabrat Ring",},
		back={ name="Bleating Mantle",},
		waist={ name="Fotia Belt",},
		legs={ name="Meg. Chausses +2",},
		feet={ name="Meg. Jam. +2",},
	}

	sets.precast.WS.Fodder = {
		ammo={ name="Voluspa Tathlum",},
		head={ name="Meghanada Visor +2",},
		neck={ name="Combatant's Torque",},
		ear1={ name="Brutal Earring",},
		ear2={ name="Sherida Earring",},
		body={ name="Meg. Cuirie +2",},
		hands={ name="Meg. Gloves +2",},
		ring1={ name="Regal Ring",},
		ring2={ name="Ilabrat Ring",},
		back={ name="Bleating Mantle",},
		waist={ name="Fotia Belt",},
		legs={ name="Meg. Chausses +2",},
		feet={ name="Meg. Jam. +2",},
	}

	-- Specific weaponskill sets.
	sets.precast.WS['Ruinator'] = set_combine(sets.precast.WS, {} )
	sets.precast.WS['Ruinator'].Mekira = set_combine(sets.precast.WS['Ruinator'], {
		head={ name="Gavialis Helm",},
	} )
	sets.precast.WS['Ruinator'].WSMidAcc = set_combine(sets.precast.WS.WSMidAcc, {} )
	sets.precast.WS['Ruinator'].WSHighAcc = set_combine(sets.precast.WS.WSHighAcc, {} )

	sets.precast.WS['Onslaught'] = set_combine(sets.precast.WS, {} )
	sets.precast.WS['Onslaught'].WSMidAcc = set_combine(sets.precast.WSMidAcc, {} )
	sets.precast.WS['Onslaught'].WSHighAcc = set_combine(sets.precast.WSHighAcc, {} )
	
	sets.precast.WS['Decimation'] = {
		ammo={ name="Coiste Bodhar",},
		head={ name="Gleti's Mask",},
		body={ name="Gleti's Cuirass",},
		hands={ name="Gleti's Gauntlets",},
		legs={ name="Gleti's Breeches",},
		feet={ name="Nukumi Ocreae +2",},
		neck={ name="Bst. collar +1",},
		waist={ name="Fotia Belt",},
		ring1={ name="Gere Ring",},
		ring2={ name="Sroda Ring",},
		ear1={ name="Sroda Earring",},
		ear2={ name="Sherida Earring",},
		back={ name="Sacro Mantle",},
	}
	sets.precast.WS['Decimation'].WSMidAcc = set_combine(sets.precast.WSMidAcc, {} 
	)
	sets.precast.WS['Decimation'].WSHighAcc = set_combine(sets.precast.WSHighAcc, {} 
	)

	sets.precast.WS['Primal Rend'] = {
		ammo={ name="Dosis Tathlum",},
		head={ name="Jumalik Helm",},
		neck={ name="Baetyl Pendant",},
		ear1={ name="Crematio Earring",},
		ear2={ name="Friomisi Earring",},
		body={ name="Jumalik Mail",},
		hands={ name="Leyline Gloves",},
		ring1={ name="Shiva Ring +1",},
		ring2={ name="Shiva Ring +1",},
		back={ name="Toro Cape",},
		waist={ name="Fotia Belt",},
		legs={ name="Tali'ah Sera. +2",},
		feet={ name="Tot. Gaiters +3",},
	}

	sets.precast.WS['Cloudsplitter'] = set_combine(sets.precast.WS['Primal Rend'], {} )

		-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {
		ear1={ name="Brutal Earring",},
		ear2={ name="Sherida Earring",},
	}
	sets.AccMaxTP = {
		ear1={ name="Mache Earring +1",},
		ear2={ name="Telos Earring",},
	}

				-- PET SIC & READY MOVES
	sets.midcast.Pet.WS = {
		main=gear.PHYKumbha1,
		sub=gear.PHYKumbha2,
		ammo={ name="Voluspa Tathlum",},
		head={ name="Totemic Helm +3",},
		neck={ name="Shulmanu Collar",},
		ear1={ name="Enmerkar Earring",},
		ear2={ name="Domesticator's Earring",},
		body={ name="Taeon Tabard",},
		hands={ name="Nukumi Manoplas +2",},
		ring1={ name="Varar Ring +1",},
		ring2={ name="C. Palug Ring",},
		back={ name="Artio's Mantle",},
		waist={ name="Incarnation Sash",},
		legs=gear.valorous_physical_pet_legs,
		feet={ name="Totemic Gaiters +3",},
	}

	sets.midcast.Pet.SomeAcc = set_combine(sets.midcast.Pet.WS, {
		main={ name="Kerehcatl",},
		sub=gear.PHYKumbha2,
		hands={ name="Regimen Mittens",},
	} )
	sets.midcast.Pet.Acc = set_combine(sets.midcast.Pet.WS, {
		main={ name="Kerehcatl",},
		sub={ name="Hunahpu",},
		head={ name="Totemic Helm +3",},
		hands={ name="Regimen Mittens",},
	} )
	sets.midcast.Pet.FullAcc = set_combine(sets.midcast.Pet.WS, {
		main={ name="Kerehcatl",},
		sub={ name="Hunahpu",},
		head={ name="Totemic Helm +3",},
		hands={ name="Regimen Mittens",},
	} )
				
	sets.midcast.Pet.MagicReady = {
		main=gear.MABKumbha,
		sub=gear.PDTMABKumbha,
		ammo={ name="Voluspa Tathlum",},
		head=gear.valorous_pet_head,
		neck={ name="Adad Amulet",},
		ear1={ name="Enmerkar Earring",},
		ear2={ name="Domesticator's Earring",},
		body=gear.valorous_pet_body,
		hands={ name="Nukumi Manoplas +2",},
		ring1={ name="Varar Ring +1",},
		ring2={ name="Varar Ring +1",},
		back={ name="Artio's Mantle",},
		waist={ name="Incarnation Sash",},
		legs=gear.valorous_magical_pet_legs,
		feet=gear.valorous_magical_pet_feet
	}
		
	sets.midcast.Pet.DebuffReady = {
		main=gear.MABKumbha,
		sub=gear.PDTMABKumbha,
		ammo={ name="Voluspa Tathlum",},
		head=gear.valorous_pet_head,
		neck={ name="Adad Amulet",},
		ear1={ name="Enmerkar Earring",},
		ear2={ name="Domesticator's Earring",},
		body=gear.valorous_pet_body,
		hands={ name="Nukumi Manoplas +2",},
		ring1={ name="Varar Ring +1",},
		ring2={ name="Varar Ring +1",},
		back={ name="Artio's Mantle",},
		waist={ name="Incarnation Sash",},
		legs=gear.valorous_magical_pet_legs,
		feet=gear.valorous_magical_pet_feet
	}

	sets.midcast.Pet.ReadyRecast = {
		legs={ name="Desultor Tassets",},
	}
	sets.midcast.Pet.ReadyRecastDW = {
		sub={ name="Charmer's Merlin",},
		legs={ name="Desultor Tassets",},
	}
	sets.midcast.Pet.Neutral = {
		head={ name="Totemic Helm +3",},
	}
	sets.midcast.Pet.Favorable = {
		head={ name="Nukumi Cabasset +2",},
	}
	sets.midcast.Pet.TPBonus = {
		hands={ name="Nukumi Manoplas +2",},
	}

	-- RESTING
	sets.resting = {}

	sets.idle = {
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Gleti's Mask",},
		neck={ name="Warder's Charm +1",},
		body={ name="Gleti's Cuirass",},
		hands={ name="Gleti's Gauntlets",},
		waist={ name="Flume Belt +1",},
		legs={ name="Gleti's Breeches",},
		feet={ name="Gleti's Boots",},
		ring1={ name="Murky Ring",},
		ring2={ name="Shneddick Ring",},
		ear1={ name="Eabani Earring",},
		ear2={ name="Sherida Earring",},
		back={ name="Null Shawl",},
	}

	sets.idle.Refresh = {
		main={ name="Izizoeksi",},
		sub=gear.PDTMABKumbha,
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Jumalik Helm",},
		neck={ name="Loricate Torque +1",},
		hands={ name="Macabre Gaunt. +1",},
		body={ name="Jumalik Mail",},
		back={ name="Solemnity Cape",},
		waist={ name="Flume Belt +1",},
		legs={ name="Gleti's Breeches",},
		feet={ name="Gleti's Boots",},
		ring1={ name="Murky Ring",},
		ring2={ name="Shneddick Ring",},
		ear1={ name="Sanare Earring",},
		ear2={ name="Genmei Earring",},
	}
		
	sets.idle.Reraise = set_combine(sets.idle, {
		head={ name="Twilight Helm",},
		body={ name="Twilight Mail",},
	} )

	sets.idle.Pet = {
		ammo={ name="Coiste Bodhar",},
		head={ name="Gleti's Mask",},
		body=gear.valorous_pet_regen_body,
		hands={ name="Gleti's Gauntlets",},
		legs=gear.valorous_pet_regen_legs,
		feet={ name="Gleti's Boots",},
		neck={ name="Warder's Charm +1",},
		waist={ name="Isa Belt",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Petrov Ring",},
		ear1={ name="Eabani Earring",},
		ear2={ name="Sherida Earring",},
		back={ name="Artio's Mantle",},
	}

	sets.idle.Pet.Engaged = {
		ammo={ name="Coiste Bodhar",},
		head={ name="Gleti's Mask",},
		neck={ name="Shulmanu Collar",},
		body={ name="Gleti's Cuirass",},
		hands={ name="Gleti's Gauntlets",},
		waist={ name="Sailfi Belt +1",},
		legs={ name="Gleti's Breeches",},
		feet={ name="Gleti's Boots",},
		waist={ name="Sailfi Belt +1",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Petrov Ring",},
		ear1={ name="Eabani Earring",},
		ear2={ name="Sherida Earring",},
		back={ name="Null Mantle",},
	}

	sets.idle.Pet.Engaged.DW = {
		ammo={ name="Coiste Bodhar",},
		head={ name="Gleti's Mask",},
		neck={ name="Shulmanu Collar",},
		ear1={ name="Eabani Earring",},
		ear2={ name="Sherida Earring",},
		body={ name="Gleti's Cuirass",},
		hands={ name="Gleti's Gauntlets",},
		back={ name="Artio's Mantle",},
		waist={ name="Reiki Yotai",},
		legs={ name="Tali'ah Sera. +2",},
		feet={ name="Gleti's Boots",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Petrov Ring",},
		legs={ name="Gleti's Breeches",},
	}

	-- DEFENSE SETS
	sets.defense.PDT = {
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Genmei Kabuto",},
		neck={ name="Loricate Torque +1",},
		ear1={ name="Sanare Earring",},
		ear2={ name="Handler's Earring +1",},
		body={ name="Jumalik Mail",},
		hands={ name="Macabre Gaunt. +1",},
		ring1={ name="Defending Ring",},
		ring2={ name="C. Palug Ring",},
		back={ name="Moonlight Cape",},
		waist={ name="Flume Belt +1",},
		legs={ name="Tali'ah Sera. +2",},
		feet={ name="Nukumi Ocreae +2",},
	}

	sets.defense.PetPDT = {
		ammo={ name="Voluspa Tathlum",},
		head={ name="Anwig Salade",},
		neck={ name="Loricate Torque +1",},
		ear1={ name="Enmerkar Earring",},
		ear2={ name="Handler's Earring +1",},
		body={ name="Tot. Jackcoat +3",},
		hands={ name="Ankusa Gloves +3",},
		ring1={ name="Defending Ring",},
		ring2={ name="C. Palug Ring",},
		back={ name="Pastoralist's Mantle",},
		waist={ name="Isa Belt",},
		legs={ name="Tali'ah Sera. +2",},
		feet={ name="Ankusa Gaiters +3",},
	}

	sets.defense.PetMDT = {
		ammo={ name="Voluspa Tathlum",},
		head={ name="Anwig Salade",},
		neck={ name="Loricate Torque +1",},
		ear1={ name="Enmerkar Earring",},
		ear2={ name="Handler's Earring +1",},
		body={ name="Tot. Jackcoat +3",},
		hands={ name="Ankusa Gloves +3",},
		ring1={ name="Defending Ring",},
		ring2={ name="C. Palug Ring",},
		back={ name="Pastoralist's Mantle",},
		waist={ name="Isa Belt",},
		legs={ name="Tali'ah Sera. +2",},
		feet={ name="Ankusa Gaiters +3",},
	}

	sets.defense.PetMEVA = sets.defense.PetMDT

	sets.defense.PKiller = set_combine(sets.defense.PDT, {
		body={ name="Nukumi Gausape +2",},
	} )
	sets.defense.Reraise = set_combine(sets.defense.PDT, {
		head={ name="Twilight Helm",},
		body={ name="Twilight Mail",},
	} )

	sets.defense.MDT = {
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Genmei Kabuto",},
		neck={ name="Warder's Charm +1",},
		ear1={ name="Sanare Earring",},
		ear2={ name="Etiolation Earring",},
		body={ name="Jumalik Mail",},
		hands={ name="Macabre Gaunt. +1",},
		ring1={ name="Defending Ring",},
		ring2={ name="Shadow Ring",},
		back={ name="Engulfer Cape +1",},
		waist={ name="Engraved Belt",},
		legs={ name="Tali'ah Sera. +2",},
		feet={ name="Nukumi Ocreae +2",},
	}

	sets.defense.MEVA = {
		head={ name="Gavialis Helm",},
		neck={ name="Warder's Charm +1",},
		ear1={ name="Sanare Earring",},
		ear2={ name="Etiolation Earring",},
		body={ name="Jumalik Mail",},
		hands={ name="Leyline Gloves",},
		ring1={ name="Vengeful Ring",},
		ring2={ name="Purity Ring",},
		back={ name="Toro Cape",},
		waist={ name="Engraved Belt",},
		legs={ name="Flamma Dirs +2",},
		feet={ name="Valorous Greaves",},
	}

	sets.defense.MKiller = set_combine(sets.defense.MDT, {
		body={ name="Nukumi Gausape +2",},
	} )

	sets.Kiting = {
		feet={ name="Skd. Jambeaux +1",},
	}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- MELEE (SINGLE-WIELD) SETS
	sets.engaged = {
		ammo={ name="Coiste Bodhar",},
		head={ name="Gleti's Mask",},
		neck={ name="Lissome Necklace",},
		ear1={ name="Eabani Earring",},
		ear2={ name="Sherida Earring",},
		body={ name="Gleti's Cuirass",},
		hands={ name="Gleti's Gauntlets",},
		back={ name="Null Mantle",},
		waist={ name="Sailfi Belt +1",},
		legs={ name="Tali'ah Sera. +2",},
		feet={ name="Gleti's Boots",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Petrov Ring",},
		legs={ name="Gleti's Breeches",},
	}

	sets.engaged.SomeAcc = {
		ammo={ name="Coiste Bodhar",},
		head={ name="Gleti's Mask",},
		neck={ name="Lissome Necklace",},
		ear1={ name="Eabani Earring",},
		ear2={ name="Sherida Earring",},
		body={ name="Gleti's Cuirass",},
		hands={ name="Gleti's Gauntlets",},
		back={ name="Null Mantle",},
		waist={ name="Sailfi Belt +1",},
		legs={ name="Tali'ah Sera. +2",},
		feet={ name="Gleti's Boots",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Petrov Ring",},
		legs={ name="Gleti's Breeches",},
	}

	sets.engaged.Acc = {
		ammo={ name="Coiste Bodhar",},
		head={ name="Gleti's Mask",},
		neck={ name="Lissome Necklace",},
		ear1={ name="Eabani Earring",},
		ear2={ name="Sherida Earring",},
		body={ name="Gleti's Cuirass",},
		hands={ name="Gleti's Gauntlets",},
		back={ name="Null Mantle",},
		waist={ name="Sailfi Belt +1",},
		legs={ name="Tali'ah Sera. +2",},
		feet={ name="Gleti's Boots",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Petrov Ring",},
		legs={ name="Gleti's Breeches",},
	}

	sets.engaged.FullAcc = {
		ammo={ name="Coiste Bodhar",},
		head={ name="Gleti's Mask",},
		neck={ name="Lissome Necklace",},
		ear1={ name="Eabani Earring",},
		ear2={ name="Sherida Earring",},
		body={ name="Gleti's Cuirass",},
		hands={ name="Gleti's Gauntlets",},
		back={ name="Artio's Mantle",},
		waist={ name="Sailfi Belt +1",},
		legs={ name="Tali'ah Sera. +2",},
		feet={ name="Gleti's Boots",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Petrov Ring",},
		legs={ name="Gleti's Breeches",},
	}

	sets.engaged.Fodder = {
		ammo={ name="Coiste Bodhar",},
		head={ name="Gleti's Mask",},
		neck={ name="Lissome Necklace",},
		ear1={ name="Eabani Earring",},
		ear2={ name="Sherida Earring",},
		body={ name="Gleti's Cuirass",},
		hands={ name="Gleti's Gauntlets",},
		back={ name="Artio's Mantle",},
		waist={ name="Sailfi Belt +1",},
		legs={ name="Tali'ah Sera. +2",},
		feet={ name="Gleti's Boots",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Petrov Ring",},
		legs={ name="Gleti's Breeches",},
	}

	-- MELEE (SINGLE-WIELD) HYBRID SETS
	sets.engaged.PDT = {
		ammo={ name="Coiste Bodhar",},
		head={ name="Gleti's Mask",},
		neck={ name="Lissome Necklace",},
		ear1={ name="Eabani Earring",},
		ear2={ name="Sherida Earring",},
		body={ name="Gleti's Cuirass",},
		hands={ name="Gleti's Gauntlets",},
		back={ name="Artio's Mantle",},
		waist={ name="Sailfi Belt +1",},
		legs={ name="Tali'ah Sera. +2",},
		feet={ name="Gleti's Boots",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Petrov Ring",},
		legs={ name="Gleti's Breeches",},
	}

	sets.engaged.SomeAcc.PDT = {
		ammo={ name="Coiste Bodhar",},
		head={ name="Gleti's Mask",},
		neck={ name="Lissome Necklace",},
		ear1={ name="Eabani Earring",},
		ear2={ name="Sherida Earring",},
		body={ name="Gleti's Cuirass",},
		hands={ name="Gleti's Gauntlets",},
		back={ name="Artio's Mantle",},
		waist={ name="Sailfi Belt +1",},
		legs={ name="Tali'ah Sera. +2",},
		feet={ name="Gleti's Boots",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Petrov Ring",},
		legs={ name="Gleti's Breeches",},
	}

	sets.engaged.Acc.PDT = {
		ammo={ name="Coiste Bodhar",},
		head={ name="Gleti's Mask",},
		neck={ name="Lissome Necklace",},
		ear1={ name="Eabani Earring",},
		ear2={ name="Sherida Earring",},
		body={ name="Gleti's Cuirass",},
		hands={ name="Gleti's Gauntlets",},
		back={ name="Artio's Mantle",},
		waist={ name="Sailfi Belt +1",},
		legs={ name="Tali'ah Sera. +2",},
		feet={ name="Gleti's Boots",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Petrov Ring",},
		legs={ name="Gleti's Breeches",},
	}

	sets.engaged.FullAcc.PDT = {
		ammo={ name="Coiste Bodhar",},
		head={ name="Gleti's Mask",},
		neck={ name="Lissome Necklace",},
		ear1={ name="Eabani Earring",},
		ear2={ name="Sherida Earring",},
		body={ name="Gleti's Cuirass",},
		hands={ name="Gleti's Gauntlets",},
		back={ name="Artio's Mantle",},
		waist={ name="Sailfi Belt +1",},
		legs={ name="Tali'ah Sera. +2",},
		feet={ name="Gleti's Boots",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Petrov Ring",},
		legs={ name="Gleti's Breeches",},
	}

	sets.engaged.Fodder.PDT = {
		ammo={ name="Coiste Bodhar",},
		head={ name="Gleti's Mask",},
		neck={ name="Lissome Necklace",},
		ear1={ name="Eabani Earring",},
		ear2={ name="Sherida Earring",},
		body={ name="Gleti's Cuirass",},
		hands={ name="Gleti's Gauntlets",},
		back={ name="Artio's Mantle",},
		waist={ name="Sailfi Belt +1",},
		legs={ name="Tali'ah Sera. +2",},
		feet={ name="Gleti's Boots",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Petrov Ring",},
		legs={ name="Gleti's Breeches",},
	}

	-- MELEE (DUAL-WIELD) SETS FOR DNC AND NIN SUBJOB
	sets.engaged.DW = {
		ammo={ name="Coiste Bodhar",},
		head={ name="Gleti's Mask",},
		neck={ name="Lissome Necklace",},
		ear1={ name="Eabani Earring",},
		ear2={ name="Sherida Earring",},
		body={ name="Gleti's Cuirass",},
		hands={ name="Gleti's Gauntlets",},
		back={ name="Artio's Mantle",},
		waist={ name="Sailfi Belt +1",},
		legs={ name="Tali'ah Sera. +2",},
		feet={ name="Gleti's Boots",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Petrov Ring",},
		legs={ name="Gleti's Breeches",},
	}

	sets.engaged.DW.SomeAcc = {
		ammo={ name="Coiste Bodhar",},
		head={ name="Gleti's Mask",},
		neck={ name="Lissome Necklace",},
		ear1={ name="Eabani Earring",},
		ear2={ name="Sherida Earring",},
		body={ name="Gleti's Cuirass",},
		hands={ name="Gleti's Gauntlets",},
		back={ name="Artio's Mantle",},
		waist={ name="Sailfi Belt +1",},
		legs={ name="Tali'ah Sera. +2",},
		feet={ name="Gleti's Boots",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Petrov Ring",},
		legs={ name="Gleti's Breeches",},
	}

	sets.engaged.DW.Acc = {
		ammo={ name="Coiste Bodhar",},
		head={ name="Gleti's Mask",},
		neck={ name="Lissome Necklace",},
		ear1={ name="Eabani Earring",},
		ear2={ name="Sherida Earring",},
		body={ name="Gleti's Cuirass",},
		hands={ name="Gleti's Gauntlets",},
		back={ name="Artio's Mantle",},
		waist={ name="Sailfi Belt +1",},
		legs={ name="Tali'ah Sera. +2",},
		feet={ name="Gleti's Boots",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Petrov Ring",},
		legs={ name="Gleti's Breeches",},
	}

	sets.engaged.DW.FullAcc = {
		ammo={ name="Coiste Bodhar",},
		head={ name="Gleti's Mask",},
		neck={ name="Lissome Necklace",},
		ear1={ name="Eabani Earring",},
		ear2={ name="Sherida Earring",},
		body={ name="Gleti's Cuirass",},
		hands={ name="Gleti's Gauntlets",},
		back={ name="Artio's Mantle",},
		waist={ name="Sailfi Belt +1",},
		legs={ name="Tali'ah Sera. +2",},
		feet={ name="Gleti's Boots",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Petrov Ring",},
		legs={ name="Gleti's Breeches",},
	}

	sets.engaged.DW.Fodder = {
		ammo={ name="Coiste Bodhar",},
		head={ name="Gleti's Mask",},
		neck={ name="Lissome Necklace",},
		ear1={ name="Eabani Earring",},
		ear2={ name="Sherida Earring",},
		body={ name="Gleti's Cuirass",},
		hands={ name="Gleti's Gauntlets",},
		back={ name="Artio's Mantle",},
		waist={ name="Sailfi Belt +1",},
		legs={ name="Tali'ah Sera. +2",},
		feet={ name="Gleti's Boots",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Petrov Ring",},
		legs={ name="Gleti's Breeches",},
	}
	
	-- gear.valorous_pet_regen_body
	-- gear.valorous_pet_regen_legs

	-- MELEE (DUAL-WIELD) HYBRID SETS
	sets.engaged.DW.PDT = set_combine(sets.engaged.PDT, {
		ear1={ name="Dudgeon Earring",},
		ear2={ name="Heartseeker Earring",},
	} )
	sets.engaged.DW.SomeAcc.PDT = set_combine(sets.engaged.SomeAcc.PDT, {
		ear1={ name="Dudgeon Earring",},
		ear2={ name="Heartseeker Earring",},
	} )
	sets.engaged.DW.Acc.PDT = set_combine(sets.engaged.Acc.PDT, {
		ear1={ name="Dudgeon Earring",},
		ear2={ name="Heartseeker Earring",},
	} )
	sets.engaged.DW.FullAcc.PDT = set_combine(sets.engaged.FullAcc.PDT, {} )

	-- GEARSETS FOR MASTER ENGAGED (SINGLE-WIELD) & PET ENGAGED
	sets.engaged.BothDD = set_combine(sets.engaged,{} )
	sets.engaged.BothDD.SomeAcc = set_combine(sets.engaged.SomeAcc, {} )
	sets.engaged.BothDD.Acc = set_combine(sets.engaged.Acc, {} )
	sets.engaged.BothDD.FullAcc = set_combine(sets.engaged.FullAcc, {} )
	sets.engaged.BothDD.Fodder = set_combine(sets.engaged.Fodder, {} )

	-- GEARSETS FOR MASTER ENGAGED (SINGLE-WIELD) & PET TANKING
	sets.engaged.PetTank = set_combine(sets.engaged,{} )
	sets.engaged.PetTank.SomeAcc = set_combine(sets.engaged.SomeAcc, {} )
	sets.engaged.PetTank.Acc = set_combine(sets.engaged.Acc, {} )
	sets.engaged.PetTank.FullAcc = set_combine(sets.engaged.FullAcc, {} )
	sets.engaged.PetTank.Fodder = set_combine(sets.engaged.Fodder, {} )

	-- GEARSETS FOR MASTER ENGAGED (DUAL-WIELD) & PET ENGAGED
	sets.engaged.DW.BothDD = set_combine(sets.engaged.DW,{} )
	sets.engaged.DW.BothDD.SomeAcc = set_combine(sets.engaged.DW.SomeAcc, {} )
	sets.engaged.DW.BothDD.Acc = set_combine(sets.engaged.DW.Acc, {} )
	sets.engaged.DW.BothDD.FullAcc = set_combine(sets.engaged.DW.FullAcc, {} )
	sets.engaged.DW.BothDD.Fodder = set_combine(sets.engaged.DW.Fodder, {} )
	
	-- GEARSETS FOR MASTER ENGAGED (DUAL-WIELD) & PET TANKING
	sets.engaged.DW.PetTank = set_combine(sets.engaged.DW,{} )
	sets.engaged.DW.PetTank.SomeAcc = set_combine(sets.engaged.DW.SomeAcc, {} )
	sets.engaged.DW.PetTank.Acc = set_combine(sets.engaged.DW.Acc, {} )
	sets.engaged.DW.PetTank.FullAcc = set_combine(sets.engaged.DW.FullAcc, {} )
	sets.engaged.DW.PetTank.Fodder = set_combine(sets.engaged.DW.Fodder, {} )

	sets.buff['Killer Instinct'] = {
		body={ name="Nukumi Gausape +2",},
	}
	sets.buff.Doom = set_combine(sets.buff.Doom, {} )
	sets.buff.Sleep = {
		head={ name="Frenzy Sallet",},
	}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {
		head=gear.valorous_TH_head,
		hands=gear.valorous_TH_hands,
		legs=gear.valorous_TH_legs,
		feet=gear.valorous_TH_feet,
		waist={ name="Chaac Belt",},
	} )
	sets.Knockback = {}
	sets.SuppaBrutal = {
		ear1={ name="Suppanomimi",},
		ear2={ name="Sherida Earring",},
	}
	sets.DWEarrings = {
		ear1={ name="Dudgeon Earring",},
		ear2={ name="Heartseeker Earring",},
	}
	
	-- Weapons sets
	sets.weapons.Dolichenus = {
		main={ name="Dolichenus",},
		sub={ name="Adapa Shield",},
	}
	sets.weapons.PetPDTAxe = {
		main={ name="Izizoeksi",},
	}
	sets.weapons.DualWeapons = {
		main={ name="Dolichenus",},
		sub=gear.DigAxe_DoubleAtT,
	}
	-- sets.weapons.DualWeapons = {		
	--	main={ name="Izizoeksi",},
	--	sub={ name="Hunahpu",},
	--} 
	sets.weapons.NaegDolich = {
		main={ name="Naegling",},
		sub={ name="Dolichenus",},
	}

-------------------------------------------------------------------------------------------------------------------
-- Complete Lvl 76-99 Jug Pet Precast List +Funguar +Courier +Amigo
-------------------------------------------------------------------------------------------------------------------

	sets.precast.JA['Bestial Loyalty'].FunguarFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Seedbed Soil",},} )
	sets.precast.JA['Bestial Loyalty'].CourierCarrie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Fish Oil Broth",},} )
	sets.precast.JA['Bestial Loyalty'].AmigoSabotender = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Sun Water",},} )
	sets.precast.JA['Bestial Loyalty'].NurseryNazuna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="D. Herbal Broth",},} )
	sets.precast.JA['Bestial Loyalty'].CraftyClyvonne = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Cng. Brain Broth",},} )
	sets.precast.JA['Bestial Loyalty'].PrestoJulio = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="C. Grass. Broth",},} )
	sets.precast.JA['Bestial Loyalty'].SwiftSieghard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Mlw. Bird Broth",},} )
	sets.precast.JA['Bestial Loyalty'].MailbusterCetas = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Gob. Bug Broth",},} )
	sets.precast.JA['Bestial Loyalty'].AudaciousAnna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="B. Carrion Broth",},} )
	sets.precast.JA['Bestial Loyalty'].TurbidToloi = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Auroral Broth",},} )
	sets.precast.JA['Bestial Loyalty'].LuckyLulush = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="L. Carrot Broth",},} )
	sets.precast.JA['Bestial Loyalty'].DipperYuly = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Wool Grease",},} )
	sets.precast.JA['Bestial Loyalty'].FlowerpotMerle = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Vermihumus",},} )
	sets.precast.JA['Bestial Loyalty'].DapperMac = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Briny Broth",},} )
	sets.precast.JA['Bestial Loyalty'].DiscreetLouise = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Deepbed Soil",},} )
	sets.precast.JA['Bestial Loyalty'].FatsoFargann = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="C. Plasma Broth",},} )
	sets.precast.JA['Bestial Loyalty'].FaithfulFalcorr = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Lucky Broth",},} )
	sets.precast.JA['Bestial Loyalty'].BugeyedBroncha = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Svg. Mole Broth",},} )
	sets.precast.JA['Bestial Loyalty'].BloodclawShasra = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Rzr. Brain Broth",},} )
	sets.precast.JA['Bestial Loyalty'].GorefangHobs = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="B. Carrion Broth",},} )
	sets.precast.JA['Bestial Loyalty'].GooeyGerard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Cl. Wheat Broth",},} )
	sets.precast.JA['Bestial Loyalty'].CrudeRaphie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Shadowy Broth",},} )
	sets.precast.JA['Bestial Loyalty'].SweetCaroline = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Aged Humus",},} )

	-------------------------------------------------------------------------------------------------------------------
	-- Complete iLvl Jug Pet Precast List
	-------------------------------------------------------------------------------------------------------------------

	sets.precast.JA['Bestial Loyalty'].DroopyDortwin = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Swirling Broth",},} )
	sets.precast.JA['Bestial Loyalty'].PonderingPeter = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Vis. Broth",},} )
	sets.precast.JA['Bestial Loyalty'].SunburstMalfik = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Shimmering Broth",},} )
	sets.precast.JA['Bestial Loyalty'].AgedAngus = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Ferm. Broth",},} )
	sets.precast.JA['Bestial Loyalty'].WarlikePatrick = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Livid Broth",},} )
	sets.precast.JA['Bestial Loyalty'].ScissorlegXerin = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Spicy Broth",},} )
	sets.precast.JA['Bestial Loyalty'].BouncingBertha = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Bubbly Broth",},} )
	sets.precast.JA['Bestial Loyalty'].RhymingShizuna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Lyrical Broth",},} )
	sets.precast.JA['Bestial Loyalty'].AttentiveIbuki = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Salubrious Broth",},} )
	sets.precast.JA['Bestial Loyalty'].SwoopingZhivago = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Windy Greens",},} )
	sets.precast.JA['Bestial Loyalty'].AmiableRoche = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Airy Broth",},} )
	sets.precast.JA['Bestial Loyalty'].HeraldHenry = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Trans. Broth",},} )
	sets.precast.JA['Bestial Loyalty'].BrainyWaluis = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Crumbly Soil",},} )
	sets.precast.JA['Bestial Loyalty'].HeadbreakerKen = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Blackwater Broth",},} )
	sets.precast.JA['Bestial Loyalty'].SuspiciousAlice = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Furious Broth",},} )
	sets.precast.JA['Bestial Loyalty'].AnklebiterJedd = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Crackling Broth",},} )
	sets.precast.JA['Bestial Loyalty'].FleetReinhard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Rapid Broth",},} )
	sets.precast.JA['Bestial Loyalty'].CursedAnnabelle = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Creepy Broth",},} )
	sets.precast.JA['Bestial Loyalty'].SurgingStorm = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Insipid Broth",},} )
	sets.precast.JA['Bestial Loyalty'].SubmergedIyo = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Deepwater Broth",},} )
	sets.precast.JA['Bestial Loyalty'].RedolentCandi = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Electrified Broth",},} )
	sets.precast.JA['Bestial Loyalty'].AlluringHoney = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Bug-Ridden Broth",},} )
	sets.precast.JA['Bestial Loyalty'].CaringKiyomaro = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Fizzy Broth",},} )
	sets.precast.JA['Bestial Loyalty'].VivaciousVickie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Tant. Broth",},} )
	sets.precast.JA['Bestial Loyalty'].HurlerPercival = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Pale Sap",},} )
	sets.precast.JA['Bestial Loyalty'].BlackbeardRandy = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Meaty Broth",},} )
	sets.precast.JA['Bestial Loyalty'].GenerousArthur = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Dire Broth",},} )
	sets.precast.JA['Bestial Loyalty'].ThreestarLynn = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Muddy Broth",},} )
	sets.precast.JA['Bestial Loyalty'].MosquitoFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Wetlands Broth",},} )
	sets.precast.JA['Bestial Loyalty']['Left-HandedYoko'] = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Heavenly Broth",},} )
	sets.precast.JA['Bestial Loyalty'].BraveHeroGlenn = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Wispy Broth",},} )
	sets.precast.JA['Bestial Loyalty'].SharpwitHermes = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Saline Broth",},} )
	sets.precast.JA['Bestial Loyalty'].ColibriFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Sugary Broth",},} )
	sets.precast.JA['Bestial Loyalty'].ChoralLeera = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Glazed Broth",},} )
	sets.precast.JA['Bestial Loyalty'].SpiderFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Sticky Webbing",},} )
	sets.precast.JA['Bestial Loyalty'].GussyHachirobe = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Slimy Webbing",},} )
	sets.precast.JA['Bestial Loyalty'].AcuexFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Poisonous Broth",},} )
	sets.precast.JA['Bestial Loyalty'].FluffyBredo = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo={ name="Venomous Broth",},} )

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(1, 8)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 8)
	elseif player.sub_job == 'THF' then
		set_macro_page(1, 8)
	elseif player.sub_job == 'RUN' then
		set_macro_page(1, 8)
	else
		set_macro_page(1, 8)
	end
		send_command('@wait 5;input /lockstyleset 13')
end