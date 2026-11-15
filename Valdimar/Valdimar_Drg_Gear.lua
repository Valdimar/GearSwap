-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc','FullAcc')
    state.WeaponskillMode:options('Match','Normal','Acc','FullAcc')
    state.HybridMode:options('Normal','Wyvern','Tank')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal','PetRegen')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Weapons:options('GaeBuide','Trishula','Shining','Naegling')
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
	
	send_command('bind !w input /equip ring1 "Warp Ring";')
	send_command('bind !q input /equip ring1 "Dim. Ring (Holla)";')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	-- Precast sets to enhance JAs

	sets.AF = {
		head={ name="Vishap Armet +4",},
		body={ name="Vishap Mail +4",},
		hands={ name="Vish. Fin. +4",},
		legs={ name="Vishap Brais +4",},
		feet={ name="Vishap Greaves +4",},
	}
	sets.Relic = {
		head={ name="Ptero. Armet +3",},
		body={ name="Ptero. Mail +4",},
		hands={ name="Ptero. Fin. G. +4",},
		legs={ name="Ptero. Brais +4",},
		feet={ name="Ptero. Greaves +4",},
	}
	sets.Empy = {
		head={ name="Peltast's Mezail +3",},
		body={ name="Pelt. Plackart +3",},
		hands={ name="Pel. Vambraces +3",},
		legs={ name="Pelt. Cuissots +3",},
		feet={ name="Pelt. Schyn. +3",},
	}
	
	sets.precast.JA.Jump = {
		ammo={ name="Coiste Bodhar",},
		head={ name="Flam. Zucchetto +2",},
		neck={ name="Anu Torque",},
		body={ name="Vishap Mail +4",},
		hands={ name="Vish. Fin. +4",},
		waist={ name="Ioskeha Belt +1",},
		legs={ name="Ptero. Brais +4",},
		feet={ name="Ostro Greaves",},
		ring1={ name="Ephramad's Ring",},
		ring2={ name="Niqmaddu Ring",},
		ear1={ name="Telos Earring",},
		ear2={ name="Sherida Earring",},
		back=gear.brig_DEXDA,
	}
	sets.precast.JA['Spirit Jump'] = {
		ammo={ name="Coiste Bodhar",},
		head={ name="Flam. Zucchetto +2",},
		neck={ name="Anu Torque",},
		body={ name="Vishap Mail +4",},
		hands={ name="Vish. Fin. +4",},
		waist={ name="Ioskeha Belt +1",},
		legs={ name="Pelt. Cuissots +3",},
		feet={ name="Pelt. Schyn. +3",},
		ring1={ name="Ephramad's Ring",},
		ring2={ name="Niqmaddu Ring",},
		ear1={ name="Telos Earring",},
		ear2={ name="Sherida Earring",},
		back=gear.brig_DEXDA,
	}
	sets.precast.JA['High Jump'] = {
		ammo={ name="Coiste Bodhar",},
		head={ name="Flam. Zucchetto +2",},
		neck={ name="Anu Torque",},
		body={ name="Vishap Mail +4",},
		hands={ name="Vish. Fin. +4",},
		waist={ name="Ioskeha Belt +1",},
		legs={ name="Ptero. Brais +4",},
		feet={ name="Ostro Greaves",},
		ring1={ name="Ephramad's Ring",},
		ring2={ name="Niqmaddu Ring",},
		ear1={ name="Telos Earring",},
		ear2={ name="Sherida Earring",},
		back=gear.brig_DEXDA,
	}
	sets.precast.JA['Soul Jump'] = {
		ammo={ name="Coiste Bodhar",},
		head={ name="Flam. Zucchetto +2",},
		neck={ name="Anu Torque",},
		body={ name="Vishap Mail +4",},
		hands={ name="Vish. Fin. +4",},
		waist={ name="Ioskeha Belt +1",},
		legs={ name="Ptero. Brais +4",},
		feet={ name="Ostro Greaves",},
		ring1={ name="Ephramad's Ring",},
		ring2={ name="Niqmaddu Ring",},
		ear1={ name="Telos Earring",},
		ear2={ name="Sherida Earring",},
		back=gear.brig_DEXDA,
	}

	sets.precast.JA['Super Jump'] = {
	}
	
	sets.precast.JA['Spirit Link'] = {
		head={ name="Vishap Armet +4",},
		hands={ name="Pel. Vambraces +3",},
		feet={ name="Ptero. Greaves +4",},
		neck={ name="Dgn. Collar +2",},
		ear1={ name="Pratik Earring",},
		ear2={ name="Pel. Earring +1",},
		ring1={ name="Dreki Ring",},
	}
	sets.precast.JA['Ancient Circle'] = {
		legs={ name="Vishap Brais +4",},
	}
	sets.precast.JA['Call Wyvern'] = {
		body={ name="Ptero. Mail +4",},
	} 
	sets.precast.JA['Deep Breathing'] = {
		head={ name="Ptero. Armet +3",},
	}
	sets.precast.JA['Spirit Surge'] = {
		body={ name="Ptero. Mail +4",},
	}
	sets.precast.JA['Steady Wing'] = {
		hands={ name="Despair Fin. Gaunt.",},
		legs={ name="Vishap Brais +4",},
		feet={ name="Ptero. Greaves +4",},
		neck={ name="Dgn. Collar +2",},
		ring1={ name="Dreki Ring",},
		ear2={ name="Pel. Earring +1",},
		back=gear.Updraft_Breath,
	}
	   sets.precast.JA['Angon'] = {
	    ammo={ name="Angon",},
		ear2={ name="Dragoon's Earring",},
	    hands={ name="Ptero. Fin. G. +4",},
	}
	
	-- Breath sets
	sets.precast.JA['Restoring Breath'] = {
        head={ name="Ptero. Armet +3",},
		body=gear.acrobody_Br,
		hands=gear.acrohands_Br,
		legs={ name="Vishap Brais +4",},
		feet={ name="Ptero. Greaves +4",},
		waist={ name="Glassblower's belt",},
		neck={ name="Dgn. Collar +2",},
		ring1={ name="Dreki Ring",},
		ear2={ name="Lancer's Earring",},
		back=gear.Updraft_Breath,
	}
	sets.precast.JA['Smiting Breath'] = {
        head={ name="Ptero. Armet +3",},
		body=gear.acrobody_Br,
		hands=gear.acrohands_Br,
		legs={ name="Vishap Brais +4",},
		feet={ name="Ptero. Greaves +4",},
		waist={ name="Glassblower's belt",},
		neck={ name="Dgn. Collar +2",},
		ring1={ name="Dreki Ring",},
		ear2={ name="Lancer's Earring",},
		back=gear.Updraft_Breath,
	}
	sets.HealingBreath = {
        head={ name="Ptero. Armet +3",},
		body=gear.acrobody_Br,
		hands=gear.acrohands_Br,
		legs={ name="Vishap Brais +4",},
		feet={ name="Ptero. Greaves +4",},
		waist={ name="Glassblower's belt",},
		neck={ name="Dgn. Collar +2",},
		ring1={ name="Dreki Ring",},
		ear2={ name="Lancer's Earring",},
		back=gear.Updraft_Breath,
	}
	sets.SmitingBreath = {
        head={ name="Ptero. Armet +3",},
		body=gear.acrobody_Br,
		hands=gear.acrohands_Br,
		legs={ name="Vishap Brais +4",},
		feet={ name="Ptero. Greaves +4",},
		waist={ name="Glassblower's belt",},
		neck={ name="Dgn. Collar +2",},
		ring1={ name="Dreki Ring",},
		ear2={ name="Lancer's Earring",},
		back=gear.Updraft_Breath,
	}

	-- Fast cast sets for spells
	
	sets.precast.FC = {
		ammo={ name="Impatiens",},
		head={ name="Carmine Mask +1",},
		body={ name="Sacro. Breastplate",},
		hands={ name="Leyline Gloves",},
		legs={ name="Founder's Greaves",},
		feet={ name="Carmine Greaves +1",},
		neck={ name="Voltsurge Torque",},
		waist={ name="Flume Belt +1",},
		ring1={ name="Lebeche Ring",},
		ring2={ name="Prolix Ring",},
		ear1={ name="Enchntr. Earring +1",},
		ear2={ name="Loquac. Earring",},
		back={ name="Moonlight Cape",},
	}
	
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.midcast.Cure = {}
	
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
		ring1={ name="Stikini Ring +1",},
		ring2={ name="Stikini Ring +1",},
	}

	-- Midcast Sets
	sets.midcast.FastRecast = {
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Carmine Mask +1",},
		neck={ name="Voltsurge Torque",},
		ear1={ name="Enchntr. Earring +1",},
		ear2={ name="Loquac. Earring",},
		body={ name="Taeon Tabard",},
		hands={ name="Leyline Gloves",},
		ring1={ name="Lebeche Ring",},
		ring2={ name="Prolix Ring",},
		back={ name="Moonlight Cape",},
		waist={ name="Tempus Fugit",},
		legs={ name="Founder's Greaves",},
		feet={ name="Carmine Greaves +1",},
	}
		
	-- Put HP+ gear and the AF head to make healing breath trigger more easily with this set.
	sets.midcast.HB_Trigger = set_combine(sets.midcast.FastRecast, {
		head={ name="Vishap Armet +4",},
		body={ name="Adamantite Armor",},
	} )
	
	-- Weaponskill sets

	-- Default set for any weaponskill that isn't any more specifically defined
	
	sets.precast.WS = {
		ammo={ name="Coiste Bodhar",},
		body={ name="Gleti's Cuirass",},
		hands={ name="Pel. Vambraces +3",},
		legs={ name="Gleti's Breeches",},
		feet={ name="Nyame Sollerets",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Fotia Belt",},
		ear1={ name="Sroda Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Regal Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_STRDA,
	}
		
	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		neck={ name="Shulmanu Collar",},
	} )
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {
		neck={ name="Shulmanu Collar",},
	} )
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Stardiver'] = set_combine(sets.precast.WS, {
		ammo={ name="Coiste Bodhar",},
		head={ name="Peltast's Mezail +3",},
		body={ name="Gleti's Cuirass",},
		hands={ name="Pel. Vambraces +3",},
		legs={ name="Gleti's Breeches",},
		feet={ name="Nyame Sollerets",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Fotia Belt",},
		ear1={ name="Sroda Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Sroda Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_STRDA,
		} )
	sets.precast.WS['Stardiver'].SomeAcc = set_combine(sets.precast.WS.Acc, {
		ammo={ name="Coiste Bodhar",},
		head={ name="Peltast's Mezail +3",},
		body={ name="Gleti's Cuirass",},
		hands={ name="Pel. Vambraces +3",},
		legs={ name="Gleti's Breeches",},
		feet={ name="Nyame Sollerets",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Fotia Belt",},
		ear1={ name="Sroda Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Sroda Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_STRDA,
		} )
	sets.precast.WS['Stardiver'].Acc = set_combine(sets.precast.WS.Acc, {
		ammo={ name="Coiste Bodhar",},
		head={ name="Peltast's Mezail +3",},
		body={ name="Gleti's Cuirass",},
		hands={ name="Pel. Vambraces +3",},
		legs={ name="Gleti's Breeches",},
		feet={ name="Nyame Sollerets",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Fotia Belt",},
		ear1={ name="Sroda Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Sroda Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_STRDA,
		} )
	sets.precast.WS["Camlann's Torment"] = set_combine(sets.precast.WS, {
		ammo={ name="Knobkierrie",},
		head={ name="Peltast's Mezail +3",},
		body=gear.valorous_wsd_body,
		hands={ name="Ptero. Fin. G. +4",},
		legs={ name="Vishap Brais +4",},
		feet={ name="Sulev. Leggings +2",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Thrud Earring",},
		ear2={ name="Pel. Earring +1",},
		ring1={ name="Regal Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_STRWSD,
		} )
	sets.precast.WS["Camlann's Torment"].SomeAcc = set_combine(sets.precast.WS.Acc, {
		ammo={ name="Knobkierrie",},
		head={ name="Peltast's Mezail +3",},
		body=gear.valorous_wsd_body,
		hands={ name="Ptero. Fin. G. +4",},
		legs={ name="Vishap Brais +4",},
		feet={ name="Sulev. Leggings +2",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Thrud Earring",},
		ear2={ name="Pel. Earring +1",},
		ring1={ name="Regal Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_STRWSD,
		} )
	sets.precast.WS["Camlann's Torment"].Acc = set_combine(sets.precast.WS.Acc, {
		ammo={ name="Knobkierrie",},
		head={ name="Peltast's Mezail +3",},
		body=gear.valorous_wsd_body,
		hands={ name="Ptero. Fin. G. +4",},
		legs={ name="Vishap Brais +4",},
		feet={ name="Sulev. Leggings +2",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Thrud Earring",},
		ear2={ name="Pel. Earring +1",},
		ring1={ name="Regal Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_STRWSD,
		} )
	sets.precast.WS['Drakesbane'] = set_combine(sets.precast.WS, {
		ammo={ name="Coiste Bodhar",},
		head={ name="Blistering Sallet +1",},
		body={ name="Hjarrandi Breast.",},
		hands={ name="Flam. Manopolas +2",},
		legs={ name="Pelt. Cuissots +3",},
		feet=gear.valorous_wsd_feet,
		neck={ name="Dgn. Collar +2",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Thrud Earring",},
		ear2={ name="Pel. Earring +1",},
		ring1={ name="Sroda Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.Brig_STRcrit,
		} )
	sets.precast.WS['Drakesbane'].SomeAcc = set_combine(sets.precast.WS.Acc, {
		ammo={ name="Coiste Bodhar",},
		head={ name="Blistering Sallet +1",},
		body={ name="Hjarrandi Breast.",},
		hands={ name="Flam. Manopolas +2",},
		legs={ name="Pelt. Cuissots +3",},
		feet=gear.valorous_wsd_feet,
		neck={ name="Dgn. Collar +2",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Thrud Earring",},
		ear2={ name="Pel. Earring +1",},
		ring1={ name="Sroda Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.Brig_STRcrit,
		} )
	sets.precast.WS['Drakesbane'].Acc = set_combine(sets.precast.WS.Acc, {
		ammo={ name="Coiste Bodhar",},
		head={ name="Blistering Sallet +1",},
		body={ name="Hjarrandi Breast.",},
		hands={ name="Flam. Manopolas +2",},
		legs={ name="Pelt. Cuissots +3",},
		feet=gear.valorous_wsd_feet,
		neck={ name="Dgn. Collar +2",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Thrud Earring",},
		ear2={ name="Pel. Earring +1",},
		ring1={ name="Sroda Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.Brig_STRcrit,
		} )
		
	sets.precast.WS['Leg Sweep'] = set_combine(sets.precast.WS, {
		ammo={ name="Pemphredo Tathlum",},
		head={ name="Peltast's Mezail +3",},
		body={ name="Pelt. Plackart +3",},
		hands={ name="Pel. Vambraces +3",},
		legs={ name="Pelt. Cuissots +3",},
		feet={ name="Pelt. Schyn. +3",},
		neck={ name="Null Loop",},
		waist={ name="Incarnation Sash",},
		ear1={ name="Moonshade Earring",},
		ear2={ name="Pel. Earring +1",},
		ring1={ name="Regal Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.Brig_STRcrit,
		} )
	
	sets.precast.WS['Leg Sweep'].SomeAcc = set_combine(sets.precast.WS.Acc, {
		ammo={ name="Pemphredo Tathlum",},
		head={ name="Peltast's Mezail +3",},
		body={ name="Pelt. Plackart +3",},
		hands={ name="Pel. Vambraces +3",},
		legs={ name="Pelt. Cuissots +3",},
		feet={ name="Pelt. Schyn. +3",},
		neck={ name="Null Loop",},
		waist={ name="Incarnation Sash",},
		ear1={ name="Moonshade Earring",},
		ear2={ name="Pel. Earring +1",},
		ring1={ name="Regal Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.Brig_STRcrit,
		} )
	
	sets.precast.WS['Leg Sweep'].Acc = set_combine(sets.precast.WS.Acc, {
		ammo={ name="Pemphredo Tathlum",},
		head={ name="Peltast's Mezail +3",},
		body={ name="Pelt. Plackart +3",},
		hands={ name="Pel. Vambraces +3",},
		legs={ name="Pelt. Cuissots +3",},
		feet={ name="Pelt. Schyn. +3",},
		neck={ name="Null Loop",},
		waist={ name="Incarnation Sash",},
		ear1={ name="Moonshade Earring",},
		ear2={ name="Pel. Earring +1",},
		ring1={ name="Regal Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.Brig_STRcrit,
		} )
	
	
	sets.precast.WS['Impulse Drive'] = set_combine(sets.precast.WS.Acc, {
		ammo={ name="Knobkierrie",},
		head={ name="Peltast's Mezail +3",},
		body={ name="Gleti's Cuirass",},
		hands={ name="Ptero. Fin. G. +4",},
		legs={ name="Nyame Flanchard",},
		feet={ name="Nyame Sollerets",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Thrud Earring",},
		ear2={ name="Moonshade Earring",},
		ring1={ name="Regal Ring",},
		ring2={ name="Sroda Ring",},
		back=gear.brig_STRWSD,
		} )
	
	sets.precast.WS['Impulse Drive'].SomeAcc = set_combine(sets.precast.WS.Acc, {
		ammo={ name="Knobkierrie",},
		head={ name="Peltast's Mezail +3",},
		body={ name="Gleti's Cuirass",},
		hands={ name="Ptero. Fin. G. +4",},
		legs={ name="Nyame Flanchard",},
		feet={ name="Nyame Sollerets",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Thrud Earring",},
		ear2={ name="Moonshade Earring",},
		ring1={ name="Regal Ring",},
		ring2={ name="Sroda Ring",},
		back=gear.brig_STRWSD,
		} )
	
	sets.precast.WS['Impulse Drive'].Acc = set_combine(sets.precast.WS.Acc, {
		ammo={ name="Knobkierrie",},
		head={ name="Peltast's Mezail +3",},
		body={ name="Gleti's Cuirass",},
		hands={ name="Ptero. Fin. G. +4",},
		legs={ name="Nyame Flanchard",},
		feet={ name="Nyame Sollerets",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Thrud Earring",},
		ear2={ name="Moonshade Earring",},
		ring1={ name="Regal Ring",},
		ring2={ name="Sroda Ring",},
		back=gear.brig_STRWSD,
		} )
	
	sets.precast.WS['Sonic Thrust'] = set_combine(sets.precast.WS, {
		ammo={ name="Knobkierrie",},
		head={ name="Peltast's Mezail +3",},
		body=gear.valorous_wsd_body,
		hands={ name="Ptero. Fin. G. +4",},
		legs={ name="Vishap Brais +4",},
		feet={ name="Sulev. Leggings +2",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Thrud Earring",},
		ear2={ name="Moonshade Earring",},
		ring1={ name="Regal Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_STRWSD,
		} )
	
	sets.precast.WS['Sonic Thrust'].SomeAcc = set_combine(sets.precast.WS.Acc, {
		ammo={ name="Knobkierrie",},
		head={ name="Peltast's Mezail +3",},
		body=gear.valorous_wsd_body,
		hands={ name="Ptero. Fin. G. +4",},
		legs={ name="Vishap Brais +4",},
		feet={ name="Sulev. Leggings +2",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Thrud Earring",},
		ear2={ name="Moonshade Earring",},
		ring1={ name="Regal Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_STRWSD,
		} )
	
	sets.precast.WS['Sonic Thrust'].Acc = set_combine(sets.precast.WS.Acc, {
		ammo={ name="Knobkierrie",},
		head={ name="Peltast's Mezail +3",},
		body=gear.valorous_wsd_body,
		hands={ name="Ptero. Fin. G. +4",},
		legs={ name="Vishap Brais +4",},
		feet={ name="Sulev. Leggings +2",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Thrud Earring",},
		ear2={ name="Moonshade Earring",},
		ring1={ name="Regal Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_STRWSD,
		} )

	sets.precast.WS['Diarmuid'] = set_combine(sets.precast.WS, {
		ammo={ name="Knobkierrie",},
		head={ name="Peltast's Mezail +3",},
		body={ name="Peltast's Plackart +3",},
		hands={ name="Ptero. Fin. G. +4",},
		legs={ name="Nyame Flanchard",},
		feet={ name="Nyame Sollerets",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Moonshade Earring",},
		ear2={ name="Pel. Earring +1",},
		ring1={ name="Sroda Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_STRWSD,
		} )
		
	sets.precast.WS['Diarmuid'].SomeAcc = set_combine(sets.precast.WS.Acc, {
		ammo={ name="Knobkierrie",},
		head={ name="Peltast's Mezail +3",},
		body={ name="Peltast's Plackart +3",},
		hands={ name="Ptero. Fin. G. +4",},
		legs={ name="Nyame Flanchard",},
		feet={ name="Nyame Sollerets",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Moonshade Earring",},
		ear2={ name="Pel. Earring +1",},
		ring1={ name="Sroda Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_STRWSD,
		} )
		
	sets.precast.WS['Diarmuid'].Acc = set_combine(sets.precast.WS.Acc, {
		ammo={ name="Knobkierrie",},
		head={ name="Peltast's Mezail +3",},
		body={ name="Peltast's Plackart +3",},
		hands={ name="Ptero. Fin. G. +4",},
		legs={ name="Nyame Flanchard",},
		feet={ name="Nyame Sollerets",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Moonshade Earring",},
		ear2={ name="Pel. Earring +1",},
		ring1={ name="Sroda Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_STRWSD,
		} )
	
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
		ammo={ name="Knobkierrie",},
		head={ name="Peltast's Mezail +3",},
		body={ name="Peltast's Plackart +3",},
		hands={ name="Ptero. Fin. G. +4",},
		legs={ name="Nyame Flanchard",},
		feet={ name="Nyame Sollerets",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Moonshade Earring",},
		ear2={ name="Pel. Earring +1",},
		ring1={ name="Sroda Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_STRWSD,
		} )
		
	sets.precast.WS['Savage Blade'].SomeAcc = set_combine(sets.precast.WS.Acc, {
		ammo={ name="Knobkierrie",},
		head={ name="Peltast's Mezail +3",},
		body={ name="Peltast's Plackart +3",},
		hands={ name="Ptero. Fin. G. +4",},
		legs={ name="Nyame Flanchard",},
		feet={ name="Nyame Sollerets",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Moonshade Earring",},
		ear2={ name="Pel. Earring +1",},
		ring1={ name="Sroda Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_STRWSD,
		} )
		
	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {
		ammo={ name="Knobkierrie",},
		head={ name="Peltast's Mezail +3",},
		body={ name="Peltast's Plackart +3",},
		hands={ name="Ptero. Fin. G. +4",},
		legs={ name="Nyame Flanchard",},
		feet={ name="Nyame Sollerets",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Moonshade Earring",},
		ear2={ name="Pel. Earring +1",},
		ring1={ name="Sroda Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_STRWSD,
		} )
		
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {}

	-- Idle sets
	sets.idle = {
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Peltast's Mezail +3",},
		body={ name="Sacro Breastplate",},
		hands={ name="Pel. Vambraces +3",},
		legs={ name="Ptero. Brais +4",},
		feet={ name="Ptero. Greaves +4",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Plat. Mog. Belt",},
		ear1={ name="Alabaster Earring",},
		ear2={ name="Eabani Earring",},
		ring1={ name="Murky Ring",},
		ring2={ name="Shneddick Ring",},
		back=gear.brig_VITREGEN,
	}

	sets.idle.Refresh = {
		body={ name="Chozor. Coslete",},
	}

	sets.idle.Weak = set_combine(sets.idle, {
		head={ name="Twilight Helm",},
		body={ name="Twilight Mail",},
	} )
		
	sets.idle.Reraise = set_combine(sets.idle, {
		head={ name="Twilight Helm",},
		body={ name="Twilight Mail",},
	} )
	
	sets.idle.PetRegen = set_combine(sets.idle, {
		back=gear.brig_VITREGEN
	})
	
	-- Defense sets
	sets.defense.PDT = {
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Hjarrandi helm",},
		body={ name="Adamantite Armor",},
		hands={ name="Nyame Gauntlets",},
		legs={ name="Nyame Flanchard",},
		feet={ name="Nyame Sollerets",},
		neck={ name="Loricate Torque +1",},
		waist={ name="Plat. Mog. Belt",},
		ear1={ name="Genmei Earring",},
		ear2={ name="Telos Earring",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Murky Ring",},
		back={ name="Repulse Mantle",},
	}
		
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {
		head={ name="Twilight Helm",},
		body={ name="Twilight Mail",},
	}
	)

	sets.defense.MDT = {
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Loess Barbuta +1",},
		body={ name="Adamantite Armor",},
		hands={ name="Sulev. Gauntlets +2",},
		neck={ name="Warder's Charm +1",},
		waist={ name="Plat. Mog. Belt",},
		legs={ name="Arke Cosc. +1",},
		feet={ name="Amm Greaves",},
		ear1={ name="Genmei Earring",},
		ear2={ name="Ethereal Earring",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Murky Ring",},
		back={ name="Moonlight Cape",},
	}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {
		head={ name="Twilight Helm",},
		body={ name="Twilight Mail",},
	} )
		
	sets.defense.MEVA = {		
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Nyame Helm",},
		body={ name="Nyame Mail",},
		hands={ name="Nyame Gauntlets",},
		legs={ name="Nyame Flanchard",},
		feet={ name="Nyame Sollerets",},
		neck={ name="Warder's Charm +1",},
		waist={ name="Plat. Mog. Belt",},
		ring1={ name="Petrov Ring",},
		ring2={ name="Niqmaddu Ring",},
		ear1={ name="Odnowa Earring +1",},
		ear2={ name="Etiolation Earring",},
	}

	sets.Kiting = {
		ring2={ name="Shneddick Ring",},
	}

	
	sets.Reraise = {
		head={ name="Twilight Helm",},
		body={ name="Twilight Mail",},
	}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {
		head={ name="Frenzy Sallet",},
	}
	
    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.passive.MP = {
		ear2={ name="Ethereal Earring",},
		waist={ name="Flume Belt +1",},
	}
    sets.passive.Twilight = {
		head={ name="Twilight Helm",},
		body={ name="Twilight Mail",},
	}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {
		head=gear.valorous_TH_head,
		hands=gear.valorous_TH_hands,
		legs=gear.valorous_TH_legs,
		feet=gear.valorous_TH_feet,
		waist={ name="Chaac Belt",},
	} )
	
	-- Weapons sets
	sets.weapons.Trishula = {
		main={ name="Trishula",priority=1,},
		sub={ name="Utu Grip",},
	}
	sets.weapons.Shining = {
		main={ name="Shining One",priority=1,},
		sub={ name="Utu Grip",},
	}
		sets.weapons.GaeBuide = {
		main={ name="Gae Buide",priority=1,},
		sub={ name="Utu Grip",},
	}
	sets.weapons.Naegling = {
		main={ name="Naegling",},
	}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {
		ear1={ name="Telos Earring",},
		ear2={ name="Sherida Earring",},
	}
	sets.AccMaxTP = {
		ear1={ name="Telos Earring",},
		ear2={ name="Mache Earring +1",},
	}
	sets.AccDayMaxTPWSEars = {
		ear1={ name="Telos Earring",},
		ear2={ name="Mache Earring +1",},
	}
	sets.DayMaxTPWSEars = {
		ear1={ name="Telos Earring",},
		ear2={ name="Sherida Earring",},
	}
	sets.AccDayWSEars = {
		ear1={ name="Telos Earring",},
		ear2={ name="Mache Earring +1",},
	}
	sets.DayWSEars = {
		ear1={ name="Moonshade Earring",},
		ear2={ name="Sherida Earring",},
	}
	
	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group

	sets.engaged = {
		sub={ name="Utu Grip",},
		ammo={ name="Coiste Bodhar",},
		head={ name="Hjarrandi Helm",},
		body={ name="Pelt. Plackart +3",},
		hands={ name="Pel. Vambraces +3",},
		legs={ name="Grace Haidate",},
		feet={ name="Pelt. Schyn. +3",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Ioskeha belt +1",},
		ear1={ name="Telos Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_DEXDA,
	}
    sets.engaged.SomeAcc = {
		sub={ name="Utu Grip",},
		ammo={ name="Coiste Bodhar",},
		head={ name="Hjarrandi Helm",},
		body={ name="Pelt. Plackart +3",},
		hands={ name="Pel. Vambraces +3",},
		legs={ name="Grace Haidate",},
		feet={ name="Pelt. Schyn. +3",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Ioskeha belt +1",},
		ear1={ name="Telos Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_DEXDA,
	}
	sets.engaged.Acc = {
		sub={ name="Utu Grip",},
		ammo={ name="Coiste Bodhar",},
		head={ name="Hjarrandi Helm",},
		body={ name="Pelt. Plackart +3",},
		hands={ name="Pel. Vambraces +3",},
		legs={ name="Grace Haidate",},
		feet={ name="Pelt. Schyn. +3",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Ioskeha belt +1",},
		ear1={ name="Telos Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_DEXDA,
	}
    sets.engaged.FullAcc = {
		sub={ name="Utu Grip",},
		ammo={ name="Coiste Bodhar",},
		head={ name="Hjarrandi Helm",},
		body={ name="Pelt. Plackart +3",},
		hands={ name="Pel. Vambraces +3",},
		legs={ name="Grace Haidate",},
		feet={ name="Pelt. Schyn. +3",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Ioskeha belt +1",},
		ear1={ name="Telos Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_DEXDA,
	}
	
	sets.engaged.Tank = set_combine(sets.engaged, {
		sub={ name="Utu Grip",},
		ammo={ name="Coiste Bodhar",},
		head={ name="Hjarrandi Helm",},
		body={ name="Pelt. Plackart +3",},
		hands={ name="Pel. Vambraces +3",},
		legs={ name="Grace Haidate",},
		feet={ name="Pelt. Schyn. +3",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Ioskeha belt +1",},
		ear1={ name="Telos Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Murky Ring",},
		back=gear.brig_DEXDA,
	} )
	
	sets.engaged.Wyvern = set_combine(sets.engaged, {
		ear1={ name="Sroda Earring",},
	} )
    sets.engaged.Wyvern.SomeAcc = set_combine(sets.engaged.SomeAcc, {
		ear1={ name="Sroda Earring",},
	} )
	sets.engaged.Wyvern.Acc = set_combine(sets.engaged.Acc, {
		ear1={ name="Sroda Earring",},
	} )
    sets.engaged.Wyvern.FullAcc = set_combine(sets.engaged.FullAcc, {
		ear1={ name="Sroda Earring",},
	} )

    sets.engaged.AM = {}
    sets.engaged.AM.SomeAcc = {}
	sets.engaged.AM.Acc = {}
    sets.engaged.AM.FullAcc = {}
    -- sets.engaged.AM.Fodder = {}
	
    sets.engaged.PDT = {
		ammo={ name="Coiste Bodhar",},
		head={ name="Hjarrandi Helm",},
		body={ name="Pelt. Plackart +3",},
		hands={ name="Pel. Vambraces +3",},
		legs={ name="Grace Haidate",},
		feet={ name="Pelt. Schyn. +3",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Ioskeha belt +1",},
		ear1={ name="Sroda Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_DEXDA,
	}
    sets.engaged.SomeAcc.PDT = {
		ammo={ name="Coiste Bodhar",},
		head={ name="Hjarrandi Helm",},
		body={ name="Pelt. Plackart +3",},
		hands={ name="Pel. Vambraces +3",},
		legs={ name="Grace Haidate",},
		feet={ name="Pelt. Schyn. +3",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Ioskeha belt +1",},
		ear1={ name="Sroda Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_DEXDA,
	}
	sets.engaged.Acc.PDT = {
		ammo={ name="Coiste Bodhar",},
		head={ name="Hjarrandi Helm",},
		body={ name="Pelt. Plackart +3",},
		hands={ name="Pel. Vambraces +3",},
		legs={ name="Grace Haidate",},
		feet={ name="Pelt. Schyn. +3",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Ioskeha belt +1",},
		ear1={ name="Sroda Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_DEXDA,
	}
    sets.engaged.FullAcc.PDT = {
		ammo={ name="Coiste Bodhar",},
		head={ name="Hjarrandi Helm",},
		body={ name="Pelt. Plackart +3",},
		hands={ name="Pel. Vambraces +3",},
		legs={ name="Grace Haidate",},
		feet={ name="Pelt. Schyn. +3",},
		neck={ name="Dgn. Collar +2",},
		waist={ name="Ioskeha belt +1",},
		ear1={ name="Sroda Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.brig_DEXDA,
	}
    --sets.engaged.Fodder.PDT = {}
	
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

-------------------------------------------------------------------------------------------------------------------
-- DRG overrides: paste at the bottom of your Charactername_DRG_Gear.lua
-- These redefine functions from DRG.lua, so updates to DRG.lua won't wipe your fixes.
-------------------------------------------------------------------------------------------------------------------

-- Look up recast IDs from Windower's resources instead of hard-coding them.
local function recast_id(name)
	local ability = res.job_abilities:with('en', name)
	return ability and ability.recast_id
end

local RECAST = {
	Sekkanoki        = recast_id('Sekkanoki'),
	Meditate         = recast_id('Meditate'),
	SpiritBond       = recast_id('Spirit Bond'),
	RestoringBreath  = recast_id('Restoring Breath'),
	Hasso            = recast_id('Hasso'),
	Seigan           = recast_id('Seigan'),
	Jump             = recast_id('Jump'),
	HighJump         = recast_id('High Jump'),
	SpiritJump       = recast_id('Spirit Jump'),
	SoulJump         = recast_id('Soul Jump'),
	SpiritLink       = recast_id('Spirit Link'),
	CallWyvern       = recast_id('Call Wyvern'),
	LastResort       = recast_id('Last Resort'),
	Berserk          = recast_id('Berserk'),
	Aggressor        = recast_id('Aggressor'),
}

-- True if the ability exists and is off cooldown.
local function ready(recasts, key)
	local id = RECAST[key]
	return id ~= nil and recasts[id] ~= nil and recasts[id] < latency
end

function job_precast(spell, spellMap, eventArgs)
	if spell.type == 'WeaponSkill' and state.AutoBuffMode.value ~= 'Off' then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if player.sub_job == 'SAM' and player.tp > 1850 and ready(abil_recasts, 'Sekkanoki') then
			eventArgs.cancel = true
			windower.chat.input('/ja "Sekkanoki" <me>')
			windower.chat.input:schedule(1, '/ws "'..spell.english..'" '..spell.target.raw)
			tickdelay = os.clock() + 1.25
			return
		elseif player.sub_job == 'SAM' and ready(abil_recasts, 'Meditate') then
			eventArgs.cancel = true
			windower.chat.input('/ja "Meditate" <me>')
			windower.chat.input:schedule(1, '/ws "'..spell.english..'" '..spell.target.raw)
			tickdelay = os.clock() + 1.25
			return
		end
	elseif spell.action_type == 'Ability' then
		if spell.english == 'Restoring Breath' and state.AutoBondMode.value then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			-- FIX: was checking Meditate's recast (134) instead of Spirit Bond's
			if pet.isvalid and pet.hpp < 75 and ready(abil_recasts, 'SpiritBond')
			and ready(abil_recasts, 'RestoringBreath') and spell.target.hpp > 44 then
				eventArgs.cancel = true
				windower.chat.input('/ja "Spirit Bond" <me>')
				windower.chat.input:schedule(1, '/ja "Restoring Breath" '..spell.target.raw)
			end
		end
	end
end

function job_post_precast(spell, spellMap, eventArgs)
	if spell.type == 'WeaponSkill' then
		local WSset = standardize_set(get_precast_set(spell, spellMap))
		local wsacc = check_ws_acc()

		if (WSset.ear1 == "Moonshade Earring" or WSset.ear2 == "Moonshade Earring") then
			-- Replace Moonshade Earring if we're at cap TP
			if get_effective_player_tp(spell, WSset) > 3200 then
				if wsacc:contains('Acc') and not buffactive['Sneak Attack'] and sets.AccMaxTP then
					equip(sets.AccMaxTP[spell.english] or sets.AccMaxTP)
				elseif sets.MaxTP then
					equip(sets.MaxTP[spell.english] or sets.MaxTP)
				end
			end
		end
	elseif spell.type == 'JobAbility' then
		if spell.english:endswith('Jump') and sets.precast.JA[spell.english]
		and sets.precast.JA[spell.english][state.OffenseMode.value] then
			equip(sets.precast.JA[spell.english][state.OffenseMode.value])
		end
	end
end

function job_post_midcast(spell, spellMap, eventArgs)
	if spell.action_type == 'Magic' and player.hpp > 25 and player.hpp < Breath_HPP and pet.isvalid then
		equip(sets.midcast.HB_Trigger)
	end
end

function job_aftercast(spell, spellMap, eventArgs)
	-- FIX: skip breath gear on interrupted casts, match post_midcast's HP floor, drop Steady Wing
	if pet.isvalid and not spell.interrupted then
		if (spell.action_type == 'Magic' and player.hpp > 25 and player.hpp < Breath_HPP)
		or spell.english == 'Restoring Breath' then
			petWillAct = os.clock()
			equip(sets.HealingBreath)
			eventArgs.handled = true
		elseif spell.english == 'Smiting Breath' and sets.SmitingBreath then
			petWillAct = os.clock()
			equip(sets.SmitingBreath)
			eventArgs.handled = true
		end
	end
end

-- FIX: refresh melee groups when the wyvern appears or disappears
function job_pet_changes(pet, gain)
	update_melee_groups()
	if not midaction() then
		handle_equipping_gear(player.status)
	end
end

function job_update(cmdParams, eventArgs)
	update_melee_groups()
	find_breath_hpp()

	if player.sub_job ~= 'SAM' and state.Stance.value ~= "None" then
		state.Stance:set("None")
	end
end

function update_melee_groups()
	classes.CustomMeleeGroups:clear()

	if data.areas.adoulin:contains(world.area) and buffactive.Ionis then
		classes.CustomMeleeGroups:append('Adoulin')
	end

	if player.equipment.main == "Ryunohige" and state.Buff['Aftermath: Lv.3'] then
		classes.CustomMeleeGroups:append('AM')
	end

	if state.Buff['Spirit Surge'] then
		classes.CustomMeleeGroups:append('SpiritSurge')
	end

	-- FIX: moved here from job_update so buff changes don't wipe it
	if pet.isvalid then
		classes.CustomMeleeGroups:append('Wyvern')
	end
end

-- FIX: call the wyvern before spending jumps
function job_tick()
	if check_wyvern() then return true end
	if check_hasso() then return true end
	if check_jump() then return true end
	if check_buff() then return true end
	return false
end

function check_wyvern()
	if state.AutoBuffMode.value ~= 'Off' and player.in_combat and not pet.isvalid then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if ready(abil_recasts, 'CallWyvern') then
			windower.chat.input('/ja "Call Wyvern" <me>')
			tickdelay = os.clock() + 1.1
			return true
		end
	end
	return false
end

function check_hasso()
	if not (state.Stance.value == 'None' or state.Buff.Hasso or state.Buff.Seigan)
	and player.sub_job == 'SAM' and player.status == 'Engaged' then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if state.Stance.value == 'Hasso' and ready(abil_recasts, 'Hasso') then
			windower.chat.input('/ja "Hasso" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif state.Stance.value == 'Seigan' and ready(abil_recasts, 'Seigan') then
			windower.chat.input('/ja "Seigan" <me>')
			tickdelay = os.clock() + 1.1
			return true
		end
	end
	return false
end

function check_jump()
	-- FIX: skip while Amnesia'd, always return a boolean
	if state.AutoJumpMode.value and player.status == 'Engaged' and player.tp < 501
	and not buffactive.amnesia then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		local jumps = {
			{'SpiritJump', '/ja "Spirit Jump" <t>'},
			{'SoulJump',   '/ja "Soul Jump" <t>'},
			{'Jump',       '/ja "Jump" <t>'},
			{'HighJump',   '/ja "High Jump" <t>'},
		}
		for _, j in ipairs(jumps) do
			if ready(abil_recasts, j[1]) then
				windower.chat.input(j[2])
				tickdelay = os.clock() + 1.1
				return true
			end
		end
		if pet.isvalid and pet.tp > 350 and ready(abil_recasts, 'SpiritLink') then
			windower.chat.input('/ja "Spirit Link" <me>')
			tickdelay = os.clock() + 1.1
			return true
		end
	end
	return false
end

function check_buff()
	if state.AutoBuffMode.value ~= 'Off' and player.in_combat and not buffactive.amnesia then
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if player.sub_job == 'DRK' and not buffactive['Last Resort'] and ready(abil_recasts, 'LastResort') then
			windower.chat.input('/ja "Last Resort" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif player.sub_job == 'WAR' and not buffactive.Berserk and ready(abil_recasts, 'Berserk') then
			windower.chat.input('/ja "Berserk" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif player.sub_job == 'WAR' and not buffactive.Aggressor and ready(abil_recasts, 'Aggressor') then
			windower.chat.input('/ja "Aggressor" <me>')
			tickdelay = os.clock() + 1.1
			return true
		end
	end
	return false
end

-- FIX: handles nil heads and augmented {name=...} tables, resets on other subjobs
local function hb_head_bonus()
	local head = sets.midcast.HB_Trigger and sets.midcast.HB_Trigger.head
	if type(head) == 'table' then head = head.name end
	return type(head) == 'string' and (head:contains('Vishap') or head:contains('Drachen'))
end

function find_breath_hpp()
	if S{'WHM','BLM','RDM','SMN','BLU','SCH','GEO'}:contains(player.sub_job) then
		Breath_HPP = hb_head_bonus() and 65 or 45
	elseif S{'PLD','DRK','BRD','NIN','RUN'}:contains(player.sub_job) then
		Breath_HPP = hb_head_bonus() and 45 or 35
	else
		Breath_HPP = 60
	end
end