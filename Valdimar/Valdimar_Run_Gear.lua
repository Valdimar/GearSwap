function user_job_setup()

	state.OffenseMode:options('Normal','Acc','FullAcc')
	state.HybridMode:options('Tank','Parry','DTLite')
	state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','HighAcc','FullAcc')
	state.CastingMode:options('Normal','SIRD')
	state.PhysicalDefenseMode:options('PDT_HP','PDT')
	state.MagicalDefenseMode:options('MDT_HP','BDT_HP','MDT','BDT')
	state.ResistDefenseMode:options('MEVA_HP','MEVA','Death','Charm','DTCharm')
	state.IdleMode:options('None','Refresh')
	state.Weapons:options('Epeolatry','Lionheart','LoxoticMace','Dolichenus')
	-- state.ZoneTanking:options('Normal','Dynamis')
	
	state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP'}

	-- Additional local binds
	-- CTRL  = ^
	-- ALT   = !
	-- WIN   = @
	
	send_command('bind !` input /ja "Vivacious Pulse" <me>')
	send_command('bind @` gs c cycle RuneElement')
	send_command('bind ^` gs c RuneElement')
	
	send_command('bind @pause gs c toggle AutoRuneMode')
		
	send_command('bind ^\\\\ input /ma "Phalanx" <me>')
	send_command('bind @\\\\ input /ma "Aquaveil" <me>')
	send_command('bind !\\\\ input /ma "Crusade" <me>')
	send_command('bind !t input /ma "Regen IV" <st>')
	send_command('bind @t input /ma "Refresh" <st>')
	send_command('bind ^!\\\\ input /ma "Temper" <me>')
		
	send_command('bind @f8 gs c toggle AutoTankMode')
	send_command('bind @f10 gs c toggle TankAutoDefense')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	
	send_command('bind !r gs c cycle Weapons;gs c update')
	send_command('bind !m gs c cycle IdleMode') --Changes your idle mode options such as refresh.
	
	send_command('bind !w input /equip ring1 "Warp Ring";')
	send_command('bind !q input /equip ring1 "Dim. Ring (Holla)";')
	
	select_default_macro_book()
end

