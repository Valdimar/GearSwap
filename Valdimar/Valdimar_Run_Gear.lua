function user_job_setup()

	state.OffenseMode:options('Normal','Acc','FullAcc')
	state.HybridMode:options('Tank','DTLite','Damage','Parry')
	state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','HighAcc','FullAcc')
	state.CastingMode:options('Normal','SIRD')
	state.PhysicalDefenseMode:options('PDT_HP','PDT')
	state.MagicalDefenseMode:options('MDT_HP','BDT_HP','MDT','BDT')
	state.ResistDefenseMode:options('MEVA_HP','MEVA','Death','Charm','DTCharm')
	state.IdleMode:options('Tank','DTLite')
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
	
	send_command('bind ^delete input /ja "Provoke" <stnpc>')
	send_command('bind !delete input /ma "Cure IV" <stal>')
	send_command('bind @delete input /ma "Flash" <stnpc>')
	
	send_command('bind ^\\\\ input /ma "Phalanx" <me>')
	send_command('bind @\\\\ input /ma "Aquaveil" <me>')
	send_command('bind !\\\\ input /ma "Crusade" <me>')
	send_command('bind ^t input /ma "Regen IV" <st>')
	send_command('bind @t input /ma "Refresh" <st>')
	send_command('bind ^!\\\\ input /ma "Temper" <me>')
	
	send_command('bind ^backspace input /ja "Lunge" <t>')
	send_command('bind @backspace input /ja "Gambit" <t>')
	send_command('bind !backspace input /ja "Rayke" <t>')
	
	send_command('bind @f8 gs c toggle AutoTankMode')
	send_command('bind @f10 gs c toggle TankAutoDefense')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	
	send_command('bind !r gs c Weapons;gs c update')
	
	send_command('bind !w input /equip ring2 "Warp Ring";')
	send_command('bind !q input /equip ring2 "Dim. Ring (Dem)";')
	
	select_default_macro_book()
end

