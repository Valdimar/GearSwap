-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc','FullAcc','TH')
    state.WeaponskillMode:options('Match','Normal','Acc','FullAcc')
    state.HybridMode:options('Normal')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT','Refresh','Reraise')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Weapons:options('Trishula','Shining','Naegling')
	state.Passive = M{['description'] = 'Passive Mode','None','MP','Twilight'}

    select_default_macro_book()
	
	-- Additional local binds
	-- CTRL  = ^
	-- ALT   = !
	-- WIN   = @
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind ^f11 gs c cycle MagicalDefenseMode')
	send_command('bind @f7 gs c toggle AutoJumpMode')
	send_command('bind @` gs c cycle SkillchainMode')
	
	send_command('bind !w input /equip ring2 "Warp Ring";')
	send_command('bind !q input /equip ring2 "Dim. Ring (Dem)";')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA.Angon = {
		ammo={ name="Angon",},
		hands={ name="Ptero. Fin. G. +3",},
	}
	sets.precast.JA.Jump = {
		ammo={ name="Aurgelmir Orb",},
		head={ name="Flam. Zucchetto +2",},
		neck={ name="Anu Torque",},
		ear1={ name="Telos Earring",},
		ear2={ name="Sherida Earring",},
		body={ name="Ptero. Mail +3",},
		hands={ name="Vishap F. G. +2",},
		ring1={ name="Petrov Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_STRSTP,
		waist={ name="Ioskeha Belt",},
		legs={ name="Ptero. Brais +3",},
		feet={ name="Ostro Greaves",},
	}
	sets.precast.JA['Spirit Jump'] = {
		ammo={ name="Aurgelmir Orb",},
		head={ name="Flam. Zucchetto +2",},
		neck={ name="Anu Torque",},
		ear1={ name="Telos Earring",},
		ear2={ name="Sherida Earring",},
		body={ name="Ptero. Mail +3",},
		hands={ name="Vishap F. G. +2",},
		ring1={ name="Petrov Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_STRSTP,
		waist={ name="Ioskeha Belt",},
		legs={ name="Ptero. Brais +3",},
		feet={ name="Pelt. Schynbalds",}, 
	}	
	sets.precast.JA['High Jump'] = {
		ammo={ name="Aurgelmir Orb",},
		head={ name="Flam. Zucchetto +2",},
		neck={ name="Anu Torque",},
		ear1={ name="Telos Earring",},
		ear2={ name="Sherida Earring",},
		body={ name="Ptero. Mail +3",},
		hands={ name="Vishap F. G. +2",},
		ring1={ name="Petrov Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_STRSTP,
		waist={ name="Ioskeha Belt",},
		legs={ name="Ptero. Brais +3",},
		feet={ name="Ostro Greaves",},
	}
	sets.precast.JA['Soul Jump'] = {
		ammo={ name="Aurgelmir Orb",},
		head={ name="Flam. Zucchetto +2",},
		neck={ name="Anu Torque",},
		ear1={ name="Telos Earring",},
		ear2={ name="Sherida Earring",},
		body={ name="Vishap Mail +2",}, 
		hands={ name="Vishap F. G. +2",},
		ring1={ name="Petrov Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_STRSTP,
		waist={ name="Ioskeha Belt",},
		legs={ name="Ptero. Brais +3",},
		feet={ name="Pelt. Schynbalds",}, 
	}

	sets.precast.JA['Super Jump'] = {
	}
	
	sets.precast.JA['Spirit Link'] = {
		head={ name="Vishap Armet +3",},
		hands={ name="Pel. Vambraces +2",},
		feet={ name="Ptero. Greaves +3",},
		ear1={ name="Pratik Earring"},
	}
	sets.precast.JA['Ancient Circle'] = {
		legs={ name="Vishap Brais +3",},
	}
	sets.precast.JA['Call Wyvern'] = {
		body={ name="Ptero. Mail +3",},		
	} 
	sets.precast.JA['Deep Breathing'] = {
		head={ name="Ptero. Armet +3",},
	}
	sets.precast.JA['Spirit Surge'] = {
		body={ name="Ptero. Mail +3",},
	}
	sets.precast.JA['Steady Wing'] = {
		hands={ name="Despair Fin. Gaunt.",},
		neck={ name="Dgn. Collar +2",},
		legs={ name="Vishap Brais +3",},
		feet={ name="Ptero. Greaves +3",},
		back=gear.Updraft_Breath,
	}
	   sets.precast.JA['Angon'] = {
	    ammo={ name="Angon",},
		ear2={ name="Dragoon's Earring",},
	    hands={ name="Ptero. Fin, G. +3",},
	}
	
	-- Breath sets
	sets.precast.JA['Restoring Breath'] = {
        head={ name="Ptero. Armet +3",},
		hands=gear.acrohands_Br,
		legs={ name="Vishap Brais +3",},
		feet={ name="Ptero. Greaves +3",},
		waist={ name="Glassblower's belt",},
		neck={ name="Dgn. Collar +2",},
		ear2={ name="Lancer's Earring",},
		back=gear.Updraft_Breath,
	}
	sets.precast.JA['Smiting Breath'] = {
        head={ name="Ptero. Armet +3",},
		hands=gear.acrohands_Br,
		legs={ name="Vishap Brais +3",},
		feet={ name="Ptero. Greaves +3",},
		waist={ name="Glassblower's belt",},
		neck={ name="Dgn. Collar +2",},
		ear2={ name="Lancer's Earring",},
		back=gear.Updraft_Breath,
	}
	sets.HealingBreath = {{
        head={ name="Ptero. Armet +3",},
		hands=gear.acrohands_Br,
		legs={ name="Vishap Brais +3",},
		feet={ name="Ptero. Greaves +3",},
		waist={ name="Glassblower's belt",},
		neck={ name="Dgn. Collar +2",},
		ear2={ name="Lancer's Earring",},
		back=gear.Updraft_Breath,
	}
	sets.SmitingBreath = {{
        head={ name="Ptero. Armet +3",},
		hands=gear.acrohands_Br,
		legs={ name="Vishap Brais +3",},
		feet={ name="Ptero. Greaves +3",},
		waist={ name="Glassblower's belt",},
		neck={ name="Dgn. Collar +2",},
		ear2={ name="Lancer's Earring",},
		back=gear.Updraft_Breath,
	}

	-- Fast cast sets for spells
	
	sets.precast.FC = {
		ammo="Impatiens",
		head="Carmine Mask +1",
		neck="Voltsurge Torque",
		ear1="Enchntr. Earring +1",
		ear2="Loquac. Earring",
		body="Taeon Tabard",
		hands="Leyline Gloves",
		ring1="Lebeche Ring",
		ring2="Prolix Ring",
		back="Moonlight Cape",
		waist="Flume Belt +1",
		legs="Founder's Greaves",
		feet="Carmine Greaves +1"
	}
	
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.midcast.Cure = {}
	
	sets.Self_Healing = {
		neck="Phalaina Locket",
		hands="Buremte Gloves",
		ring2="Kunaji Ring",
		waist="Gishdubar Sash"
	}
	sets.Cure_Received = {
		neck="Phalaina Locket",
		hands="Buremte Gloves",
		ring2="Kunaji Ring",
		waist="Gishdubar Sash"
	}
	sets.Self_Refresh = {
		ring1={ name="Stikini Ring +1",},
		ring2={ name="Stikini Ring +1",}, 
	}

	-- Midcast Sets
	sets.midcast.FastRecast = {
		ammo="Staunch Tathlum +1",
		head="Carmine Mask +1",
		neck="Voltsurge Torque",
		ear1="Enchntr. Earring +1",
		ear2="Loquac. Earring",
		body="Taeon Tabard",
		hands="Leyline Gloves",
		ring1="Lebeche Ring",
		ring2="Prolix Ring",
		back="Moonlight Cape",
		waist="Tempus Fugit",
		legs="Founder's Greaves",
		feet="Carmine Greaves +1"
	}
		
	-- Put HP+ gear and the AF head to make healing breath trigger more easily with this set.
	sets.midcast.HB_Trigger = set_combine(sets.midcast.FastRecast, {
		head="Vishap Armet +2"}
	)
	
	-- Weaponskill sets

	-- Default set for any weaponskill that isn't any more specifically defined
	
	sets.precast.WS = {
		ammo={ name="Coiste Bodhar",},
		head="Flam. Zucchetto +2",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
		ear2="Sherida Earring",
		body=gear.valorous_wsd_body,
		hands="Sulev. Gauntlets +2",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back="Brigantia's Mantle",
		waist="Fotia Belt",
		legs="Sulev. Cuisses +2",
		feet="Flam. Gambieras +2"
	}
		
	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		neck="Shulmanu Collar"})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {
		neck="Shulmanu Collar"})
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Stardiver'] = set_combine(sets.precast.WS, {
		ammo={ name="Coiste Bodhar",},
		head={ name="Ptero. Armet +3",},
		body={ name="Gleti's Cuirass",},
		hands={ name="Sulev. Gauntlets +2",},
		legs=={ name="Nyame Flanchard",},
		feet={ name="Nyame Sollerets",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Moonshade Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Regal Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_STRDA, })
	sets.precast.WS['Stardiver'].SomeAcc = set_combine(sets.precast.WS.Acc, {
		ammo={ name="Coiste Bodhar",},
		head={ name="Ptero. Armet +3",},
		body={ name="Gleti's Cuirass",},
		hands={ name="Sulev. Gauntlets +2",},
		legs=={ name="Nyame Flanchard",},
		feet={ name="Nyame Sollerets",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Moonshade Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Regal Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_STRDA, })
	sets.precast.WS['Stardiver'].Acc = set_combine(sets.precast.WS.Acc, {
		ammo={ name="Coiste Bodhar",},
		head={ name="Ptero. Armet +3",},
		body={ name="Gleti's Cuirass",},
		hands={ name="Sulev. Gauntlets +2",},
		legs=={ name="Nyame Flanchard",},
		feet={ name="Nyame Sollerets",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Moonshade Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Regal Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_STRDA, })
		
	sets.precast.WS["Camlann's Torment"] = set_combine(sets.precast.WS, {
		ammo={ name="Knobkierrie",},
		head={ name="Ptero. Armet +3",},
		body={ name="Nyame Mail"},
		hands={ name="Ptero. Fin. G. +3",},
		legs=={ name="Vishap Brais +3",},
		feet={ name="Nyame Sollerets",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Thrud Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Regal Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_STRWSD, })
	sets.precast.WS["Camlann's Torment"].SomeAcc = set_combine(sets.precast.WS.Acc, {
		ammo={ name="Knobkierrie",},
		head={ name="Ptero. Armet +3",},
		body={ name="Nyame Mail"},
		hands={ name="Ptero. Fin. G. +3",},
		legs=={ name="Vishap Brais +3",},
		feet={ name="Nyame Sollerets",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Thrud Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Regal Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_STRWSD, })
	sets.precast.WS["Camlann's Torment"].Acc = set_combine(sets.precast.WS.Acc, {
		ammo={ name="Knobkierrie",},
		head={ name="Ptero. Armet +3",},
		body={ name="Nyame Mail"},
		hands={ name="Ptero. Fin. G. +3",},
		legs=={ name="Vishap Brais +3",},
		feet={ name="Nyame Sollerets",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Thrud Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Regal Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_STRWSD, })
	
	sets.precast.WS['Drakesbane'] = set_combine(sets.precast.WS, {
		ammo={ name="Coiste Bodhar",},
		head={ name="Blistering Sallet +1",},
		body={ name="Hjarrandi Breast.",},
		hands={ name="Flam. Manopolas +2",},
		legs=={ name="Pelt. Cuissots +1",},
		feet={ name="Sulev. Leggings +2",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Thrud Earring",},
		ear2={ name="Moonshade Earring",},
		ring1={ name="Begrudging Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.Brig_STRDA, })
	sets.precast.WS['Drakesbane'].SomeAcc = set_combine(sets.precast.WS.Acc, {
		ammo={ name="Coiste Bodhar",},
		head={ name="Blistering Sallet +1",},
		body={ name="Hjarrandi Breast.",},
		hands={ name="Flam. Manopolas +2",},
		legs=={ name="Pelt. Cuissots +1",},
		feet={ name="Sulev. Leggings +2",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Thrud Earring",},
		ear2={ name="Moonshade Earring",},
		ring1={ name="Begrudging Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.Brig_STRDA, })
	sets.precast.WS['Drakesbane'].Acc = set_combine(sets.precast.WS.Acc, {
		ammo={ name="Coiste Bodhar",},
		head={ name="Blistering Sallet +1",},
		body={ name="Hjarrandi Breast.",},
		hands={ name="Flam. Manopolas +2",},
		legs=={ name="Pelt. Cuissots +1",},
		feet={ name="Sulev. Leggings +2",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Thrud Earring",},
		ear2={ name="Moonshade Earring",},
		ring1={ name="Begrudging Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.Brig_STRDA, })
		
	sets.precast.WS['Leg Sweep'] = set_combine(sets.precast.WS, { })
	
	sets.precast.WS['Leg Sweep'].SomeAcc = set_combine(sets.precast.WS.Acc, { })
	
	sets.precast.WS['Leg Sweep'].Acc = set_combine(sets.precast.WS.Acc, { })
	
	
	sets.precast.WS['Impulse Drive'] = set_combine(sets.precast.WS, { })
	
	sets.precast.WS['Impulse Drive'].SomeAcc = set_combine(sets.precast.WS.Acc, { })
	
	sets.precast.WS['Impulse Drive'].Acc = set_combine(sets.precast.WS.Acc, { })
	
	
	sets.precast.WS['Sonic Thrust'] = set_combine(sets.precast.WS, { })
	
	sets.precast.WS['Sonic Thrust'].SomeAcc = set_combine(sets.precast.WS.Acc, { })
	
	sets.precast.WS['Sonic Thrust'].Acc = set_combine(sets.precast.WS.Acc, { })
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {
		ammo={ name="Staunch Tathlum +1 +1",},
		head={ name="Hjarrandi helm",},
		body={ name="Hjarrandi Breast.",},		
		hands={ name="Arke Manopolas",},
		legs={ name="Arke Cosciales",},
		feet={ name="Arke Gambieras",},
		neck={ name="Loricate Torque +1",},
		waist={ name="Flume Belt +1",},
		ear1={ name="Alabaster Earring"},
		ear2={ name="Enmerkar Earring",},
		ring1={ name="Defending Ring",},
		ring2={ name="Moonbeam Ring",},
		back=gear.brig_DEXDA,
	}

	-- Idle sets
	sets.idle = {
		sub={ name="Utu Grip",},
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Hjarrandi helm",},
		body={ name="Hjarrandi Breast.",},
		hands={ name="Nyame Gauntlets",},
		legs=gear.CarmineLegs_HP,
		feet={ name="Nyame Sollerets",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Flume Belt +1",},
		ear1={ name="Alabaster Earring"},
		ear2={ name="Odnowa Earring +1",},
		ring1={ name="Murky Ring",},
		ring2={ name="Moonbeam Ring",},
		back=gear.brig_DEXDA,
	}
		
	sets.idle.Refresh = {
		body={ name="Chozor. Coslete",},
	}

	sets.idle.Weak = set_combine(sets.idle, {
		head="Twilight Helm",
		body="Twilight Mail"
	} )
		
	sets.idle.Reraise = set_combine(sets.idle, {
		head="Twilight Helm",
		body="Twilight Mail"
	} )
	
	-- Defense sets
	sets.defense.PDT = {
		ammo={ name="Staunch Tathlum +1 +1",},
		head={ name="Hjarrandi helm",},
		body={ name="Hjarrandi Breast.",},
		hands={ name="Nyame Gauntlets",},
		legs={ name="Nyame Flanchard",},
		feet={ name="Nyame Sollerets",},
		neck={ name="Loricate Torque +1",},
		waist={ name="Flume Belt +1",},
		ear1={ name="Genmei Earring", },
		ear2={ name="Telos Earring", },
		ring1={ name="Defending Ring",},
		ring2={ name="Moonbeam Ring",},
		back={ name="Repulse Mantle",},
	}
		
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {
		head="Twilight Helm",
		body="Twilight Mail"}
	)

	sets.defense.MDT = {
		ammo="Staunch Tathlum +1 +1 +1",
		head="Loess Barbuta +1",
		neck="Warder's Charm +1",
		ear1={ name="Genmei Earring",},
		ear2="Ethereal Earring",
		body="Tartarus Platemail",
		hands="Sulev. Gauntlets +2",
		ring1="Moonbeam Ring",
		ring2="Moonlight Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Arke Cosc. +1",feet="Amm Greaves"
	}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {
		head="Twilight Helm",
		body="Twilight Mail",
	})
		
	sets.defense.MEVA = {
		ammo="Staunch Tathlum +1 +1 +1",
		head="Loess Barbuta +1",
		neck="Warder's Charm +1",
		body="Tartarus Platemail",
		hands="Sulev. Gauntlets +2",
		waist="Flume Belt +1",
		legs="Arke Cosc. +1",
		feet="Amm Greaves",
		ring1="Moonbeam Ring",
		ring2="Moonlight Ring",
		back="Moonlight Cape",
		ear1="Genmei Earring",
		ear2="Ethereal Earring",
	}

	sets.Kiting = {
		legs="Carmine Cuisses +1"
	}
	sets.Reraise = {
		head="Twilight Helm",
		body="Twilight Mail"
	}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {
		head={ name="Frenzy Sallet"},
	}
	
    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.passive.MP = {
		ear2="Ethereal Earring",
		waist="Flume Belt +1"
	}
    sets.passive.Twilight = {
		head="Twilight Helm", 
		body="Twilight Mail"
	}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {
		hands=gear.valorous_TH_hands,
		legs=gear.valorous_TH_legs,
		feet=gear.valorous_TH_feet,
		waist="Chaac Belt",
	})
	
	-- Weapons sets
	sets.weapons.Trishula = {
		main={ name="Trishula"},
		sub={ name="Utu Grip"},	
	}
	
	sets.weapons.Shining = {
		main={ name="Shining One"},
		sub={ name="Utu Grip"},	
	}
	sets.weapons.Naegling = {
		main={ name="Naegling"},
	}
	
	-- Ranged Sets
	sets.precast.RA = {}
	sets.midcast.RA = {
		range={ name="Antitail",},
	}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {
		ear1="Lugra Earring +1",
		ear2="Sherida Earring",
	}
	sets.AccMaxTP = {
		ear1="Mache Earring +1",
		ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {
		ear1="Mache Earring +1",
		ear2="Telos Earring"
	}
	sets.DayMaxTPWSEars = {
		ear1="Brutal Earring",
		ear2="Sherida Earring",
	}
	sets.AccDayWSEars = {
		ear1="Mache Earring +1",
		ear2="Telos Earring"
	}
	sets.DayWSEars = {
		ear1="Moonshade Earring",
		ear2="Sherida Earring",
	}
	
	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group

	sets.engaged = {
		sub={ name="Utu Grip",},
		ammo={ name="Volupsa Tathlum",},
		head={ name="Hjarrandi Helm",},
		body={ name="Pelt. Plackart +2",},
		hands={ name="Pel. Vambraces +2",},
		legs={ name="Ptero. Brais +3",},
		feet={ name="Pelt. Schyn. +2",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Ioskeha belt +1",},
		ear1={ name="Sroda Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Murky Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_DEXDA,		
	}
    sets.engaged.SomeAcc = {
		sub={ name="Utu Grip",},
		ammo={ name="Volupsa Tathlum",},
		head={ name="Hjarrandi Helm",},
		body={ name="Pelt. Plackart +2",},
		hands={ name="Pel. Vambraces +2",},
		legs={ name="Ptero. Brais +3",},
		feet={ name="Pelt. Schyn. +2",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Ioskeha belt +1",},
		ear1={ name="Sroda Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Murky Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_DEXDA,
	}
	sets.engaged.Acc = {
		sub={ name="Utu Grip",},
		ammo={ name="Volupsa Tathlum",},
		head={ name="Hjarrandi Helm",},
		body={ name="Pelt. Plackart +2",},
		hands={ name="Pel. Vambraces +2",},
		legs={ name="Ptero. Brais +3",},
		feet={ name="Pelt. Schyn. +2",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Ioskeha belt +1",},
		ear1={ name="Sroda Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Defending Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_DEXDA,
	}
    sets.engaged.FullAcc = {
		sub={ name="Utu Grip",},
		ammo={ name="Volupsa Tathlum",},
		head={ name="Hjarrandi Helm",},
		body={ name="Pelt. Plackart +2",},
		hands={ name="Pel. Vambraces +2",},
		legs={ name="Ptero. Brais +3",},
		feet={ name="Pelt. Schyn. +2",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Ioskeha belt +1",},
		ear1={ name="Sroda Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Defending Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_DEXDA,
	}
	sets.engaged.TH = {
		sub={ name="Utu Grip",},
		ammo={ name="Aurgelmir Orb",},
		head={ name="Hjarrandi Helm",},
		body={ name="Pelt. Plackart +2",},
		hands=gear.valorous_TH_hands,
		legs={ name="Ptero. Brais +3",},
		feet=gear.valorous_TH_feet,	
		neck={ name="Dgn. Collar +2",},
		waist={ name="Ioskeha belt +1",},
		ear1={ name="Sroda Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Defending Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_DEXDA,
	}

    sets.engaged.AM = {}
    sets.engaged.AM.SomeAcc = {}
	sets.engaged.AM.Acc = {}
    sets.engaged.AM.FullAcc = {}
    -- sets.engaged.AM.Fodder = {}
	
    sets.engaged.PDT = {}
    sets.engaged.SomeAcc.PDT = {}
	sets.engaged.Acc.PDT = {}
    sets.engaged.FullAcc.PDT = {}
    -- sets.engaged.Fodder.PDT = {}
	
    sets.engaged.AM.PDT = {}
    sets.engaged.AM.SomeAcc.PDT = {}
	sets.engaged.AM.Acc.PDT = {}
    sets.engaged.AM.FullAcc.PDT = {}
    -- sets.engaged.AM.Fodder.PDT = {}
		
	--[[ Melee sets for in Adoulin, which has an extra 2% Haste from Ionis.
	
    sets.engaged.Adoulin = {}
    sets.engaged.Adoulin.SomeAcc = {}
	sets.engaged.Adoulin.Acc = {}
    sets.engaged.Adoulin.FullAcc = {}
    sets.engaged.Adoulin.Fodder = {}
    sets.engaged.Adoulin.AM = {}
    sets.engaged.Adoulin.AM.SomeAcc = {}
	sets.engaged.Adoulin.AM.Acc = {}
    sets.engaged.Adoulin.AM.FullAcc = {}
    sets.engaged.Adoulin.AM.Fodder = {}
	
    sets.engaged.Adoulin.PDT = {}
    sets.engaged.Adoulin.SomeAcc.PDT = {}
	sets.engaged.Adoulin.Acc.PDT = {}
    sets.engaged.Adoulin.FullAcc.PDT = {}
    sets.engaged.Adoulin.Fodder.PDT = {}
	
    sets.engaged.Adoulin.AM.PDT = {}
    sets.engaged.Adoulin.AM.SomeAcc.PDT = {}
	sets.engaged.Adoulin.AM.Acc.PDT = {}
    sets.engaged.Adoulin.AM.FullAcc.PDT = {}
    sets.engaged.Adoulin.AM.Fodder.PDT = {}
	]]

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WHM' then
        set_macro_page(1, 12)
    elseif player.sub_job == 'SAM' then
        set_macro_page(2, 12)
    elseif player.sub_job == 'NIN' then
        set_macro_page(3, 12)
    else
        set_macro_page(2, 12)
    end
		send_command('@wait 5;input /lockstyleset 1')
end