function init_gear_sets()

	sets.AF = {
		head={ name="Runeist Bandeau +4",},
		body={ name="Runeist Coat +4",},
		hands={ name="Rune. Mitons +4",},
		legs={ name="Rune. Trousers +3",},
		feet={ name="Runeist Bottles +3",},
	}
	sets.Relic = {
		head={ name="Fu. Bandeau +4",},
		body={ name="Futhark Coat +3",},
		hands={ name="Futhark Mitons +3",},
		legs={ name="Futh. Trousers +4",},
		feet={ name="Futhark Boots +3",},
	}
	sets.Empy = {
		head={ name="Erilaz Galea +3",},
		body={ name="Erilaz Surcoat +3",},
		hands={ name="Erilaz Gauntlets +3",},
		legs={ name="Eri. Leg Guards +3",},
		feet={ name="Erilaz Greaves +3",},
	}

    sets.Enmity = {
		ammo={ name="Aqreqaq Bomblet",},
		head={ name="Rabid Visor",},
		body={ name="Emet Harness +1",},
		hands={ name="Kurys Gloves",},
		legs={ name="Eri. Leg Guards +3",},
		feet={ name="Erilaz Greaves +3",},
		neck={ name="Moonlight Necklace",},
		waist={ name="Kasiri Belt",},
		ear1={ name="Cryptic Earring",},
		ring1={ name="Begrudging Ring",},
		ring2={ name="Pernicious Ring",},
		back=gear.Ogma_EM_SIRD,
	}
		 
    sets.Enmity.SIRD = {
		ammo={ name="Staunch Tathlum +1",},
        head={ name="Fu. Bandeau +4",},
		neck={ name="Unmoving Collar +1",},
		body={ name="Emet Harness +1",},
		hands={ name="Kurys Gloves",},
		waist={ name="Audumbla Sash",},
		legs={ name="Eri. Leg Guards +3",},
		feet={ name="Erilaz Greaves +3",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Murky Ring",},
		ear1={ name="Genmei Earring",},
		ear2={ name="Trux Earring",},
		back=gear.Ogma_EM_SIRD,
	}
		
    sets.Enmity.SIRDT = {
		ammo={ name="Staunch Tathlum +1",},
        head={ name="Fu. Bandeau +4",},
		body={ name="Adamantite Armor",},
		hands={ name="Kurys Gloves",},
		legs={ name="Eri. Leg Guards +3",},
		feet={ name="Erilaz Greaves +3",},
		neck={ name="Unmoving Collar +1",},
		waist={ name="Audumbla Sash",},
		ear1={ name="Tuisto Earring",},
		ear2={ name="Odnowa Earring +1",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Murky Ring",},
		back=gear.Ogma_EM_SIRD,
	}

    sets.Enmity.DT = {
		ammo={ name="Staunch Tathlum +1",},
        head={ name="Fu. Bandeau +4",},
		neck={ name="Unmoving Collar +1",},
		ear1={ name="Tuisto Earring",},
		ear2={ name="Odnowa Earring +1",},
		body={ name="Adamantite Armor",},
		hands={ name="Kurys Gloves",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Murky Ring",},
		waist={ name="Flume Belt +1",},
		legs={ name="Eri. Leg Guards +3",},
		feet={ name="Erilaz Greaves +3",},
		back=gear.Ogma_EM_SIRD,
	}
		
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Item sets.

	-- Precast sets to enhance JAs
	sets.precast.JA['Vallation'] = set_combine(sets.Enmity, { 
		body={ name="Runeist Coat +4",},
		legs={ name="Futhark Trousers +4",},
	}
	)
	
    sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
	
    sets.precast.JA['Pflug'] = set_combine(sets.Enmity, {
		feet={ name="Runeist Bottes +3",},
	}
	)
	
    sets.precast.JA['Battuta'] = set_combine(sets.Enmity, {
		head={ name="Fu. Bandeau +4",},
	}
	)
	
    sets.precast.JA['Liement'] = set_combine(sets.Enmity, {
		body={ name="Futhark Coat +3",},
	}
	)
    sets.precast.JA['Gambit'] = set_combine(sets.Enmity, {
		hands={ name="Runeist Mitons +4",},
	}
	)
	
    sets.precast.JA['Rayke'] = set_combine(sets.Enmity, {
		feet={ name="Futhark Boots +3",},
	}
	)
	
    sets.precast.JA['Elemental Sforzo'] = {
		body={ name="Futhark Coat +3",},
	}
	
    sets.precast.JA['Swordplay'] = set_combine(sets.Enmity, {
		hands={ name="Futhark Mitons +3",},
	}
	)
	
    sets.precast.JA['Embolden'] = {
		back=gear.Evasion_Cape,
	}
	
    sets.precast.JA['One For All'] = set_combine(sets.Enmity, {
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Runeist Bandeau +4",},
		body={ name="Runeist Coat +4",},
		hands={ name="Regal Gauntlets",},
		legs={ name="Futh. Trousers +4",},
		feet={ name="Turms Leggings +1",},
		neck={ name="Sanctity Necklace",},
		ear1={ name="Enchntr. Earring +1",},
		ear2={ name="Handler's Earring +1",},
		ring1={ name="Valseur's Ring",},
		ring2={ name="Murky Ring",},
		back=gear.Ogma_EM_SIRD,
	} )
	
	sets.precast.JA['Last Resort'] = sets.Enmity
	
	sets.precast.JA['Souleater'] = sets.Enmity
	
	sets.precast.JA['Arcane Circle'] = sets.Enmity
	
	sets.precast.JA['Weapon Bash'] = sets.Enmity
	
    sets.precast.JA['Provoke'] = sets.Enmity
	
	sets.precast.JA['Warcry'] = sets.Enmity
	
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Last Resort'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    sets.precast.JA['Lunge'] = {
		ammo={ name="Pemphredo Tathlum",},
		head={ name="Agwu's Cap",},
		body={ name="Agwu's Robe",},
		hands={ name="Agwu's Gages",},
		legs={ name="Agwu's Slops",},
		feet={ name="Agwu's Pigaches",},
		neck={ name="Sanctity Necklace",},
		waist={ name="Eschan Stone",},
		ear1={ name="Friomisi Earring",},
		ear2={ name="Static Earring",},
		ring1={ name="Mujin Band",},
		ring2={ name="Locus Ring",},
		back={ name="Evasionist's Cape",},
	}

	sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']

	-- Gear for specific elemental nukes.
	sets.element.Dark = {
		head={ name="Pixie Hairpin +1",},
		ring2={ name="Archon Ring",},
	}

	-- Pulse sets, different stats for different rune modes, stat aligned.
    sets.precast.JA['Vivacious Pulse'] = {
		head={ name="Erilaz Galea +3",},
		legs={ name="Rune. Trousers +3",},
		waist={ name="Bishop's Sash",},
		back={ name="Altruistic Cape",},
		ear1={ name="Saxnot Earring",},
	}

    sets.precast.JA['Vivacious Pulse']['Ignis'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Gelus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Flabra'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tellus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Sulpor'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Unda'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Lux'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tenebrae'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	
	
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
		ammo={ name="Yamarang",},
        head=gear.CarmineMArk_FC,
		neck={ name="Unmoving Collar +1",},
		ear1={ name="Enchntr. Earring +1",},
		ear2={ name="Handler's Earring +1",},
        body=gear.herculean_waltz_body,
		hands=gear.herculean_waltz_hands,
		ring1={ name="Valseur's Ring",},
		ring2={ name="Murky Ring",},
        back={ name="Moonlight Cape",},
		waist={ name="Chaac Belt",},
		legs={ name="Dashing Subligar",},
		feet=gear.herculean_waltz_feet
	}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
	
    sets.precast.Step = {}
		
	sets.precast.JA['Violent Flourish'] = {}
		
	-- Fast cast sets for spells
    sets.precast.FC = {
		ammo={ name="Impatiens",},
		head={ name="Rune. Bandeau +4",},
		neck={ name="Futhark Torque +2",},
		body={ name="Erilaz Surcoat +3",},
		hands=gear.herculean_FCPhal_hands,
		waist={ name="Audumbla Sash",},
		legs={ name="Agwu's Slops",},
		feet={ name="Carmine Greaves +1",},
		ring1={ name="Kishar Ring",},
		ring2={ name="Murky Ring",},
		ear1={ name="Etiolation Earring",},
		ear2={ name="Odnowa Earring +1",},
		back=gear.Ogma_CASTEVADE,
	}
			
	sets.precast.FC.DT = {
		ammo={ name="Impatiens",},
        head={ name="Rune. Bandeau +4",},
		neck={ name="Loricate Torque +1",},
        body={ name="Runeist Coat +4",},
		hands={ name="Leyline Gloves",},
		waist={ name="Audumbla Sash",},
		legs={ name="Eri. Leg Guards +3",},
		feet={ name="Carmine Greaves +1",},
		ring1={ name="Kishar Ring",},
		ring2={ name="Murky Ring",},
		ear1={ name="Etiolation Earring",},
		ear2={ name="Odnowa Earring +1",},
        back={ name="Moonlight Cape",},
	}
		
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
		waist={ name="Siegel Sash",},
		legs={ name="Futhark Trousers +4",},
	} )
	sets.precast.FC['Phalanx'] = set_combine(sets.precast.FC, {
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Fu. Bandeau +4",},
		body=gear.herculean_phalanx_body,
		hands=gear.herculean_FCPhal_hands,
		legs=gear.Taeon_phalanx_legs,
		feet=gear.Taeon_phalanx_feet,
		waist={ name="Olympus Sash",},
		ear1={ name="Alabaster Earring",},
		ear2={ name="Odnowa Earring +1",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Murky Ring",},
		back=gear.Ogma_CASTEVADE,
	} 	)
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
		neck={ name="Magoraga Beads",},
	} )
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	-- Weaponskill sets
	sets.precast.WS = {
		ammo={ name="Knobkierrie",},
		head={ name="Halitus Helm",},
		body={ name="Ashera Harness",},
		hands={ name="Kurys Gloves",},
		legs={ name="Eri. Leg Guards +3",},
		feet={ name="Erilaz Greaves +3",},
		neck={ name="Anu Torque",},
		waist={ name="Kasiri Belt",},
		ear1={ name="Tuisto Earring",},
		ear2={ name="Odnowa Earring +1",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Moonbeam Ring",},
		back=gear.Ogma_STRDA,
	}
	
	sets.precast.WS.SomeAcc = {
		ammo={ name="Voluspa Tathlum",},
        head={ name="Adhemar Bonnet +1",},
		neck={ name="Fotia Gorget",},
		ear1={ name="Moonshade Earring",},
		ear2={ name="Sherida Earring",},
        body={ name="Ayanmo Corazza +2",},
		hands={ name="Meg. Gloves +2",},
		ring1={ name="Niqmaddu Ring",},
		ring2={ name="Regal Ring",},
        back=gear.Ogma_STRDA,
		waist={ name="Fotia Belt",},
		legs={ name="Meg. Chausses +2",},
		feet=gear.herculean_TA_feet,
	}
	sets.precast.WS.Acc = {
		ammo={ name="Voluspa Tathlum",},
		head={ name="Dampening Tam",},
		neck={ name="Fotia Gorget",},
		ear1={ name="Moonshade Earring",},
		ear2={ name="Sherida Earring",},
		body={ name="Ayanmo Corazza +2",},
		hands={ name="Meg. Gloves +2",},
		ring1={ name="Niqmaddu Ring",},
		ring2={ name="Regal Ring",},
		back=gear.Ogma_STRDA,
		waist={ name="Fotia Belt",},
		legs={ name="Meg. Chausses +2",},
		feet=gear.herculean_TA_feet
	}
	sets.precast.WS.HighAcc = {
		ammo={ name="C. Palug Stone",},
		head={ name="Meghanada Visor +2",},
		neck={ name="Fotia Gorget",},
		ear1={ name="Telos Earring",},
		ear2={ name="Sherida Earring",},
		body={ name="Ayanmo Corazza +2",},
		hands={ name="Meg. Gloves +2",},
		ring1={ name="Niqmaddu Ring",},
		ring2={ name="Regal Ring",},
		back=gear.Ogma_STRDA,
		waist={ name="Fotia Belt",},
		legs={ name="Meg. Chausses +2",},
		feet=gear.herculean_acc_feet
	}
	sets.precast.WS.FullAcc = {
		ammo={ name="C. Palug Stone",},
		head=gear.CarmineMArk_FC,
		neck={ name="Combatant's Torque",},
		ear1={ name="Telos Earring",},
		ear2={ name="Mache Earring +1",},
		body={ name="Meg. Cuirie +2",},
		hands={ name="Meg. Gloves +2",},
		ring1={ name="Ramuh Ring +1",},
		ring2={ name="Ramuh Ring +1",},
		back=gear.stp_jse_back,
		waist={ name="Fotia Belt",},
		legs={ name="Meg. Chausses +2",},
		feet=gear.herculean_acc_feet
	}

    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS,{
		ammo={ name="Aurgelmir Orb",},
		head={ name="Adhemar Bonnet +1",},
		body={ name="Ashera Harness",},
		hands={ name="Adhemar Wrist. +1",},
		legs={ name="Nyame Flanchard",},
		feet=gear.herculean_TA_feet,
		neck={ name="Anu Torque",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Moonshade Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Regal Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.Ogma_STRDA,
	} )
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS,{
		ammo={ name="Aurgelmir Orb",},
		head={ name="Adhemar Bonnet +1",},
		body={ name="Ashera Harness",},
		hands={ name="Adhemar Wrist. +1",},
		legs={ name="Nyame Flanchard",},
		feet=gear.herculean_TA_feet,
		neck={ name="Anu Torque",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Moonshade Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Regal Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.Ogma_STRDA,
	} )
    sets.precast.WS['Resolution'].HighAcc = set_combine(sets.precast.WS,{
		ammo={ name="Aurgelmir Orb",},
		head={ name="Adhemar Bonnet +1",},
		body={ name="Ashera Harness",},
		hands={ name="Adhemar Wrist. +1",},
		legs={ name="Nyame Flanchard",},
		feet=gear.herculean_TA_feet,
		neck={ name="Anu Torque",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Moonshade Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Regal Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.Ogma_STRDA,
	} )
	sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS,{
		ammo={ name="Aurgelmir Orb",},
		head={ name="Adhemar Bonnet +1",},
		body={ name="Ashera Harness",},
		hands={ name="Adhemar Wrist. +1",},
		legs={ name="Nyame Flanchard",},
		feet=gear.herculean_TA_feet,
		neck={ name="Anu Torque",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Moonshade Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Regal Ring",},
		ring2={ name="Niqmaddu Ring",},
		back=gear.Ogma_STRDA,
	} )

    sets.precast.WS['Dimidiation'] = set_combine(sets.precast.WS,{
		ammo={ name="Knobkierrie",},
		neck={ name="Anu Torque",},
		head={ name="Nyame Helm",},
		body={ name="Nyame Mail",},
		hands={ name="Nyame Gauntlets",},
		legs={ name="Nyame Flanchard",},
		feet={ name="Nyame Sollerets",},
		waist={ name="Kentarch Belt +1",},
		ear1={ name="Moonshade Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Regal Ring",},
		ring2={ name="Ilabrat Ring",},
		back=gear.Ogma_DEXWSD,
	} )
    sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS.Acc,{
		ammo={ name="Knobkierrie",},
		neck={ name="Anu Torque",},
		head={ name="Nyame Helm",},
		body={ name="Nyame Mail",},
		hands={ name="Nyame Gauntlets",},
		legs={ name="Nyame Flanchard",},
		feet={ name="Nyame Sollerets",},
		waist={ name="Kentarch Belt +1",},
		ear1={ name="Moonshade Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Regal Ring",},
		ring2={ name="Ilabrat Ring",},
		back=gear.Ogma_DEXWSD,
	} )
	sets.precast.WS['Dimidiation'].HighAcc = set_combine(sets.precast.WS.HighAcc,{
		ammo={ name="Knobkierrie",},
		neck={ name="Anu Torque",},
		head={ name="Nyame Helm",},
		body={ name="Nyame Mail",},
		hands={ name="Nyame Gauntlets",},
		legs={ name="Nyame Flanchard",},
		feet={ name="Nyame Sollerets",},
		waist={ name="Kentarch Belt +1",},
		ear1={ name="Moonshade Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Regal Ring",},
		ring2={ name="Ilabrat Ring",},
		back=gear.Ogma_DEXWSD,
	} )
	sets.precast.WS['Dimidiation'].FullAcc = set_combine(sets.precast.WS.FullAcc,{
		ammo={ name="Knobkierrie",},
		neck={ name="Anu Torque",},
		head={ name="Nyame Helm",},
		body={ name="Nyame Mail",},
		hands={ name="Nyame Gauntlets",},
		legs={ name="Nyame Flanchard",},
		feet={ name="Nyame Sollerets",},
		waist={ name="Kentarch Belt +1",},
		ear1={ name="Moonshade Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Regal Ring",},
		ring2={ name="Ilabrat Ring",},
		back=gear.Ogma_DEXWSD,
	} )
	
	--	head={ name="Nyame Helm",},
	--	body={ name="Nyame Mail",},
	--	hands={ name="Nyame Gauntlets",},
	--	legs={ name="Nyame Flanchard",},
	--	feet={ name="Nyame Sollerets",},
	
    sets.precast.WS['Ground Strike'] = set_combine(sets.precast.WS,{})
    sets.precast.WS['Ground Strike'].Acc = set_combine(sets.precast.WS.Acc,{})
	sets.precast.WS['Ground Strike'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Ground Strike'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})
		
    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {})
	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast['Lunge'], {})

	-- Ranged Sets
	sets.precast.RA = {
		range={ name="Halakaala",},
	}
	sets.midcast.RA = {
		range={ name="Halakaala",},
	}

	--------------------------------------
	-- Midcast sets
	--------------------------------------
	
    sets.midcast.FastRecast = {
		ammo={ name="Staunch Tathlum +1",},
        head={ name="Erilaz Galea +3",},
		neck={ name="Moonlight Necklace",},
		body={ name="Adamantite Armor",},
		hands={ name="Rawhide Gloves",},
		waist={ name="Audumbla Sash",},
		legs=gear.CarmineLegs_HP,
		feet={ name="Erilaz Greaves +3",},
		ear1={ name="Halasz Earring",},
		ear2={ name="Odnowa Earring +1",},
		ring1={ name="Gelatinous Ring +1",},
		ring2={ name="Murky Ring",},
		back=gear.Ogma_EM_SIRD,
	}
	sets.midcast.FastRecast.DT = {
		ammo={ name="Staunch Tathlum +1",},
        head={ name="Erilaz Galea +3",},
		neck={ name="Moonlight Necklace",},
		body={ name="Adamantite Armor",},
		hands={ name="Rawhide Gloves",},
		waist={ name="Audumbla Sash",},
		legs=gear.CarmineLegs_HP,
		feet={ name="Erilaz Greaves +3",},
		ear1={ name="Halasz Earring",},
		ear2={ name="Odnowa Earring +1",},
		ring1={ name="Gelatinous Ring +1",},
		ring2={ name="Murky Ring",},
		back=gear.Ogma_EM_SIRD,
	}
	sets.midcast.FastRecast.SIRD = {
		ammo={ name="Staunch Tathlum +1",},
        head={ name="Erilaz Galea +3",},
		neck={ name="Moonlight Necklace",},
		body={ name="Adamantite Armor",},
		hands={ name="Rawhide Gloves",},
		waist={ name="Audumbla Sash",},
		legs=gear.CarmineLegs_HP,
		feet={ name="Erilaz Greaves +3",},
		ear1={ name="Halasz Earring",},
		ear2={ name="Odnowa Earring +1",},
		ring1={ name="Gelatinous Ring +1",},
		ring2={ name="Murky Ring",},
		back=gear.Ogma_EM_SIRD,
	}
    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast,{
		head={ name="Erilaz Galea +3",},
		neck={ name="Incanter's Torque",},
		body={ name="Runeist Coat +4",},
		hands={ name="Runeist Mitons +4",},
		waist={ name="Olympus Sash",},
		ear1={ name="Andoaa Earring",},
		legs={ name="Futhark Trousers +4",},
		back={ name="Moonbeam Cape",},
	}
	)
    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Fu. Bandeau +4",},
		body=gear.herculean_phalanx_body,
		hands=gear.herculean_FCPhal_hands,
		legs=gear.Taeon_phalanx_legs,
		feet=gear.Taeon_phalanx_feet,
		waist={ name="Plat. Mog. Belt",},
		ear1={ name="Alabaster Earring",},
		ear2={ name="Odnowa Earring +1",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Murky Ring",},
		back=gear.Ogma_CASTEVADE,
	} 	)
    sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'],{
		neck={ name="Sacro Gorget",},
		head={ name="Rune. Bandeau +4",},
		hands={ name="Turms Mittens +1",},
		waist={ name="Sroda Belt",},
		legs={ name="Futhark Trousers +4",},
		ear2={ name="Erilaz Earring +1",},
	} ) 
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'],{
		head={ name="Erilaz Galea +3",},
		hands={ name="Regal Gauntlets",},
		legs={ name="Futhark Trousers +4",},
		waist={ name="Gishdubar Sash",},
	}
	) 
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		neck={ name="Incanter's torque",},
		hands={ name="Regal Gauntlets",},
		waist={ name="Siegel Sash",},
	}
	)

	sets.midcast.Flash = set_combine(sets.Enmity, {})
	sets.midcast.Flash.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast.Foil = set_combine(sets.Enmity, {})
	sets.midcast.Foil.DT = set_combine(sets.Enmity.DT, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast.Stun.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast.Jettatura = set_combine(sets.Enmity, {})
	sets.midcast.Jettatura.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'].DT = set_combine(sets.Enmity.SIRDT, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})

    sets.midcast.Cure = {
		ammo={ name="Staunch Tathlum +1",},
        head=gear.CarmineMask_FC,
		neck={ name="Sacro Gorget",},
        body={ name="Vrikodara Jupon",},
		hands={ name="Buremte Gloves",},
		waist={ name="Luminary Sash",},
		legs=gear.CarmineLegs_HP,
		feet={ name="Skaoi Boots",},
		ring1={ name="Lebeche Ring",},
		ring2={ name="Janniston Ring",},
		ear1={ name="Mendi. Earring",},
		ear2={ name="Roundel Earring",},
        back={ name="Tempered Cape +1",},
	}
		
	sets.midcast['Wild Carrot'] = set_combine(sets.midcast.Cure, {
	})
		
	sets.Self_Healing = {
		hands={ name="Buremte Gloves",},
		ring2={ name="Kunaji Ring",},
		waist={ name="Gishdubar Sash",},
	}
	sets.Cure_Received = {
		hands={ name="Buremte Gloves",},
		ring2={ name="Kunaji Ring",},
		waist={ name="Gishdubar Sash",},
	}
	sets.Self_Refresh = {
		head={ name="Erilaz Galea +3",},
		hands={ name="Regal Gauntlets",},
		legs={ name="Futhark Trousers +4",},
		waist={ name="Gishdubar Sash",},
	}
	sets.Phalanx_Received = {
		hands=gear.herculean_phalanx_hands,
		feet=gear.herculean_nuke_feet
	}
	
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {
		ring2={ name="Sheltered Ring",},
	} )
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {
		ring2={ name="Sheltered Ring",},
	} )

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	sets.resting = {}

    sets.idle = {
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Turms Cap +1",},
		body={ name="Adamantite Armor",},
		hands={ name="Erilaz Gauntlets +3",},
		legs={ name="Eri. Leg Guards +3",},
		feet={ name="Erilaz Greaves +3",},
		neck={ name="Warder's Charm +1",},
		waist={ name="Engraved Belt",},
		ear1={ name="Alabaster Earring",},
		ear2={ name="Eabani Earring",},
		ring1={ name="Shneddick Ring",},
		ring2={ name="Murky Ring",},
		back=gear.Ogma_EM_SIRD,
	}
	
	sets.idle.Refresh = set_combine(sets.idle, {
		ammo={ name="Homiliary",},
		body={ name="Runeist Coat +4",},
		hands={ name="Regal Gauntlets",},
		waist={ name="Fucho-no-obi",},
		ear1={ name="Tuisto Earring",},
	} )

	sets.Kiting = {
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Turms Cap +1",},
		body={ name="Runeist Coat +4",},
		hands={ name="Erilaz Gauntlets +3",},
		legs={ name="Eri. Leg Guards +3",},
		feet={ name="Erilaz Greaves +3",},
		neck={ name="Warder's Charm +1",},
		waist={ name="Engraved Belt",},
		ear1={ name="Alabaster Earring",},
		ear2={ name="Eabani Earring",},
		ring1={ name="Shneddick Ring",},
		ring2={ name="Murky Ring",},
		back=gear.Ogma_EM_SIRD,
	}
	
	sets.latent_refresh = {
		ammo={ name="Homiliary",},
		head={ name="Rawhide Mask",},
		hands={ name="Regal Gauntlets",},
		body={ name="Runeist Coat +4",},
		waist={ name="Fucho-no-obi",},
	}
	
	sets.idle.Weak = { }
	
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {}
    sets.MP = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Lionheart = {
		main={ name="Lionheart",},
	}
	sets.weapons.Epeolatry = {
		main={ name="Epeolatry",},
	}
	sets.weapons.Montante = {
		main={ name="Montante +1",},
	}
	sets.weapons.LoxoticMace = {
		main={ name="Loxotic Mace +1",},
	}
	sets.weapons.Dolichenus = {
		main={ name="Dolichenus",},
	}
	sets.weapons.Greataxe = {
		main={ name="Kaja Chopper",},
	}
		
	-- Defense Sets
	
	sets.defense.PDT = {
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Turms Cap +1",},
		body={ name="Runeist Coat +4",},
		hands={ name="Turms Mittens +1",},
		legs={ name="Eri. Leg Guards +3",},
		feet={ name="Turms Leggings +1",},
		neck={ name="Futhark torque +2",},
		waist={ name="Engraved Belt",},
		ear1={ name="Eabani Earring",},
		ear2={ name="Genmei Earring",},
		ring1={ name="Gelatinous Ring +1",},
		ring2={ name="Murky Ring",},
		back=gear.Ogma_Enmity,
	}
	sets.defense.PDT_HP = {
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Turms Cap +1",},
		body={ name="Runeist Coat +4",},
		hands={ name="Turms Mittens +1",},
		legs={ name="Eri. Leg Guards +3",},
		feet={ name="Turms Leggings +1",},
		neck={ name="Futhark torque +2",},
		waist={ name="Engraved Belt",},
		ear1={ name="Eabani Earring",},
		ear2={ name="Genmei Earring",},
		ring1={ name="Gelatinous Ring +1",},
		ring2={ name="Murky Ring",},
		back=gear.Ogma_Enmity,
	}
	sets.defense.MDT = {
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Aya. Zucchetto +1",},
		body={ name="Runeist Coat +4",},
		hands={ name="Aya. Manopolas +1",},
		legs={ name="Aya. Cosciales +2",},
		feet={ name="Aya. Gambieras +1",},
		neck={ name="Futhark torque +2",},
		waist={ name="Engraved Belt",},
		ear1={ name="Etiolation Earring",},
		ear2={ name="Odnowa Earring +1",},
		ring1={ name="Fortified Ring",},
		ring2={ name="Murky Ring",},
		back=gear.Ogma_Enmity,
	}
	sets.defense.MDT_HP = {
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Aya. Zucchetto +1",},
		body={ name="Runeist Coat +4",},
		hands={ name="Aya. Manopolas +1",},
		legs={ name="Aya. Cosciales +2",},
		feet={ name="Aya. Gambieras +1",},
		neck={ name="Futhark torque +2",},
		waist={ name="Engraved Belt",},
		ring1={ name="Fortified Ring",},
		ring2={ name="Murky Ring",},
		ear1={ name="Etiolation Earring",},
		ear2={ name="Odnowa Earring +1",},
		back=gear.Ogma_Enmity,
	}	
	sets.defense.BDT = {
		ammo={ name="Staunch Tathlum +1",},
        head={ name="Erilaz Galea +3",},
		neck={ name="Futhark torque +2",},
		body={ name="Runeist Coat +4",},
		hands=gear.herculean_dt_hands,
		waist={ name="Engraved Belt",},
		legs=gear.herculean_dt_legs,
		feet={ name="Erilaz Greaves +3",},
		ring1={ name="Shadow Ring",},
		ring2={ name="Murky Ring",},
		ear1={ name="Sanare Earring",},
		ear2={ name="Odnowa Earring +1",},
        back=gear.Ogma_Enmity,
	}
	sets.defense.BDT_HP = {
		ammo={ name="Staunch Tathlum +1",},
        head={ name="Erilaz Galea +3",},
		neck={ name="Futhark torque +2",},
		body={ name="Runeist Coat +4",},
		hands=gear.herculean_dt_hands,
		waist={ name="Engraved Belt",},
		legs={ name="Eri. Leg Guards +3",},
		feet={ name="Erilaz Greaves +3",},
		ring1={ name="Gelatinous Ring +1",},
		ring2={ name="Moonbeam Ring",},
		ear1={ name="Tuisto Earring",},
		ear2={ name="Odnowa Earring +1",},
        back=gear.Ogma_Enmity,
	}
	
	sets.defense.MEVA = {
		ammo={ name="Staunch Tathlum +1",},
        head={ name="Erilaz Galea +3",},
		neck={ name="Warder's Charm +1",},
		body={ name="Runeist Coat +4",},
		hands={ name="Erilaz Gauntlets +3",},
		waist={ name="Engraved Belt",},
		legs={ name="Rune. Trousers +3",},
		feet={ name="Erilaz Greaves +3",},
		ring1={ name="Purity Ring",},
		ring2={ name="Vengeful Ring",},
		ear1={ name="Sanare Earring",},
		ear2={ name="Odnowa Earring +1",},
        back=gear.Ogma_Enmity,
	}
	sets.defense.MEVA_HP = {
		ammo={ name="Staunch Tathlum +1",},
        head={ name="Erilaz Galea +3",},
		neck={ name="Warder's Charm +1",},
		body={ name="Runeist Coat +4",},
		hands={ name="Erilaz Gauntlets +3",},
		waist={ name="Engraved Belt",},
		legs={ name="Rune. Trousers +3",},
		feet={ name="Erilaz Greaves +3",},
		ring1={ name="Gelatinous Ring +1",},
		ring2={ name="Moonbeam Ring",},
		ear1={ name="Sanare Earring",},
		ear2={ name="Odnowa Earring +1",},
        back=gear.Ogma_Enmity,
	}
	sets.defense.Death = {
		ammo={ name="Staunch Tathlum +1",},
        head={ name="Erilaz Galea +3",},
		neck={ name="Warder's Charm +1",},
		body={ name="Runeist Coat +4",},
		hands={ name="Erilaz Gauntlets +3",},
		waist={ name="Engraved Belt",},
		legs={ name="Rune. Trousers +3",},
		feet={ name="Erilaz Greaves +3",},
		ring1={ name="Purity Ring",},
		ring2={ name="Vengeful Ring",},
		ear1={ name="Sanare Earring",},
		ear2={ name="Odnowa Earring +1",},
        back=gear.Ogma_Enmity,
	}
	sets.defense.DTCharm = {
		ammo={ name="Staunch Tathlum +1",},
        head={ name="Erilaz Galea +3",},
		neck={ name="Unmoving Collar +1",},
		body={ name="Runeist Coat +4",},
		hands={ name="Erilaz Gauntlets +3",},
		waist={ name="Engraved Belt",},
		legs={ name="Rune. Trousers +3",},
		feet={ name="Erilaz Greaves +3",},
		ring1={ name="Murky Ring",},
		ring2={ name="Dark Ring",},
		ear1={ name="Sanare Earring",},
		ear2={ name="Odnowa Earring +1",},
        back=gear.Ogma_Enmity,
	}		
	sets.defense.Charm = {
		ammo={ name="Staunch Tathlum +1",},
        head={ name="Erilaz Galea +3",},
		neck={ name="Unmoving Collar +1",},
		body={ name="Runeist Coat +4",},
		hands={ name="Erilaz Gauntlets +3",},
		waist={ name="Engraved Belt",},
		legs={ name="Rune. Trousers +3",},
		feet={ name="Erilaz Greaves +3",},
		ring1={ name="Purity Ring",},
		ring2={ name="Vengeful Ring",},
		ear1={ name="Sanare Earring",},
		ear2={ name="Odnowa Earring +1",},
        back=gear.Ogma_Enmity,
	}	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {
		ear1={ name="Telos Earring",},
	}
	sets.AccMaxTP = {
		ear1={ name="Telos Earring",},
	}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

    sets.engaged = {
		sub={ name="Refined Grip +1",},
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Prestige Crown",},
		body={ name="Runeist Coat +4",},
		hands={ name="Turms Mittens +1",},
		legs={ name="Eri. Leg Guards +3",},
		feet={ name="Turms Leggings +1",},
		neck={ name="Futhark torque +2",},
		waist={ name="Engraved Belt",},
		ear1={ name="Alabaster Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Murky Ring",},
		back=gear.Ogma_PARRY,
	}
    sets.engaged.SomeAcc = {
		sub={ name="Refined Grip +1",},
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Prestige Crown",},
		body={ name="Runeist Coat +4",},
		hands={ name="Turms Mittens +1",},
		legs={ name="Eri. Leg Guards +3",},
		feet={ name="Turms Leggings +1",},
		neck={ name="Futhark torque +2",},
		waist={ name="Engraved Belt",},
		ear1={ name="Alabaster Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Murky Ring",},
		back=gear.Ogma_PARRY,
	}
	sets.engaged.Acc = {
		sub={ name="Utu Grip",},
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Prestige Crown",},
		body={ name="Runeist Coat +4",},
		hands={ name="Turms Mittens +1",},
		legs={ name="Eri. Leg Guards +3",},
		feet={ name="Turms Leggings +1",},
		neck={ name="Futhark torque +2",},
		waist={ name="Engraved Belt",},
		ear1={ name="Alabaster Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Murky Ring",},
		back=gear.Ogma_PARRY,
	}
	sets.engaged.HighAcc = {
		sub={ name="Utu Grip",},
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Prestige Crown",},
		body={ name="Runeist Coat +4",},
		hands={ name="Turms Mittens +1",},
		legs={ name="Eri. Leg Guards +3",},
		feet={ name="Turms Leggings +1",},
		neck={ name="Futhark torque +2",},
		waist={ name="Engraved Belt",},
		ear1={ name="Alabaster Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Murky Ring",},
		back=gear.Ogma_PARRY,
	}
	sets.engaged.FullAcc = {
		sub={ name="Utu Grip",},
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Prestige Crown",},
		body={ name="Runeist Coat +4",},
		hands={ name="Turms Mittens +1",},
		legs={ name="Eri. Leg Guards +3",},
		feet={ name="Turms Leggings +1",},
		neck={ name="Futhark torque +2",},
		waist={ name="Engraved Belt",},
		ear1={ name="Alabaster Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Murky Ring",},
		back=gear.Ogma_PARRY,
	}
    sets.engaged.DTLite = {
		sub={ name="Utu Grip",},
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Adhemar Bonnet +1",},
		body={ name="Ashera Harness",},
		hands={ name="Adhemar Wrist. +1",},
		legs={ name="Nyame Flanchard",},
		feet={ name="Turms Leggings +1",},
		neck={ name="Anu Torque",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Alabaster Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Murky Ring",},
		back=gear.Ogma_DEXDA,
	}
    sets.engaged.SomeAcc.DTLite = {
		sub={ name="Utu Grip",},
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Adhemar Bonnet +1",},
		body={ name="Ashera Harness",},
		hands={ name="Adhemar Wrist. +1",},
		legs={ name="Nyame Flanchard",},
		feet={ name="Turms Leggings +1",},
		neck={ name="Anu Torque",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Alabaster Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Murky Ring",},
		back=gear.Ogma_DEXDA,
	}
	sets.engaged.Acc.DTLite = {
		sub={ name="Utu Grip",},
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Adhemar Bonnet +1",},
		body={ name="Ashera Harness",},
		hands={ name="Adhemar Wrist. +1",},
		legs={ name="Nyame Flanchard",},
		feet={ name="Turms Leggings +1",},
		neck={ name="Anu Torque",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Alabaster Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Murky Ring",},
		back=gear.Ogma_DEXDA,
	}
	sets.engaged.HighAcc.DTLite = {
		sub={ name="Utu Grip",},
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Adhemar Bonnet +1",},
		body={ name="Ashera Harness",},
		hands={ name="Adhemar Wrist. +1",},
		legs={ name="Nyame Flanchard",},
		feet={ name="Turms Leggings +1",},
		neck={ name="Anu Torque",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Alabaster Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Murky Ring",},
		back=gear.Ogma_DEXDA,
	}
	sets.engaged.FullAcc.DTLite = {
		sub={ name="Utu Grip",},
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Adhemar Bonnet +1",},
		body={ name="Ashera Harness",},
		hands={ name="Adhemar Wrist. +1",},
		legs={ name="Nyame Flanchard",},
		feet={ name="Turms Leggings +1",},
		neck={ name="Anu Torque",},
		waist={ name="Sailfi Belt +1",},
		ear1={ name="Alabaster Earring",},
		ear2={ name="Sherida Earring",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Murky Ring",},
		back=gear.Ogma_PARRY,
	}

    sets.engaged.Tank = {
		sub={ name="Refined Grip +1",},
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Prestige Crown",},
		body={ name="Runeist Coat +4",},
		hands={ name="Turms Mittens +1",},
		legs={ name="Eri. Leg Guards +3",},
		feet={ name="Turms Leggings +1",},
		neck={ name="Futhark torque +2",},
		waist={ name="Ioskeha belt +1",},
		ear1={ name="Alabaster Earring",},
		ear2={ name="Eabani Earring",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Murky Ring",},
		back=gear.Ogma_PARRY,
	}

	sets.engaged.SomeAcc.Tank = sets.engaged.Tank
	sets.engaged.Acc.Tank = sets.engaged.Tank
	sets.engaged.HighAcc.Tank = sets.engaged.Tank
	sets.engaged.FullAcc.Tank = sets.engaged.Tank
	
	sets.engaged.Parry = {
		sub={ name="Refined Grip +1",},
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Fu. Bandeau +4",},
		body={ name="Futhark Coat +3",},
		hands={ name="Turms Mittens +1",},
		legs={ name="Eri. Leg Guards +3",},
		feet={ name="Turms Leggings +1",},
		neck={ name="Futhark torque +2",},
		waist={ name="Ioskeha Belt +1",},
		ear1={ name="Alabaster Earring",},
		ear2={ name="Eabani Earring",},
		ring1={ name="Moonbeam Ring",},
		ring2={ name="Murky Ring",},
		back=gear.Ogma_PARRY,
	}
	sets.engaged.SomeAcc.Parry = sets.engaged.Parry
	sets.engaged.Acc.Parry = sets.engaged.Parry
	sets.engaged.HighAcc.Parry = sets.engaged.Parry
	sets.engaged.FullAcc.Parry = sets.engaged.Parry
	
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {
		head={ name="Frenzy Sallet",},
	}
	sets.buff.Battuta = {
		hands={ name="Turms Mittens +1",},
	}
	sets.buff.Embolden = {
		back={ name="Evasionist's Cape",},
	}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'BLU' then
		set_macro_page(1, 20)
	elseif player.sub_job == 'DRK' then
		set_macro_page(2, 20)
	else 
		set_macro_page(1, 20)
	end
		send_command('@wait 5;input /lockstyleset 20')
end

--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not data.areas.cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()
			
				if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
					windower.send_command('input /ma "Yoran-Oran (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.send_command('input /ma "Koru-Moru" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.send_command('input /ma "Selh\'teus" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.send_command('input /ma "Qultada" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.send_command('input /ma "Ulmia" <me>')
					tickdelay = os.clock() + 3
					return true
				else
					return false
				end
			end
		end
	end
	return false
end

-------------------------------------------------------------------------------------------------------------------
-- RUN overrides: paste at the bottom of your Charactername_RUN_Gear.lua
-- These redefine functions from RUN.lua, so updates to RUN.lua won't wipe your fixes.
-------------------------------------------------------------------------------------------------------------------

-- Look up IDs from Windower's resources instead of hard-coding them.
local function recast_id(name)
	local ability = res.job_abilities:with('en', name)
	return ability and ability.recast_id
end

local function spell_id(name)
	local spell = res.spells:with('en', name)
	return spell and spell.id
end

local RECAST = {
	Valiance        = recast_id('Valiance'),
	Vallation       = recast_id('Vallation'),
	Swordplay       = recast_id('Swordplay'),
	Sekkanoki       = recast_id('Sekkanoki'),
	Meditate        = recast_id('Meditate'),
	Hasso           = recast_id('Hasso'),
	Seigan          = recast_id('Seigan'),
	Souleater       = recast_id('Souleater'),
	LastResort      = recast_id('Last Resort'),
	WeaponBash      = recast_id('Weapon Bash'),
	ArcaneCircle    = recast_id('Arcane Circle'),
	Provoke         = recast_id('Provoke'),
	Warcry          = recast_id('Warcry'),
	Defender        = recast_id('Defender'),
	Aggressor       = recast_id('Aggressor'),
	Berserk         = recast_id('Berserk'),
	Steps           = recast_id('Quickstep'),          -- all steps share one recast
	AnimatedFlourish= recast_id('Animated Flourish'),
}

-- True if the ability exists and is off cooldown.
local function ready(recasts, key)
	local id = RECAST[key]
	return id ~= nil and recasts[id] ~= nil and recasts[id] < latency
end

-- True if the spell exists and is off cooldown.
local function spell_ready(recasts, name)
	local id = spell_id(name)
	return id ~= nil and recasts[id] ~= nil and recasts[id] < spell_latency
end

-- True if a blue magic spell is actually set on your /BLU subjob.
local function blu_spell_set(name)
	local id = spell_id(name)
	local sj = windower.ffxi.get_sjob_data()
	if not (sj and sj.spells) then return true end   -- can't tell; let the game decide
	return id ~= nil and S(sj.spells):contains(id)
end

local function item_name(item)
	if type(item) == 'table' then item = item.name end
	return type(item) == 'string' and item or ''
end

local function has_ear(set, name)
	return set ~= nil and (item_name(set.ear1) == name or item_name(set.ear2) == name)
end

-- ExtraDefenseMode isn't created in RUN.lua; fall back safely if your gear file doesn't define it.
local function extra_def_mode()
	return (state.ExtraDefenseMode and state.ExtraDefenseMode.value) or 'None'
end

local function target_is_monster()
	return player.target ~= nil and player.target.type == "MONSTER"
end

-------------------------------------------------------------------------------------------------------------------
-- Casting hooks
-------------------------------------------------------------------------------------------------------------------

function job_filter_precast(spell, spellMap, eventArgs)
	if spell.english == 'Valiance' then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if not ready(abil_recasts, 'Valiance') and not state.Buff['Valiance'] and ready(abil_recasts, 'Vallation') then
			eventArgs.cancel = true
			windower.chat.input('/ja "Vallation" <me>')
		end
	end
end

function job_precast(spell, spellMap, eventArgs)
	if spell.type == 'WeaponSkill' and state.AutoBuffMode.value ~= 'Off' and not buffactive.amnesia then
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
	end
end

function job_post_precast(spell, spellMap, eventArgs)
	if spell.type == 'WeaponSkill' then
		local WSset = standardize_set(get_precast_set(spell, spellMap))
		local wsacc = check_ws_acc()

		if has_ear(WSset, "Moonshade Earring") and get_effective_player_tp(spell, WSset) > 3200 then
			if wsacc:contains('Acc') and not buffactive['Sneak Attack'] and sets.AccMaxTP then
				equip(sets.AccMaxTP[spell.english] or sets.AccMaxTP)
			elseif sets.MaxTP then
				equip(sets.MaxTP[spell.english] or sets.MaxTP)
			end
		end

	-- FIX: moved here from job_precast so the base JA set doesn't overwrite it
	elseif spell.english == 'Vivacious Pulse' then
		local vp = sets.precast.JA['Vivacious Pulse']
		if vp and vp[state.RuneElement.value] then
			equip(vp[state.RuneElement.value])
		end

	elseif spell.english == 'Lunge' or spell.english == 'Swipe' then
		if weather_rune_match() and item_available('Hachirin-no-Obi') then
			equip({waist="Hachirin-no-Obi"})
		end
		if spell.element and sets.element and sets.element[spell.element] then
			equip(sets.element[spell.element])
		end
	end
end

function job_post_midcast(spell, spellMap, eventArgs)
	if spell.skill == 'Enhancing Magic' and state.Buff.Embolden and sets.buff.Embolden then
		equip(sets.buff.Embolden)
	end
end

function job_aftercast(spell, spellMap, eventArgs)
end

-------------------------------------------------------------------------------------------------------------------
-- Set customization
-------------------------------------------------------------------------------------------------------------------

function job_customize_defense_set(defenseSet)
	local edm = extra_def_mode()
	if edm ~= 'None' and state.DefenseMode.value ~= 'None' and sets[edm] then
		defenseSet = set_combine(defenseSet, sets[edm])
	end

	if buffactive['Battuta'] and sets.buff.Battuta and player.status == 'Engaged' and state.DefenseMode.value == 'Physical' then
		defenseSet = set_combine(defenseSet, sets.buff.Battuta)
	end

	return defenseSet
end

-- FIX: one place builds the melee groups, so state changes and buff changes stop fighting.
function update_melee_groups()
	classes.CustomMeleeGroups:clear()

	local edm = extra_def_mode()
	if edm ~= 'None' then
		classes.CustomMeleeGroups:append(edm)
	end

	if player.equipment.main == "Epeolatry" and state.Buff['Aftermath: Lv.3'] then
		classes.CustomMeleeGroups:append('AM')
	end
end

function job_state_change(stateField, newValue, oldValue)
	classes.CustomDefenseGroups:clear()
	local edm = extra_def_mode()
	if edm ~= 'None' then
		classes.CustomDefenseGroups:append(edm)
	end
	update_melee_groups()
end

-------------------------------------------------------------------------------------------------------------------
-- Sub Job Enmity command
-------------------------------------------------------------------------------------------------------------------

local function fallback(msg)
	if not check_auto_tank_ws() and not state.AutoTankMode.value then
		add_to_chat(123, msg)
	end
end

local BLU_ENMITY = {'Sheep Song', 'Soporific', 'Geist Wall', 'Jettatura', 'Stinking Gas', 'Blank Gaze'}

function job_self_command(commandArgs, eventArgs)
	if not commandArgs[1] or commandArgs[1]:lower() ~= 'subjobenmity' then return end

	if not target_is_monster() then
		add_to_chat(123, 'Abort: You are not targeting a monster.')
		return
	end

	local sub = player.sub_job
	local defensive = state.HybridMode.value ~= 'Normal' or state.DefenseMode.value ~= 'None'

	if sub == 'BLU' then
		if silent_check_silence() then return fallback('Silenced: no Blue Magic available.') end
		local spell_recasts = windower.ffxi.get_spell_recasts()
		-- FIX: skip spells that aren't set instead of retrying them forever
		for _, name in ipairs(BLU_ENMITY) do
			if blu_spell_set(name) and spell_ready(spell_recasts, name) then
				windower.chat.input('/ma "'..name..'" <t>')
				return
			end
		end
		fallback('All Enmity Blue Magic on cooldown.')

	elseif sub == 'DRK' then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		local spell_recasts = windower.ffxi.get_spell_recasts()

		if defensive and buffactive['Souleater'] then send_command('cancel souleater') end
		if defensive and buffactive['Last Resort'] then send_command('cancel last resort') end

		if spell_ready(spell_recasts, 'Stun') and not silent_check_silence() then
			windower.chat.input('/ma "Stun" <t>')
		elseif buffactive.amnesia then
			fallback('Amnesia: no Dark Knight abilities available.')
		elseif ready(abil_recasts, 'Souleater') then
			windower.chat.input('/ja "Souleater" <me>')
		elseif ready(abil_recasts, 'LastResort') then
			windower.chat.input('/ja "Last Resort" <me>')
		elseif ready(abil_recasts, 'WeaponBash') then
			windower.chat.input('/ja "Weapon Bash" <t>')
		elseif ready(abil_recasts, 'ArcaneCircle') then
			windower.chat.input('/ja "Arcane Circle" <me>')
		else
			fallback('All Enmity Dark Knight abilities on cooldown.')
		end

	elseif sub == 'WAR' then
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if defensive and buffactive['Berserk'] then send_command('cancel berserk') end

		if buffactive.amnesia then
			fallback('Amnesia: no Warrior abilities available.')
		elseif ready(abil_recasts, 'Provoke') then
			windower.chat.input('/ja "Provoke" <t>')
		elseif ready(abil_recasts, 'Warcry') then
			windower.chat.input('/ja "Warcry" <me>')
		elseif ready(abil_recasts, 'Defender') then
			windower.chat.input('/ja "Defender" <me>')
		elseif ready(abil_recasts, 'Aggressor') then
			windower.chat.input('/ja "Aggressor" <me>')
		elseif ready(abil_recasts, 'Berserk') then
			windower.chat.input('/ja "Berserk" <me>')
		else
			fallback('All Enmity Warrior Job Abilities on cooldown.')
		end

	elseif sub == 'DNC' then
		if buffactive.amnesia then return fallback('Amnesia: no Dancer abilities available.') end

		local abil_recasts = windower.ffxi.get_ability_recasts()
		local under3FMs = not buffactive['Finishing Move 3'] and not buffactive['Finishing Move 4'] and not buffactive['Finishing Move 5']

		-- FIX: falls through to the tank WS when Steps are on cooldown instead of stalling
		if under3FMs and ready(abil_recasts, 'Steps') then
			windower.chat.input('/ja "'..state.Steps.value..'" <t>')
		elseif not under3FMs and ready(abil_recasts, 'AnimatedFlourish') then
			windower.chat.input('/ja "Animated Flourish" <t>')
		elseif not buffactive['Finishing Move 5'] and ready(abil_recasts, 'Steps') then
			windower.chat.input('/ja "'..state.Steps.value..'" <t>')
		else
			fallback('Dancer job abilities not needed.')
		end
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Utility
-------------------------------------------------------------------------------------------------------------------

-- FIX: no longer leaks weather_rune / day_rune as globals
function weather_rune_match()
	local weather_rune = buffactive[data.elements.rune_of[world.weather_element] or '']
	local day_rune = buffactive[data.elements.rune_of[world.day_element] or '']
	return (weather_rune or day_rune) and true or false
end

-- FIX: rune_timers is never defined; return 0 instead of erroring
function rune_count(rune)
	if type(rune_timers) ~= 'table' then return 0 end
	local count = 0
	local current_time = os.time()
	for _, entry in pairs(rune_timers) do
		if entry.rune == rune and entry.expires > current_time then
			count = count + 1
		end
	end
	return count
end

-------------------------------------------------------------------------------------------------------------------
-- Automation
-------------------------------------------------------------------------------------------------------------------

function job_tick()
	if check_hasso() then return true end
	if check_buff() then return true end
	if check_buffup() then return true end
	if state.AutoTankMode.value and player.in_combat and target_is_monster() and not moving then
		if check_flash_foil() then return true end
		windower.send_command('gs c SubJobEnmity')
		tickdelay = os.clock() + 1.5
		return true
	end
	return false
end

function check_flash_foil()
	if silent_check_silence() then return false end
	local spell_recasts = windower.ffxi.get_spell_recasts()

	if not buffactive['Enmity Boost'] and spell_ready(spell_recasts, 'Crusade') then
		windower.chat.input('/ma "Crusade" <me>')
		tickdelay = os.clock() + 2
		return true
	elseif spell_ready(spell_recasts, 'Flash') then
		windower.chat.input('/ma "Flash" <t>')
		tickdelay = os.clock() + 2
		return true
	elseif spell_ready(spell_recasts, 'Foil') then
		windower.chat.input('/ma "Foil" <me>')
		tickdelay = os.clock() + 2
		return true
	end
	return false
end

function check_hasso()
	if not (state.Stance.value == 'None' or state.Buff.Hasso or state.Buff.Seigan)
	and player.sub_job == 'SAM' and player.in_combat and not buffactive.amnesia then
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

-- Lists without a When field (Default, Tank, Full, Melee) are treated as 'Always'
-- if you pick them as your AutoBuffMode.
local function when_ok(when)
	local fighting = player.in_combat or being_attacked
	when = when or 'Always'
	if when == 'Always' then return true
	elseif when == 'Combat' then return fighting
	elseif when == 'Engaged' then return player.status == 'Engaged'
	elseif when == 'Idle' then return player.status == 'Idle'
	elseif when == 'OutOfCombat' then return not fighting
	end
	return false
end

function check_buff()
	if state.AutoBuffMode.value == 'Off' or data.areas.cities:contains(world.area) then
		return false
	end

	local list = buff_spell_lists[state.AutoBuffMode.value]
	if list and not silent_check_silence() then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		for _, b in ipairs(list) do
			if not buffactive[b.Buff] and when_ok(b.When)
			and spell_recasts[b.SpellID] and spell_recasts[b.SpellID] < spell_latency
			and silent_can_use(b.SpellID) then
				windower.chat.input('/ma "'..b.Name..'" <me>')
				tickdelay = os.clock() + 2
				return true
			end
		end
	end

	if player.in_combat and not buffactive.amnesia then
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if not buffactive['Swordplay'] and ready(abil_recasts, 'Swordplay') then
			windower.chat.input('/ja "Swordplay" <me>')
			tickdelay = os.clock() + 1.1
			return true
		elseif player.sub_job == 'DRK' and not buffactive['Last Resort'] and ready(abil_recasts, 'LastResort') then
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

function check_buffup()
	if not buffup or buffup == '' then return false end

	local list = buff_spell_lists[buffup]
	if not list then
		add_to_chat(123, 'No buff list named "'..tostring(buffup)..'".')
		buffup = ''
		return false
	end

	local needsbuff = false
	for _, b in ipairs(list) do
		if not buffactive[b.Buff] and silent_can_use(b.SpellID) then
			needsbuff = true
			break
		end
	end

	if not needsbuff then
		add_to_chat(217, 'All '..buffup..' buffs are up!')
		buffup = ''
		return false
	end

	if silent_check_silence() then return false end

	local spell_recasts = windower.ffxi.get_spell_recasts()
	for _, b in ipairs(list) do
		if not buffactive[b.Buff] and silent_can_use(b.SpellID)
		and spell_recasts[b.SpellID] and spell_recasts[b.SpellID] < spell_latency then
			windower.chat.input('/ma "'..b.Name..'" <me>')
			tickdelay = os.clock() + 2
			return true
		end
	end

	return false
end