function init_gear_sets()

    sets.Enmity = {
		ammo={ name="Aqreqaq Bomblet"},
		head={ name="Rabid Visor"},
		body={ name="Emet Harness +1"},
		hands={ name="Kurys Gloves"},
		legs={ name="Eri. Leg Guards +3"},
		feet={ name="Erilaz Greaves +3"},
		neck={ name="Moonlight Necklace"},
		waist={ name="Kasiri Belt"},
		ear1={ name="Cryptic Earring"},
		ring1={ name="Begrudging Ring"},
		ring2={ name="Pernicious Ring"},
		back=gear.Ogma_EM_SIRD,
	}
		 
    sets.Enmity.SIRD = {
		ammo={ name="Staunch Tathlum +1"},
        head={ name="Fu. Bandeau +2"},
		neck={ name="Unmoving Collar +1"},
		body={ name="Emet Harness +1"},
		hands={ hands="Kurys Gloves"},
		waist={ name="Audumbla Sash"},
		legs={ name="Eri. Leg Guards +3"},
		feet={ name="Erilaz Greaves +3"},
		ring1={ name="Moonbeam Ring"},
		ring2={ name="Murky Ring"},
		ear1={ name="Genmei Earring"},
		ear2={ name="Trux Earring"},
		back=gear.Ogma_EM_SIRD,
	}
		
    sets.Enmity.SIRDT = {
		ammo={ name="Staunch Tathlum +1"},
        head={ name="Fu. Bandeau +2"},
		neck={ name="Unmoving Collar +1"},
		ear1={ name="Tuisto Earring"},
		ear2={ name="Odnowa Earring +1"},
        body={ name="Emet Harness +1"},
		hands={ hands="Kurys Gloves"},
		ring2={ name="Murky Ring"},
		waist={ name="Audumbla Sash"},
		legs={ name="Eri. Leg Guards +3"},
		feet={ name="Erilaz Greaves +3"},
		ring1={ name="Moonbeam Ring"},
		ring1={ name="Moonbeam Ring"},
		back=gear.Ogma_EM_SIRD,
	}

    sets.Enmity.DT = {
		ammo={ name="Staunch Tathlum +1"},
        head={ name="Fu. Bandeau +1"},
		neck={ name="Unmoving Collar +1"},
		ear1={ name="Tuisto Earring"},
		ear2={ name="Odnowa Earring +1"},
        body={ name="Emet Harness +1"},
		hands={ hands="Kurys Gloves"},
		ring1={ name="Moonbeam Ring"},
		ring2={ name="Murky Ring"},
        back={ name="Moonlight Cape"},
		waist={ name="Flume Belt +1"},
		legs={ name="Eri. Leg Guards +3"},
		feet={ name="Erilaz Greaves +3"},
		back=gear.Ogma_EM_SIRD,
	}
		
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Item sets.

	-- Precast sets to enhance JAs
	sets.precast.JA['Vallation'] = set_combine(sets.Enmity, { 
		body={ name="Runeist Coat +4"},
		legs={ name="Futhark Trousers +4"}, }
	)
	
    sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
	
    sets.precast.JA['Pflug'] = set_combine(sets.Enmity, {
		feet={ name="Runeist Bottes +3"}, }
	)
	
    sets.precast.JA['Battuta'] = set_combine(sets.Enmity, {
		head={ name="Fu. Bandeau +3"}, }
	)
	
    sets.precast.JA['Liement'] = set_combine(sets.Enmity, {
		body={ name="Futhark Coat +3"}, }
	)
    sets.precast.JA['Gambit'] = set_combine(sets.Enmity, {
		hands={ name="Runeist Mitons +3"}, }
	)
	
    sets.precast.JA['Rayke'] = set_combine(sets.Enmity, {
		feet={ name="Futhark Boots +3"}, }
	)
	
    sets.precast.JA['Elemental Sforzo'] = {
		body={ name="Futhark Coat +3"}, 
	}
	
    sets.precast.JA['Swordplay'] = set_combine(sets.Enmity, {
		hands={ name="Futhark Mitons +3"}, }
	)
	
    sets.precast.JA['Embolden'] = {
		back=gear.Evasion_Cape,
	}
	
    sets.precast.JA['Vivacious Pulse'] = set_combine(sets.Enmity, {
		head={ name="Erilaz Galea +3"},
		legs={ name="Rune. Trousers +3"},
		waist={ name="Bishop Sash"},
		back={ name="Altruistic Cape"},
		ear1={ name="Saxnot Earring"}, }
	)
	
    sets.precast.JA['One For All'] = set_combine(sets.enmity, {
		ammo={ name="Staunch Tathlum +1"},
		head={ name="Runeist Bandeau +3"},
		body={ name="Runeist Coat +3"},
		hands={ name="Regal Gauntlets"},
		legs={ name="Futh. Trousers +3"},
		feet={ name="Turms Leggings +1"},
		neck={ name="Sanctity Necklace"},
		ear1={ name="Enchntr. Earring +1"},
		ear2={ name="Handler's Earring +1"},
		ring1={ name="Valseur's Ring"},
		ring2={ name="Murky Ring"},
		back=gear.Ogma_EM_SIRD,
	} )
	
	sets.precast.JA['Last Resort'] = sets.enmity
	
	sets.precast.JA['Souleater'] = sets.enmity
	
	sets.precast.JA['Arcane Circle'] = sets.enmity
	
	sets.precast.JA['Weapon Bash'] = sets.enmity
	
    sets.precast.JA['Provoke'] = sets.enmity
	
	sets.precast.JA['Warcry'] = sets.enmity
	
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Last Resort'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    sets.precast.JA['Lunge'] = {
		ammo={ name="Pemphredo Tathlum"},
		head={ name="Agwu's Cap"},
		body={ name="Agwu's Robe"},
		hands={ name="Agwu's Gages"},
		legs={ name="Agwu's Slops"},
		feet={ name="Agwu's Pigaches"},
		neck={ name="Sanctity Necklace"},
		waist={ name="Eschan Stone"},
		ear1={ name="Friomisi Earring"},
		ear2={ name="Static Earring"},
		ring1={ name="Mujin Band"},
		ring2={ name="Locus Ring"},
		back={ name="Evasionist's Cape"},
	}

	sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']

	-- Gear for specific elemental nukes.
	sets.element.Dark = {
		head={ name="Pixie Hairpin +1"},
		ring2={ name="Archon Ring"},
	}

	-- Pulse sets, different stats for different rune modes, stat aligned.
    sets.precast.JA['Vivacious Pulse'] = {
		head={ name="Erilaz Galea +3"},
		neck={ name="Incanter's Torque"},
		ring1={ name="Stikini Ring +1"},
		ring2={ name="Stikini Ring +1"},
		legs={ name="Rune. Trousers +3"},
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
		ammo={ name="Yamarang"},
        head=gear.CarmineMArk_FC,
		neck={ name="Unmoving Collar +1"},
		ear1={ name="Enchntr. Earring +1"},
		ear2={ name="Handler's Earring +1"},
        body=gear.herculean_waltz_body,
		hands=gear.herculean_waltz_hands,
		ring1={ name="Valseur's Ring"},
		ring2={ name="Murky Ring"},
        back={ name="Moonlight Cape"},
		waist={ name="Chaac Belt"},
		legs={ name="Dashing Subligar"},
		feet=gear.herculean_waltz_feet
	}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
	
    sets.precast.Step = {}
		
	sets.precast.JA['Violent Flourish'] = {}
		
	-- Fast cast sets for spells
    sets.precast.FC = {
		ammo={ name="Impatiens"},
		head={ name="Rune. Bandeau +3"},
		neck={ name="Futhark Torque +2"},
		body={ name="Erilaz Surcoat +2"},
		hands=gear.herculean_FCPhal_hands,
		waist={ name="Audumbla Sash"},
		legs={ name="Agwu's Slops"},
		feet={ name="Carmine Greaves +1"},
		ring1={ name="Kishar Ring"},
		ring2={ name="Murky Ring"},
		ear1={ name="Etiolation Earring"},
		ear2={ name="Odnowa Earring +1"},
		back=gear.Ogma_CASTEVADE,
	}
			
	sets.precast.FC.DT = {
		ammo={ name="Impatiens"},
        head={ name="Rune. Bandeau +3"},
		neck={ name="Loricate Torque +1"},
        body={ name="Runeist Coat +4"},
		hands={ name="Leyline Gloves"},
		waist={ name="Audumbla Sash"},
		legs={ name="Eri. Leg Guards +3"},
		feet={ name="Carmine Greaves +1"},
		ring1={ name="Kishar Ring"},
		ring2={ name="Murky Ring"},
		ear1={ name="Etiolation Earring"},
		ear2={ name="Odnowa Earring +1"},
        back={ name="Moonlight Cape"},
	}
		
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
		waist={ name="Siegel Sash"},
		legs={ name="Futhark Trousers +4"},
	} )
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
		neck={ name="Magoraga Beads"},
	} )
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	-- Weaponskill sets
	sets.precast.WS = {
		ammo={ name="Knobkierrie"},
		head={ name="Halitus Helm"},
		body={ name="Ashera Harness",},
		hands={ name="Kurys Gloves"},
		legs={ name="Eri. Leg Guards"},
		feet={ name="Erilaz Greaves +3"},
		neck={ name="Anu Torque"},
		waist={ name="Kasiri Belt"},
		ear1={ name="Tuisto Earring"},
		ear2={ name="Odnowa Earring +1"},
		ring1={ name="Moonbeam Ring"},
		ring2={ name="Moonbeam Ring"},
		back=gear.Ogma_STRDA,
	}
	
	sets.precast.WS.SomeAcc = {
		ammo={ name="Voluspa Tathlum"},
        head={ name="Adhemar Bonnet +1"},
		neck={ name="Fotia Gorget"},
		ear1={ name="Moonshade Earring"},
		ear2={ name="Sherida Earring"},
        body={ name="Ayanmo Corazza +2"},
		hands={ name="Meg. Gloves +2"},
		ring1={ name="Niqmaddu Ring"},
		ring2={ name="Regal Ring"},
        back=gear.Ogma_STRDA,
		waist={ name="Fotia Belt"},
		legs={ name="Meg. Chausses +2"},
		feet=gear.herculean_TA_feet,
	}
	sets.precast.WS.Acc = {
		ammo={ name="Voluspa Tathlum"},
		head={ name="Dampening Tam"},
		neck={ name="Fotia Gorget"},
		ear1={ name="Moonshade Earring"},
		ear2={ name="Sherida Earring"},
		body={ name="Ayanmo Corazza +2"},
		hands={ name="Meg. Gloves +2"},
		ring1={ name="Niqmaddu Ring"},
		ring2={ name="Regal Ring"},
		back=gear.Ogma_STRDA,
		waist={ name="Fotia Belt"},
		legs={ name="Meg. Chausses +2"},
		feet=gear.herculean_TA_feet
	}
	sets.precast.WS.HighAcc = {
		ammo={ name="C. Palug Stone"},
		head={ name="Meghanada Visor +2"},
		neck={ name="Fotia Gorget"},
		ear1={ name="Telos Earring"},
		ear2={ name="Sherida Earring"},
		body={ name="Ayanmo Corazza +2"},
		hands={ name="Meg. Gloves +2"},
		ring1={ name="Niqmaddu Ring"},
		ring2={ name="Regal Ring"},
		back=gear.Ogma_STRDA,
		waist={ name="Fotia Belt"},
		legs={ name="Meg. Chausses +2"},
		feet=gear.herculean_acc_feet
	}
	sets.precast.WS.FullAcc = {
		ammo={ name="C. Palug Stone"},
		head=gear.CarmineMArk_FC,
		neck={ name="Combatant's Torque"},
		ear1={ name="Telos Earring"},
		ear2={ name="Mache Earring +1"},
		body={ name="Meg. Cuirie +2"},
		hands={ name="Meg. Gloves +2"},
		ring1={ name="Ramuh Ring +1"},
		ring2={ name="Ramuh Ring +1"},
		back=gear.stp_jse_back,
		waist={ name="Fotia Belt"},
		legs={ name="Meg. Chausses +2"},
		feet=gear.herculean_acc_feet
	}

    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS,{
		head={ name="Blistering Sallet +1"},
		body={ name="Nyame Mail"},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20'}},
		legs={ name="Nyame Flanchard"},
		feet=gear.herculean_TA_feet,
		waist={ name="Fotia Belt"},
		ear1={ name="Moonshade Earring"},
		ear2={ name="Sherida Earring"},
		ring1={ name="Regal Ring"},
		ring2={ name="Niqmaddu Ring"},
		back=gear.Ogma_STRDA,
	} )
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc,{
		head={ name="Blistering Sallet +1"},
		body={ name="Nyame Mail"},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20'}},
		legs={ name="Nyame Flanchard"},
		feet=gear.herculean_TA_feet,
		waist={ name="Fotia Belt"},
		ear1={ name="Moonshade Earring"},
		ear2={ name="Sherida Earring"},
		ring1={ name="Regal Ring"},
		ring2={ name="Niqmaddu Ring"},
		back=gear.Ogma_STRDA,
	})
    sets.precast.WS['Resolution'].HighAcc = set_combine(sets.precast.WS.HighAcc,{
		head={ name="Blistering Sallet +1"},
		body={ name="Nyame Mail"},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20'}},
		legs={ name="Nyame Flanchard"},
		feet=gear.herculean_TA_feet,
		waist={ name="Fotia Belt"},
		ear1={ name="Moonshade Earring"},
		ear2={ name="Sherida Earring"},
		ring1={ name="Regal Ring"},
		ring2={ name="Niqmaddu Ring"},
		back=gear.Ogma_STRDA,
	} )
	sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc,{
		head={ name="Blistering Sallet +1"},
		body={ name="Nyame Mail"},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20'}},
		legs={ name="Nyame Flanchard"},
		feet=gear.herculean_TA_feet,
		waist={ name="Fotia Belt"},
		ear1={ name="Moonshade Earring"},
		ear2={ name="Sherida Earring"},
		ring1={ name="Regal Ring"},
		ring2={ name="Niqmaddu Ring"},
		back=gear.Ogma_STRDA,
	} )

    sets.precast.WS['Dimidiation'] = set_combine(sets.precast.WS,{
		ammo={ name="Knobkierrie"},
		neck={ name="Anu Torque"},
		head={ name="Nyame Helm"},
		body={ name="Nyame Mail"},
		hands={ name="Nyame Gauntlets"},
		legs={ name="Nyame Flanchard"},
		feet={ name="Nyame Sollerets"},
		waist={ name="Kentarch Belt +1"},
		ear1={ name="Moonshade Earring"},
		ear2={ name="Sherida Earring"},
		ring1={ name="Regal Ring"},
		ring2={ name="Ilabrat Ring"},
		back=gear.Ogma_DEXWSD,
	} )
    sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS.Acc,{
		ammo={ name="Knobkierrie"},
		neck={ name="Anu Torque"},
		head={ name="Nyame Helm"},
		body={ name="Nyame Mail"},
		hands={ name="Nyame Gauntlets"},
		legs={ name="Nyame Flanchard"},
		feet={ name="Nyame Sollerets"},
		waist={ name="Kentarch Belt +1"},
		ear1={ name="Moonshade Earring"},
		ear2={ name="Sherida Earring"},
		ring1={ name="Regal Ring"},
		ring2={ name="Ilabrat Ring"},
		back=gear.Ogma_DEXWSD,
	} )
	sets.precast.WS['Dimidiation'].HighAcc = set_combine(sets.precast.WS.HighAcc,{
		ammo={ name="Knobkierrie"},
		neck={ name="Anu Torque"},
		head={ name="Nyame Helm"},
		body={ name="Nyame Mail"},
		hands={ name="Nyame Gauntlets"},
		legs={ name="Nyame Flanchard"},
		feet={ name="Nyame Sollerets"},
		waist={ name="Kentarch Belt +1"},
		ear1={ name="Moonshade Earring"},
		ear2={ name="Sherida Earring"},
		ring1={ name="Regal Ring"},
		ring2={ name="Ilabrat Ring"},
		back=gear.Ogma_DEXWSD,
	} )
	sets.precast.WS['Dimidiation'].FullAcc = set_combine(sets.precast.WS.FullAcc,{
		ammo={ name="Knobkierrie"},
		neck={ name="Anu Torque"},
		head={ name="Nyame Helm"},
		body={ name="Nyame Mail"},
		hands={ name="Nyame Gauntlets"},
		legs={ name="Nyame Flanchard"},
		feet={ name="Nyame Sollerets"},
		waist={ name="Kentarch Belt +1"},
		ear1={ name="Moonshade Earring"},
		ear2={ name="Sherida Earring"},
		ring1={ name="Regal Ring"},
		ring2={ name="Ilabrat Ring"},
		back=gear.Ogma_DEXWSD,
	} )
	
	--	head={ name="Nyame Helm"},
	--	body={ name="Nyame Mail"},
	--	hands={ name="Nyame Gauntlets"},
	--	legs={ name="Nyame Flanchard"},
	--	feet={ name="Nyame Sollerets"},
	
    sets.precast.WS['Ground Strike'] = set_combine(sets.precast.WS,{})
    sets.precast.WS['Ground Strike'].Acc = set_combine(sets.precast.WS.Acc,{})
	sets.precast.WS['Ground Strike'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Ground Strike'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})
		
    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {})
	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast['Lunge'], {})

	--------------------------------------
	-- Midcast sets
	--------------------------------------
	
    sets.midcast.FastRecast = {
		ammo={ name="Staunch Tathlum +1"},
        head={ name="Erilaz Galea +3"},
		neck={ name="Moonlight Necklace"},
		body={ name="Nyame Mail"},
		hands={ name="Rawhide Gloves"},
		waist={ name="Audumbla Sash"},
		legs=gear.CarmineLegs_HP,
		feet={ name="Erilaz Greaves +3"},
		ear1={ name="Tuisto Earring"},
		ear2={ name="Halasz Earring"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Murky Ring"},
		back=gear.Ogma_EM_SIRD,
	}
	sets.midcast.FastRecast.DT = {
		ammo={ name="Staunch Tathlum +1"},
        head={ name="Erilaz Galea +3"},
		neck={ name="Moonlight Necklace"},
		body={ name="Nyame Mail"},
		hands={ name="Rawhide Gloves"},
		waist={ name="Audumbla Sash"},
		legs=gear.CarmineLegs_HP,
		feet={ name="Erilaz Greaves +3"},
		ear1={ name="Tuisto Earring"},
		ear2={ name="Halasz Earring"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Murky Ring"},
		back=gear.Ogma_EM_SIRD,
	}
	sets.midcast.FastRecast.SIRD = {
		ammo={ name="Staunch Tathlum +1"},
        head={ name="Erilaz Galea +3"},
		neck={ name="Moonlight Necklace"},
		body={ name="Nyame Mail"},
		hands={ name="Rawhide Gloves"},
		waist={ name="Audumbla Sash"},
		legs=gear.CarmineLegs_HP,
		feet={ name="Erilaz Greaves +3"},
		ear1={ name="Tuisto Earring"},
		ear2={ name="Halasz Earring"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Murky Ring"},
		back=gear.Ogma_CASTEVADE,
	}
    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast,{
		head={ name="Erilaz Galea +3"},
		neck={ name="Incanter's Torque"},
		body={ name="Runeist Coat +4"},
		hands={ name="Runeist Mitons +3"},
		waist={ name="Olympus Sash"},
		ear1={ name="Andoaa Earring"},
		ring1={ name="Stikini Ring"},
		ring2={ name="Stikini Ring +1"},
		legs={ name="Futhark Trousers +4"},
		back={ name="Moonbeam Cape"},}
	)
    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{
		ammo={ name="Staunch Tathlum +1"},
		head={ name="Fu. Bandeau +3"},
		body={ name="Taeon Tabard"},
		hands=gear.herculean_FCPhal_hands,
		legs={ name="Taeon Tights"},
		feet={ name="Taeon Boots"},
		waist={ name="Olympus Sash"},
		ear1={ name="Alabaster Earring"},
		ear2={ name="Odnowa Earring +1"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Murky Ring"},
		back={ name="Moonbeam Cape"}, }
	)
    sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'],{
		neck={ name="Sanctity Necklace"},
		head={ name="Rune. Bandeau +3"},
		hands={ name="Turms Mittens +1"}, 
		ear2={ name="Erilaz Earring"},
	} ) 
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'],{
		head={ name="Erilaz Galea +3",},
		hands={ name="Regal Gauntlets"},
		legs={ name="Futhark Trousers +4"},
		waist={ name="Gishdubar Sash"}, }
	) 
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		neck={ name="Incanter's torque"},
		hands={ name="Regal Gauntlets"},
		waist={ name="Siegel Sash"}, }
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
		ammo={ name="Staunch Tathlum +1"},
        head=gear.CarmineMask_FC,
		neck={ name="Sacro Gorget"},
        body={ name="Vrikodara Jupon"},
		hands={ name="Buremte Gloves"},
		waist={ name="Luminary Sash"},
		legs=gear.CarmineLegs_HP,
		feet={ name="Skaoi Boots"},
		ring1={ name="Lebeche Ring"},
		ring2={ name="Janniston Ring"},
		ear1={ name="Mendi. Earring"},
		ear2={ name="Roundel Earring"},
        back={ name="Tempered Cape +1"},
	}
		
	sets.midcast['Wild Carrot'] = set_combine(sets.midcast.Cure, {
	})
		
	sets.Self_Healing = {
		hands={ name="Buremte Gloves"},
		ring2={ name="Kunaji Ring"},
		waist={ name="Gishdubar Sash"},
	}
	sets.Cure_Received = {
		hands={ name="Buremte Gloves"},
		ring2={ name="Kunaji Ring"},
		waist={ name="Gishdubar Sash"},
	}
	sets.Self_Refresh = {
		head={ name="Erilaz Galea +3",},
		hands={ name="Regal Gauntlets"},
		legs={ name="Futhark Trousers +4"},
		waist={ name="Gishdubar Sash"},
	}
	sets.Phalanx_Received = {
		hands=gear.herculean_phalanx_hands,
		feet=gear.herculean_nuke_feet
	}
	
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {
		ring2={ name="Sheltered Ring"},
	} )
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {
		ring2={ name="Sheltered Ring"},
	} )

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	sets.resting = {}

    sets.idle = {
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Turms Cap +1"},
		body={ name="Runeist Coat +4",},
		hands={ name="Erilaz Gauntlets +3"},
		legs=gear.CarmineLegs_HP,
		feet={ name="Erilaz Greaves +3"},
		neck={ name="Futhark torque +2"},
		waist={ name="Engraved Belt"},
		ear1={ name="Alabaster Earring"},
		ear2={ name="Eabani Earring"},
		ring1={ name="Moonbeam Ring"},
		ring2={ name="Murky Ring"},
		back=gear.Ogma_EM_SIRD,
	}
		
	sets.idle.Tank = {
		sub={ name="Refined Grip +1"},
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Turms Cap +1"},
		body={ name="Runeist Coat +4",},
		hands={ name="Erilaz Gauntlets +3"},
		legs={ name="Eri. Leg Guards +3"},
		feet={ name="Erilaz Greaves +3"},
		neck={ name="Futhark torque +2"},
		waist={ name="Engraved Belt"},
		ear1={ name="Alabaster Earring"},
		ear2={ name="Eabani Earring"},
		ring1={ name="Moonbeam Ring"},
		ring2={ name="Murky Ring"},
		back=gear.Ogma_EM_SIRD,
	}
	
	sets.idle.Refresh = {
		ammo={ name="Homiliary"},
		body={ name="Runeist Coat +4"},
		hands={ name="Regal Gauntlets"},
		waist={ name="Fucho-no-obi"},
		ear1={ name="Tuisto Earring"},
	}
	
	sets.idle.DTLite = {
		sub={ name="Utu Grip"},
		ammo={ name="Staunch Tathlum +1"},
		head={ name="Adhemar Bonnet +1"},
		body={ name="Ashera Harness"},
		hands={ name="Adhemar Wrist. +1"},
		legs={ name="Nyame Flanchard"},
		feet=gear.LustraFeet_DPS,
		neck={ name="Anu Torque"},
		waist={ name="Sailfi Belt +1"},
		ear1={ name="Alabaster Earring"},
		ear2={ name="Sherida Earring"},
		ring1={ name="Moonbeam Ring"},
		ring2={ name="Murky Ring"},
		back=gear.Ogma_DEXFITE,
	}

	sets.Kiting = {
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Turms Cap +1"},
		body={ name="Runeist Coat +4",},
		hands={ name="Erilaz Gauntlets +3"},
		legs=gear.CarmineLegs_HP,
		feet={ name="Erilaz Greaves +3"},
		neck={ name="Futhark torque +2"},
		waist={ name="Engraved Belt"},
		ear1={ name="Alabaster Earring"},
		ear2={ name="Eabani Earring"},
		ring1={ name="Moonbeam Ring"}, 
		ring2={ name="Murky Ring"},
		back=gear.Ogma_EM_SIRD,
	}
	
	sets.latent_refresh = {
		ammo={ name="Homiliary"},
		head={ name="Rawhide Mask"},
		hands={ name="Regal Gauntlets"},
		body={ name="Runeist Coat +4"},
		waist={ name="Fucho-no-obi"}, 
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
		main={ name="Lionheart"},
	}
	sets.weapons.Epeolatry = {
		main={ name="Epeolatry"},
	}
	sets.weapons.Montante = {
		main={ name="Montante +1"},
	}
	sets.weapons.LoxoticMace = {
		main={ name="Loxotic Mace +1"}, 
	}
	sets.weapons.Dolichenus = {
		main={ name="Dolichenus"},
	}
	sets.weapons.Greataxe = {
		main={ name="Kaja Chopper",},
	}
		
	-- Defense Sets
	
	sets.defense.PDT = {
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Turms Cap +1"},
		body={ name="Runeist Coat +4",},
		hands={ name="Turms Mittens +1"},
		legs={ name="Eri. Leg Guards +3"},
		feet={ name="Turms Leggings +1"},
		neck={ name="Futhark torque +2"},
		waist={ name="Engraved Belt"},
		ear1={ name="Eabani Earring"},
		ear2={ name="Genmei Earring"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Murky Ring"},
		back=gear.Ogma_Emnity,
	}
	sets.defense.PDT_HP = {
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Turms Cap +1"},
		body={ name="Runeist Coat +4",},
		hands={ name="Turms Mittens +1"},
		legs={ name="Eri. Leg Guards +3"},
		feet={ name="Turms Leggings +1"},
		neck={ name="Futhark torque +2"},
		waist={ name="Engraved Belt"},
		ear1={ name="Eabani Earring"},
		ear2={ name="Genmei Earring"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Murky Ring"},
		back=gear.Ogma_Emnity, 
	}
	sets.defense.MDT = {
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Aya. Zucchetto +1"},
		body={ name="Runeist Coat +4",},
		hands={ name="Aya. Manopolas +1"},
		legs={ name="Aya. Cosciales +2"},
		feet={ name="Aya. Gambieras +1"},
		neck={ name="Futhark torque +2"},
		waist={ name="Engraved Belt"},
		ear1={ name="Etiolation Earring"},
		ear2={ name="Odnowa Earring +1"},
		ring1={ name="Fortified Ring"},
		ring2={ name="Murky Ring"},
		back=gear.Ogma_Emnity,
	}
	sets.defense.MDT_HP = {
		ammo={ name="Staunch Tathlum +1",},
		head={ name="Aya. Zucchetto +1"},
		body={ name="Runeist Coat +4",},
		hands={ name="Aya. Manopolas +1"},
		legs={ name="Aya. Cosciales +2"},
		feet={ name="Aya. Gambieras +1"},
		neck={ name="Futhark torque +2"},
		waist={ name="Engraved Belt"},
		ring1={ name="Fortified Ring"},
		ring2={ name="Murky Ring"},
		ear1={ name="Etiolation Earring"},
		ear2={ name="Odnowa Earring +1"},
		back=gear.Ogma_Emnity,
	}	
	sets.defense.BDT = {
		ammo={ name="Staunch Tathlum +1"},
        head={ name="Erilaz Galea +3"},
		neck={ name="Futhark torque +2"},
		body={ name="Runeist Coat +4",},
		hands=gear.herculean_dt_hands,
		waist={ name="Engraved Belt"},
		legs=gear.herculean_dt_legs,
		feet={ name="Erilaz Greaves +3"},
		ring1={ name="Shadow Ring"},
		ring2={ name="Murky Ring"},
		ear1={ name="Sanare Earring"},
		ear2={ name="Odnowa Earring +1"},
        back=gear.Ogma_Emnity,
	}
	sets.defense.BDT_HP = {
		ammo={ name="Staunch Tathlum +1"},
        head={ name="Erilaz Galea +3"},
		neck={ name="Futhark torque +2"},
		body={ name="Runeist Coat +4",},
		hands=gear.herculean_dt_hands,
		waist={ name="Engraved Belt"},
		legs={ name="Eri. Leg Guards +3"},
		feet={ name="Erilaz Greaves +3"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Moonbeam Ring"},
		ear1={ name="Tuisto Earring"},
		ear2={ name="Odnowa Earring +1"},
        back=gear.Ogma_Emnity,
	}
	
	sets.defense.MEVA = {
		ammo={ name="Staunch Tathlum +1"},
        head={ name="Erilaz Galea +3"},
		neck={ name="Warder's Charm +1"},
		body={ name="Runeist Coat +4",},
		hands={ name="Erilaz Gauntlets +1"},
		waist={ name="Engraved Belt"},
		legs={ name="Rune. Trousers +3"},
		feet={ name="Erilaz Greaves +3"},
		ring1={ name="Purity Ring"},
		ring2={ name="Vengeful Ring"},
		ear1={ name="Sanare Earring"},
		ear2={ name="Odnowa Earring +1"},
        back=gear.Ogma_Emnity,
	}
	sets.defense.MEVA_HP = {
		ammo={ name="Staunch Tathlum +1"},
        head={ name="Erilaz Galea +3"},
		neck={ name="Warder's Charm +1"},
		body={ name="Runeist Coat +4",},
		hands={ name="Erilaz Gauntlets +1"},
		waist={ name="Engraved Belt"},
		legs={ name="Rune. Trousers +3"},
		feet={ name="Erilaz Greaves +3"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Moonbeam Ring"},
		ear1={ name="Sanare Earring"},
		ear2={ name="Odnowa Earring +1"},
        back=gear.Ogma_Emnity,
	}
	sets.defense.Death = {
		ammo={ name="Staunch Tathlum +1"},
        head={ name="Erilaz Galea +3"},
		neck={ name="Warder's Charm +1"},
		body={ name="Runeist Coat +4",},
		hands={ name="Erilaz Gauntlets +1"},
		waist={ name="Engraved Belt"},
		legs={ name="Rune. Trousers +3"},
		feet={ name="Erilaz Greaves +3"},
		ring1={ name="Purity Ring"},
		ring2={ name="Vengeful Ring"},
		ear1={ name="Sanare Earring"},
		ear2={ name="Odnowa Earring +1"},
        back=gear.Ogma_Emnity,
	}
	sets.defense.DTCharm = {
		ammo={ name="Staunch Tathlum +1"},
        head={ name="Erilaz Galea +3"},
		neck={ name="Unmoving Collar +1"},
		body={ name="Runeist Coat +4",},
		hands={ name="Erilaz Gauntlets +1"},
		waist={ name="Engraved Belt"},
		legs={ name="Rune. Trousers +3"},
		feet={ name="Erilaz Greaves +3"},
		ring1={ name="Murky Ring"},
		ring2={ name="Dark Ring"},
		ear1={ name="Sanare Earring"},
		ear2={ name="Odnowa Earring +1"},
        back=gear.Ogma_Emnity,
	}		
	sets.defense.Charm = {
		aammo={ name="Staunch Tathlum +1"},
        head={ name="Erilaz Galea +3"},
		neck={ name="Unmoving Collar +1"},
		body={ name="Runeist Coat +4",},
		hands={ name="Erilaz Gauntlets +1"},
		waist={ name="Engraved Belt"},
		legs={ name="Rune. Trousers +3"},
		feet={ name="Erilaz Greaves +3"},
		ring1={ name="Purity Ring"},
		ring2={ name="Vengeful Ring"},
		ear1={ name="Sanare Earring"},
		ear2={ name="Odnowa Earring +1"},
        back=gear.Ogma_Emnity,
	}	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {
		ear1={ name="Brutal Earring"},
	}
	sets.AccMaxTP = {
		ear1={ name="Telos Earring"},
	}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

    sets.engaged = {
		sub={ name="Refined Grip +1"},
		ammo={ name="Staunch Tathlum +1"},
		head={ name="Turms Cap +1"},
		body={ name="Runeist Coat +4",},
		hands={ name="Turms Mittens +1"},
		legs={ name="Eri. Leg Guards +3"},
		feet={ name="Turms Leggings +1"},	
		neck={ name="Futhark torque +2"},
		waist={ name="Engraved Belt"},
		ear1={ name="Alabaster Earring"},
		ear2={ name="Sherida Earring"},
		ring1={ name="Moonbeam Ring"},
		ring2={ name="Murky Ring"},
		back=gear.Ogma_DEXFITE,
	}
    sets.engaged.SomeAcc = {
		sub={ name="Refined Grip +1"},
		ammo={ name="Staunch Tathlum +1"},
		head={ name="Turms Cap +1"},
		body={ name="Runeist Coat +4",},
		hands={ name="Turms Mittens +1"},
		legs={ name="Eri. Leg Guards +3"},
		feet={ name="Turms Leggings +1"},	
		neck={ name="Futhark torque +2"},
		waist={ name="Engraved Belt"},
		ear1={ name="Alabaster Earring"},
		ear2={ name="Sherida Earring"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Murky Ring"},
		back=gear.Ogma_DEXFITE,
	}
	sets.engaged.Acc = {
		sub={ name="Utu Grip"},
		ammo={ name="Staunch Tathlum +1"},
		head={ name="Turms Cap +1"},
		body={ name="Runeist Coat +4",},
		hands={ name="Turms Mittens +1"},
		legs={ name="Eri. Leg Guards +3"},
		feet={ name="Turms Leggings +1"},	
		neck={ name="Futhark torque +2"},
		waist={ name="Engraved Belt"},
		ear1={ name="Alabaster Earring"},
		ear2={ name="Sherida Earring"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Murky Ring"},
		back=gear.Ogma_DEXFITE,
	}
	sets.engaged.HighAcc = {
		sub={ name="Utu Grip"},
		ammo={ name="Staunch Tathlum +1"},
		head={ name="Turms Cap +1"},
		body={ name="Runeist Coat +4",},
		hands={ name="Turms Mittens +1"},
		legs={ name="Eri. Leg Guards +3"},
		feet={ name="Turms Leggings +1"},
		neck={ name="Futhark torque +2"},
		waist={ name="Engraved Belt"},
		ear1={ name="Alabaster Earring"},
		ear2={ name="Sherida Earring"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Murky Ring"},
		back=gear.Ogma_DEXFITE,
	}
	sets.engaged.FullAcc = {
		sub={ name="Utu Grip"},
		ammo={ name="Staunch Tathlum +1"},
		head={ name="Turms Cap +1"},
		body={ name="Runeist Coat +4",},
		hands={ name="Turms Mittens +1"},
		legs={ name="Eri. Leg Guards +3"},
		feet={ name="Turms Leggings +1"},
		neck={ name="Futhark torque +2"},
		waist={ name="Engraved Belt"},
		ear1={ name="Alabaster Earring"},
		ear2={ name="Sherida Earring"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Murky Ring"},
		back=gear.Ogma_DEXFITE,
	}
    sets.engaged.DTLite = {
		sub={ name="Utu Grip"},
		ammo={ name="Staunch Tathlum +1"},
		head={ name="Adhemar Bonnet +1"},
		body={ name="Ashera Harness"},
		hands={ name="Adhemar Wrist. +1"},
		legs={ name="Nyame Flanchard"},
		feet={ name="Turms Leggings +1"},
		neck={ name="Anu Torque"},
		waist={ name="Sailfi Belt +1"},
		ear1={ name="Alabaster Earring"},
		ear2={ name="Sherida Earring"},
		ring1={ name="Moonbeam Ring"},
		ring2={ name="Murky Ring"},
		back=gear.Ogma_DEXFITE,
	}
    sets.engaged.SomeAcc.DTLite = {
		sub={ name="Utu Grip"},
		ammo={ name="Staunch Tathlum +1"},
		head={ name="Adhemar Bonnet +1"},
		body={ name="Ashera Harness"},
		hands={ name="Adhemar Wrist. +1"},
		legs={ name="Nyame Flanchard"},
		feet={ name="Turms Leggings +1"},
		neck={ name="Anu Torque"},
		waist={ name="Sailfi Belt +1"},
		ear1={ name="Alabaster Earring"},
		ear2={ name="Sherida Earring"},
		ring1={ name="Moonbeam Ring"},
		ring2={ name="Murky Ring"},
		back=gear.Ogma_DEXFITE,
	}
	sets.engaged.Acc.DTLite = {
		sub={ name="Utu Grip"},
		ammo={ name="Staunch Tathlum +1"},
		head={ name="Adhemar Bonnet +1"},
		body={ name="Ashera Harness"},
		hands={ name="Adhemar Wrist. +1"},
		legs={ name="Nyame Flanchard"},
		feet={ name="Turms Leggings +1"},
		neck={ name="Anu Torque"},
		waist={ name="Sailfi Belt +1"},
		ear1={ name="Alabaster Earring"},
		ear2={ name="Sherida Earring"},
		ring1={ name="Moonbeam Ring"},
		ring2={ name="Murky Ring"},
		back=gear.Ogma_DEXFITE,
	}
	sets.engaged.HighAcc.DTLite = {
		sub={ name="Utu Grip"},
		ammo={ name="Staunch Tathlum +1"},
		head={ name="Adhemar Bonnet +1"},
		body={ name="Ashera Harness"},
		hands={ name="Adhemar Wrist. +1"},
		legs={ name="Nyame Flanchard"},
		feet={ name="Turms Leggings +1"},
		neck={ name="Anu Torque"},
		waist={ name="Sailfi Belt +1"},
		ear1={ name="Alabaster Earring"},
		ear2={ name="Sherida Earring"},
		ring1={ name="Moonbeam Ring"},
		ring2={ name="Murky Ring"},
		back=gear.Ogma_DEXFITE,
	}
	sets.engaged.FullAcc.DTLite = {
		sub={ name="Utu Grip"},
		ammo={ name="Staunch Tathlum +1"},
		head={ name="Adhemar Bonnet +1"},
		body={ name="Ashera Harness"},
		hands={ name="Adhemar Wrist. +1"},
		legs={ name="Nyame Flanchard"},
		feet={ name="Turms Leggings +1"},
		neck={ name="Anu Torque"},
		waist={ name="Sailfi Belt +1"},
		ear1={ name="Alabaster Earring"},
		ear2={ name="Sherida Earring"},
		ring1={ name="Moonbeam Ring"},
		ring2={ name="Murky Ring"},
		back=gear.Ogma_DEXFITE,
	}
	
	sets.engaged.Damage = {
		sub={ name="Utu Grip"},
		ammo={ name="Yamarang"},
		head={ name="Adhemar Bonnet +1"},
		body={ name="Ashera Harness"},
		hands={ name="Adhemar Wrist. +1"},
		legs={ name="Nyame Flanchard"},
		feet=gear.herculean_TA_feet,
		neck={ name="Anu Torque"},
		waist={ name="Sailfi Belt +1"},
		ear1={ name="Alabaster Earring"},
		ear2={ name="Sherida Earring"},
		ring1={ name="Hetairoi Ring"},
		ring2={ name="Niqmaddu Ring",},
		back=gear.Ogma_DEXFITE,
	}

	sets.engaged.SomeAcc.Damage = sets.engaged.Damage
	sets.engaged.Acc.Damage = sets.engaged.Damage
	sets.engaged.HighAcc.Damage = sets.engaged.Damage
	sets.engaged.FullAcc.Damage = sets.engaged.Damage

    sets.engaged.Tank = {
		sub={ name="Refined Grip +1"},
		ammo={ name="Staunch Tathlum +1"},
		head={ name="Turms Cap +1"},
		body={ name="Runeist Coat +4",},
		hands={ name="Turms Mittens +1"},
		legs={ name="Eri. Leg Guards +3"},
		feet={ name="Turms Leggings +1"},
		neck={ name="Futhark torque +2"},
		waist={ name="Flume Belt +1"},
		ear1={ name="Alabaster Earring"},
		ear2={ name="Eabani Earring"},
		ring1={ name="Moonbeam Ring"},
		ring2={ name="Murky Ring"},
		back=gear.Ogma_DEXFITE,
	}

	sets.engaged.SomeAcc.Tank = sets.engaged.Tank
	sets.engaged.Acc.Tank = sets.engaged.Tank
	sets.engaged.HighAcc.Tank = sets.engaged.Tank
	sets.engaged.FullAcc.Tank = sets.engaged.Tank
	
	sets.engaged.Parry = {
		sub={ name="Refined Grip +1"},
		ammo={ name="Staunch Tathlum +1"},
		head={ name="Turms Cap +1"},
		body={ name="Runeist Coat +4",},
		hands={ name="Turms Mittens +1"},
		legs={ name="Eri. Leg Guards +3"},
		feet={ name="Turms Leggings +1"},
		neck={ name="Futhark torque +2"},
		waist={ name="Engraved Belt"},
		ear1={ name="Alabaster Earring"},
		ear2={ name="Eabani Earring"},
		ring1={ name="Moonbeam Ring"},
		ring2={ name="Murky Ring"},
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
		head={ name="Frenzy Sallet"},
	}
	sets.buff.Battuta = {
		hands={name="Turms Mittens +1"},
	}
	sets.buff.Embolden = {
		back={ name="Evasionist's Cape"},
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
