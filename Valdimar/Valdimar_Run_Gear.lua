function user_job_setup()

	state.OffenseMode:options('Normal','Acc','FullAcc')
	state.HybridMode:options('Normal','DTLite','Tank')
	state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','HighAcc','FullAcc')
	state.CastingMode:options('Normal','SIRD')
	state.PhysicalDefenseMode:options('PDT_HP','PDT')
	state.MagicalDefenseMode:options('MDT_HP','BDT_HP','MDT','BDT')
	state.ResistDefenseMode:options('MEVA_HP','MEVA','Death','Charm','DTCharm')
	state.IdleMode:options('Normal','Tank','KiteTank','Sphere')
	state.Weapons:options('None','Aettir','Lionheart','Epeolatry')
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
	
	send_command('bind ^\\\\ input /ma "Refresh" <me>')
	send_command('bind @\\\\ input /ma "Aquaveil" <me>')
	send_command('bind !\\\\ input /ma "Crusade" <me>')
	send_command('bind @t input /ma "Refresh" <st>')
	
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
		sub={ name="Utu Grip"},
		ammo={ name="Aqreqaq Bomblet"},
		head={ name="Turms Cap +1"},
		body={ name="Emet Harness +1"},
		hands={ name="Kurys Gloves"},
		legs={ name="Eri. Leg Guards +1"},
		feet={ name="Ahosi Leggings"},
		neck={ name="Moonbeam Necklace"},
		waist={ name="Kasiri Belt"},
		ear1={ name="Cryptic Earring"},
		ear2={ name="Telos Earring"},
		ring1={ name="Begrudging Ring"},
		ring2={ name="Pernicious Ring"},
		back=gear.Ogma_Emnity
	}
		 
    sets.Enmity.SIRD = {
		sub={ name="Utu Grip"},
		ammo={ name="Staunch Tathlum"},
		head={ name="Meghanada Visor +2"},
		neck={ name="Loricate Torque +1"},
		ear1={ name="Genmei Earring"},
		ear2={ name="Trux Earring",
		body={ name="Emet Harness +1"},
		hands=gear.herculean_dt_hands,
		ring1={ name="Moonbeam Ring"},
		ring2={ name="Defending Ring"},
		back=gear.Ogma_Emnity,
		waist={ name="Audumbla Sash",
		legs=gear.CarmineLegs_HP,
		feet={ name="Erilaz Greaves +1"},
	}
		
    sets.Enmity.SIRDT = {
		sub={ name="Utu Grip"},
		ammo={ name="Staunch Tathlum"},
        head={ name="Fu. Bandeau +1"},
		neck={ name="Loricate Torque +1"},
		ear1={ name="Tuisto Earring"},
		ear2={ name="Odnowa Earring +1"},
        body={ name="Emet Harness +1"},
		hands=gear.herculean_dt_hands,
		ring1={ name="Moonbeam Ring"},
		ring1={ name="Gelatinous Ring +1"},
		back={ name="Moonlight Cape",
		waist={ name="Audumbla Sash",
		legs=gear.CarmineLegs_HP,
		feet={ name="Erilaz Greaves +1"},
	}

    sets.Enmity.DT = {
		sub={ name="Utu Grip"},
		ammo={ name="Staunch Tathlum"},
        head={ name=Fu. Bandeau +1",
		neck={ name="Loricate Torque +1"},
		ear1={ name="Tuisto Earring"},
		ear2={ name="Odnowa Earring +1"},
        body={ name="Emet Harness +1"},
		hands=gear.herculean_dt_hands,
		ring1={ name="Moonbeam Ring"},
		ring1={ name="Gelatinous Ring +1"},
        back={ name="Moonlight Cape",
		waist={ name="Flume Belt +1",
		legs={ name="Eri. Leg Guards +1",
		feet={ name="Erilaz Greaves +1"},
	}
		
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Item sets.

	-- Precast sets to enhance JAs
	sets.precast.JA['Vallation'] = set_combine(sets.Enmity, { 
		body={ name="Runeist's Coat +3"},
		legs={ name="Futhark Trousers +3"}, }
	)
	
    sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
	
    sets.precast.JA['Pflug'] = set_combine(sets.Enmity, {
		feet={ name="Runeist Boots +2"}, }
	)
	
    sets.precast.JA['Battuta'] = set_combine(sets.Enmity, {
		head={ name="Futhark Bandeau +1"}, }
	)
	
    sets.precast.JA['Liement'] = set_combine(sets.Enmity, {
		body={ name="Futhark Coat +1"}, }
	)
    sets.precast.JA['Gambit'] = set_combine(sets.Enmity, {
		hands={ name="Runeist's Mitons +2"}, }
	)
	
    sets.precast.JA['Rayke'] = set_combine(sets.Enmity, {
		feet={ name="Futhark Boots +1"}, }
	)
	
    sets.precast.JA['Elemental Sforzo'] = {
		body={ name="Futhark Coat +1"}, 
	}
	
    sets.precast.JA['Swordplay'] = set_combine(sets.Enmity, {
		hands={ name="Futhark Mitons +1"}, }
	)
	
    sets.precast.JA['Embolden'] = {
		back=gear.Evasion_Cape,
	}
	
    sets.precast.JA['Vivacious Pulse'] = set_combine(sets.Enmity, {
		head={ name="Erilaz Galea +1"},
		legs={ name="Rune. Trousers +2"},
		waist={ name="Bishop Sash"},
		back={ name="Altruistic Cape"},
		ear1={ name="Saxnot Earring"}, }
	)
	
    sets.precast.JA['One For All'] = sets.enmity
	
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
		ammo={ name="Ghastly Tathlum"},
		head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+24','Weapon skill damage +3%','INT+3','Mag. Acc.+15',}},
		body={ name="Samnuha Coat", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+5','"Dual Wield"+5',}},
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs={ name="Limbo Trousers"},
		feet={ name="Herculean Boots", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Enmity-1','INT+9','Mag. Acc.+6','"Mag.Atk.Bns."+14',}},
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
		head={ name="Pixie Hairpin +1",
		ring2={ name="Archon Ring"
	}

	-- Pulse sets, different stats for different rune modes, stat aligned.
    sets.precast.JA['Vivacious Pulse'] = {
		head={ name="Erilaz Galea +1"},
		neck={ name="Incanter's Torque",
		ring1={ name="Stikini Ring +1",
		ring2={ name="Stikini Ring +1",
		legs={ name="Rune. Trousers +2"},
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
		ammo={ name="Yamarang",
        head=gear.CarmineMArk_FC,
		neck={ name="Unmoving Collar +1",
		ear1={ name="Enchntr. Earring +1",
		ear2={ name="Handler's Earring +1",
        body=gear.herculean_waltz_body,
		hands=gear.herculean_waltz_hands,
		ring1={ name="Valseur's Ring",
		ring2={ name="Defending Ring"},
        back={ name="Moonlight Cape",
		waist={ name="Chaac Belt",
		legs={ name="Dashing Subligar",
		feet=gear.herculean_waltz_feet
	}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
	
    sets.precast.Step = {}
		
	sets.precast.JA['Violent Flourish'] = {}
		
	-- Fast cast sets for spells
    sets.precast.FC = {
		ammo={ name="Impatiens",
		head={ name="Rune. Bandeau +2", priority=1},
		neck={ name="Voltsurge Torque",
		ear1={ name="Enchntr. Earring +1",
		ear2={ name="Loquac. Earring",
		body={ name="Dread Jupon",
		hands={ name="Leyline Gloves",
		ring1={ name="Lebeche Ring",
		ring2={ name="Kishar Ring", priority=2},
		back={ name="Moonlight Cape",
		waist={ name="Audumbla Sash",
		legs={ name="Rawhide Trousers",
		feet={ name="Carmine Greaves +1", priority=4},
	}
			
	sets.precast.FC.DT = {
		ammo={ name="Impatiens",
        head={ name="Rune. Bandeau +2"},
		neck={ name="Loricate Torque +1"},
		ear1={ name="Tuisto Earring"},
		ear2={ name="Odnowa Earring +1"},
        body={ name="Runeist's Coat +3"},
		hands={ name="Leyline Gloves",
		ring1={ name="Moonbeam Ring"},
		ring1={ name="Gelatinous Ring +1"},
        back={ name="Moonlight Cape",
		waist={ name="Audumbla Sash",
		legs={ name="Eri. Leg Guards +1",
		feet={ name="Carmine Greaves +1"
	}
		
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
		waist={ name="Siegel Sash",
		legs={ name="Futhark Trousers +1"
	} )
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
		neck='Magoraga Beads'
	} )
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	-- Weaponskill sets
	sets.precast.WS = {
		ammo={ name="Knobkierrie"},
		head={ name="Halitus Helm"},
		body={ name="Ashera Harness",},
		hands={ name="Kurys Gloves"},
		legs={ name="Eri. Leg Guards"},
		feet={ name="Erilaz Greaves +1"},
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
        head={ name="Adhemar Bonnet +1",
		neck={ name="Fotia Gorget",
		ear1={ name="Moonshade Earring",
		ear2={ name="Sherida Earring"},
        body={ name="Ayanmo Corazza +2"},
		hands={ name="Meg. Gloves +2"},
		ring1={ name="Niqmaddu Ring"},
		ring2={ name="Regal Ring",
        back=gear.Ogma_STRDA,
		waist={ name="Fotia Belt",
		legs={ name="Meg. Chausses +2"},
		feet=gear.herculean_TA_feet,
	}
	sets.precast.WS.Acc = {
		ammo={ name="C. Palug Stone",
		head={ name="Dampening Tam",
		neck={ name="Fotia Gorget",
		ear1={ name="Moonshade Earring",
		ear2={ name="Sherida Earring"},
		body={ name="Ayanmo Corazza +2"},
		hands={ name="Meg. Gloves +2"},
		ring1={ name="Niqmaddu Ring"},
		ring2={ name="Regal Ring",
		back=gear.Ogma_STRDA,
		waist={ name="Fotia Belt",
		legs={ name="Meg. Chausses +2"},
		feet=gear.herculean_TA_feet
	}
	sets.precast.WS.HighAcc = {
		ammo={ name="C. Palug Stone",
		head={ name="Meghanada Visor +2"},
		neck={ name="Fotia Gorget",
		ear1={ name="Telos Earring"},
		ear2={ name="Sherida Earring"},
		body={ name="Ayanmo Corazza +2"},
		hands={ name="Meg. Gloves +2"},
		ring1={ name="Niqmaddu Ring"},
		ring2={ name="Regal Ring",
		back=gear.Ogma_STRDA,
		waist={ name="Fotia Belt",
		legs={ name="Meg. Chausses +2"},
		feet=gear.herculean_acc_feet
	}
	sets.precast.WS.FullAcc = {
		ammo={ name="C. Palug Stone",
		head=gear.CarmineMArk_FC,
		neck={ name="Combatant's Torque",
		ear1={ name="Telos Earring"},
		ear2={ name="Mache Earring +1"},
		body={ name="Meg. Cuirie +2"},
		hands={ name="Meg. Gloves +2"},
		ring1={ name="Ramuh Ring +1",
		ring2={ name="Ramuh Ring +1",
		back=gear.stp_jse_back,
		waist={ name="Fotia Belt",
		legs={ name="Meg. Chausses +2"},
		feet=gear.herculean_acc_feet
	}

    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS,{
		head=gear.herculean_TA_head,
		body=gear.herculean_TA_body,
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20'}},
		legs={ name="Taeon Tights"},
		feet=gear.herculean_TA_feet,
		ring1={ name="Niqmaddu Ring"},
	} )
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc,{
		head=gear.herculean_TA_head,
		body=gear.herculean_TA_body,
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20'}},
		legs={ name="Taeon Tights"},
		feet=gear.herculean_TA_feet,
		ring1={ name="Niqmaddu Ring"},
	})
    sets.precast.WS['Resolution'].HighAcc = set_combine(sets.precast.WS.HighAcc,{
		head=gear.herculean_TA_head,
		body=gear.herculean_TA_body,
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20'}},
		legs={ name="Taeon Tights"},
		feet=gear.herculean_TA_feet,
		ring1={ name="Niqmaddu Ring"},
	} )
	sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc,{
		head=gear.herculean_TA_head,
		body=gear.herculean_TA_body,
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20'}},
		legs={ name="Taeon Tights"},
		feet=gear.herculean_TA_feet,
		ring1={ name="Niqmaddu Ring"},
	} )

    sets.precast.WS['Dimidiation'] = set_combine(sets.precast.WS,{
		sub={ name="Utu Grip"},	
		ammo={ name="Knobkierrie"},
		neck={ name="Anu Torque"},
		head=gear.herculean_TA_head,		
		body=gear.herculean_TA_body,
		hands={ name="Meg. Gloves +2"},
		legs={ name="Lustr. Subligar +1", augments={'Attack+20','STR+8','"Dbl.Atk."+3'}},
		feet={ name="Lustra. Leggings +1", augments={'Attack+20','STR+8','"Dbl.Atk."+3'}},
		waist={ name="Ioskeha Belt"},
		ear1={ name="Ishvara Earring"},
		ear2={ name="Sherida Earring"},
		ring1={ name="Petrov Ring"},
		ring2={ name="Niqmaddu Ring"},
		back=gear.Ogma_DEXWSD,
	} )
    sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS.Acc,{
		sub={ name="Utu Grip"},	
		ammo={ name="Knobkierrie"},
		neck={ name="Anu Torque"},
		head=gear.herculean_TA_head,		
		body=gear.herculean_TA_body,
		hands={ name="Meg. Gloves +2"},
		legs={ name="Lustr. Subligar +1", augments={'Attack+20','STR+8','"Dbl.Atk."+3'}},
		feet={ name="Lustra. Leggings +1", augments={'Attack+20','STR+8','"Dbl.Atk."+3'}},
		waist={ name="Ioskeha Belt"},
		ear1={ name="Ishvara Earring"},
		ear2={ name="Sherida Earring"},
		ring1={ name="Petrov Ring"},
		ring2={ name="Niqmaddu Ring"},
		back=gear.Ogma_DEXWSD,
	} )
	sets.precast.WS['Dimidiation'].HighAcc = set_combine(sets.precast.WS.HighAcc,{
		sub={ name="Utu Grip"},	
		ammo={ name="Knobkierrie"},
		neck={ name="Anu Torque"},
		head=gear.herculean_TA_head,		
		body=gear.herculean_TA_body,
		hands={ name="Meg. Gloves +2"},
		legs={ name="Lustr. Subligar +1", augments={'Attack+20','STR+8','"Dbl.Atk."+3'}},
		feet={ name="Lustra. Leggings +1", augments={'Attack+20','STR+8','"Dbl.Atk."+3'}},
		waist={ name="Ioskeha Belt"},
		ear1={ name="Ishvara Earring"},
		ear2={ name="Sherida Earring"},
		ring1={ name="Petrov Ring"},
		ring2={ name="Niqmaddu Ring"},
		back=gear.Ogma_DEXWSD,
	} )
	sets.precast.WS['Dimidiation'].FullAcc = set_combine(sets.precast.WS.FullAcc,{
		sub={ name="Utu Grip"},	
		ammo={ name="Knobkierrie"},
		neck={ name="Anu Torque"},
		head=gear.herculean_TA_head,		
		body=gear.herculean_TA_body,
		hands={ name="Meg. Gloves +2"},
		legs={ name="Lustr. Subligar +1", augments={'Attack+20','STR+8','"Dbl.Atk."+3'}},
		feet={ name="Lustra. Leggings +1", augments={'Attack+20','STR+8','"Dbl.Atk."+3'}},
		waist={ name="Ioskeha Belt"},
		ear1={ name="Ishvara Earring"},
		ear2={ name="Sherida Earring"},
		ring1={ name="Petrov Ring"},
		ring2={ name="Niqmaddu Ring"},
		back=gear.Ogma_DEXWSD,
	} )
	
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
		--	ammo={ name="Impatiens",
		head=gear.CarmineMask_FC,
		body={ name="Foppish Tunica"},
		hands={ name="Sombra Mittens", priority=2},
		legs={ name="Aya. Cosciales +2"},
		feet={ name="Carmine Greaves +1"},
		neck={ name="Voltsurge Torque"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Kishar Ring"},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%'}},
	}	
	sets.midcast.FastRecast.DT = {
		ammo={ name="Staunch Tathlum"},
        head={ name="Fu. Bandeau +1",
		neck={ name="Loricate Torque +1"},
		ear1={ name="Tuisto Earring"},
		ear2={ name="Odnowa Earring +1"},
        body={ name="Ashera Harness",},
		hands=gear.herculean_dt_hands,
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Moonbeam Ring"},
        back={ name="Moonlight Cape",
		waist={ name="Flume Belt +1",
		legs={ name="Eri. Leg Guards +1",
		feet={ name="Erilaz Greaves +1"},
	}
	sets.midcast.FastRecast.SIRD = {
		ammo={ name="Staunch Tathlum"},
        head={ name="Fu. Bandeau +1",
		neck={ name="Loricate Torque +1"},
		ear1={ name="Tuisto Earring"},
		ear2={ name="Odnowa Earring +1"},
        body={ name="Ashera Harness",},
		hands=gear.herculean_dt_hands,
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Moonbeam Ring"},
        back={ name="Moonlight Cape",
		waist={ name="Flume Belt +1",
		legs={ name="Eri. Leg Guards +1",
		feet={ name="Erilaz Greaves +1"},
	}
    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast,{
		head={ name="Erilaz Galea +1"},
		neck={ name="Incanter's Torque"},
		body={ name="Runeist's Coat +3"},
		hands={ name="Runeist's Mitons +2"},
		waist={ name="Olympus Sash"},
		ear1={ name="Andoaa Earring"},
		ring1={ name="Stikini Ring"},
		ring2={ name="Stikini Ring +1"},
		legs={ name="Futhark Trousers +3"},
		back={ name="Moonbeam Cape"},}
		)
    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{
		ammo={ name="Staunch Tathlum"},
		head={ name="Futhark Bandeau +1"},
		body={ name="Taeon Tabard"},
		hands=gear.herculean_phalanx_hands,
		legs={ name="Taeon Tights"},
		feet={ name="Taeon Boots"},
		waist={ name="Olympus Sash"},
		ear1={ name="Tuisto Earring"},
		ear2={ name="Odnowa Earring +1"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Defending Ring"},
		back={ name="Moonbeam Cape"}, }
	)
    sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'],{
		sub={ name="Utu Grip"},
		neck={ name="Sanctity Necklace"},
		head={ name="Rune. Bandeau +2"},
		hands={ name="Turms Mittens +1"}, }
	) 
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'],{
		head={ name="Erilaz Galea +1",},
		hands={ name="Regal Gauntlets"},
		legs={ name="Futhark Trousers +3"},
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
		ammo={ name="Staunch Tathlum"},
        head=gear.CarmineMArk_FC,
		neck={ name="Sacro Gorget",
		ear1={ name="Mendi. Earring",
		ear2={ name="Roundel Earring",
        body={ name="Vrikodara Jupon",
		hands={ name="Buremte Gloves",
		ring1={ name="Lebeche Ring",
		ring2={ name="Janniston Ring",
        back={ name="Tempered Cape +1",
		waist={ name="Luminary Sash",
		legs={ name="Carmine Cuisses +1",
		feet={ name="Skaoi Boots"
	}
		
	sets.midcast['Wild Carrot'] = set_combine(sets.midcast.Cure, {})
		
	sets.Self_Healing = {
		hands={ name="Buremte Gloves",
		ring2={ name="Kunaji Ring",
		waist={ name="Gishdubar Sash",
		}
	sets.Cure_Received = {
		hands={ name="Buremte Gloves",
		ring2={ name="Kunaji Ring",
		waist={ name="Gishdubar Sash",
	}
	sets.Self_Refresh = {
		head={ name="Erilaz Galea +1",},
		hands={ name="Regal Gauntlets"},
		legs={ name="Futhark Trousers +3"},
		waist={ name="Gishdubar Sash"},
	}
	sets.Phalanx_Received = {
		main="Deacon Sword",
		hands=gear.herculean_phalanx_hands,
		feet=gear.herculean_nuke_feet
	}
	
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {
		ring2={ name="Sheltered Ring",
	} )
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {
		ring2={ name="Sheltered Ring",
	} )

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	sets.resting = {}

    sets.idle = {
		ammo={ name="Staunch Tathlum",},
		head={ name="Turms Cap +1"},
		body={ name="Futhark Coat +3",},
		hands={ name="Turms Mittens +1"},
		legs=gear.CarmineLegs_HP,
		feet={ name="Turms Leggings +1"},
		neck={ name="Loricate Torque +1"},
		waist={ name="Flume Belt +1"},
		ear1={ name="Genmei Earring"},
		ear2={ name="Odnowa Earring +1"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Defending Ring"},
		back=gear.Ogma_Emnity,
	}
		
    sets.idle.Sphere = set_combine(sets.idle,{
		body={ name="Mekosu. Harness"
	} )
			
	sets.idle.Tank = {
		sub={ name="Utu Grip"},
		ammo={ name="Staunch Tathlum",},
		head={ name="Turms Cap +1"},
		body={ name="Futhark Coat +3",},
		hands={ name="Turms Mittens +1"},
		legs={ name="Eri. Leg Guards +1"},
		feet={ name="Turms Leggings +1"},
		neck={ name="Loricate Torque +1"},
		waist={ name="Flume Belt +1"},
		ear1={ name="Genmei Earring"},
		ear2={ name="Odnowa Earring +1"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Defending Ring"},
		back=gear.Ogma_Emnity,
	}

	sets.idle.KiteTank = {
		sub={ name="Utu Grip"},
		ammo={ name="Staunch Tathlum",},
		head={ name="Turms Cap +1"},
		body={ name="Runeist's Coat +3"},
		hands={ name="Turms Mittens +1"},
		legs=gear.CarmineLegs_HP,
		feet={ name="Turms Leggings +1"},
		neck={ name="Loricate Torque +1"},
		waist={ name="Flume Belt +1"},
		ear1={ name="Genmei Earring"},
		ear2={ name="Odnowa Earring +1"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Defending Ring"},
		back=gear.Ogma_Emnity,
	}

	sets.idle.Weak = { }

	sets.Kiting = {		
		sub={ name="Utu Grip"},
		ammo={ name="Staunch Tathlum",},
		head={ name="Turms Cap +1"},
		body={ name="Futhark Coat +3",},
		hands={ name="Turms Mittens +1"},
		legs=gear.CarmineLegs_HP,
		feet={ name="Turms Leggings +1"},
		neck={ name="Loricate Torque +1"},
		waist={ name="Flume Belt +1"},
		ear1={ name="Genmei Earring"},
		ear2={ name="Odnowa Earring +1"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Defending Ring"},
		back=gear.Ogma_Emnity,
	}
	
	sets.latent_refresh = {
		head={ name="Rawhide Mask"},
		body={ name="Runeist's Coat +3"},
		waist={ name="Fucho-no-obi"}, 
	}
	
	sets.latent_refresh_grip = {
		sub={ name="Oneiros Grip"
	}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {}
    sets.MP = {
		ear2={ name="Ethereal Earring",
		body={ name="Erilaz Surcoat +1",
		waist={ name="Flume Belt +1"
	}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Aettir = {
		main={ name="Aettir"},
		sub={ name="Utu Grip"},
	}
	sets.weapons.Lionheart = {
		main="Lionheart",
		sub={ name="Utu Grip"},
	}
	sets.weapons.Epeolatry = {
		main="Epeolatry",
		sub={ name="Utu Grip"},
	}
	
	-- Defense Sets
	
	sets.defense.PDT = {
		sub={ name="Utu Grip"},
		ammo={ name="Staunch Tathlum",},
		head={ name="Turms Cap +1"},
		body={ name="Futhark Coat +3",},
		hands={ name="Turms Mittens +1"},
		legs={ name="Eri. Leg Guards +1"},
		feet={ name="Turms Leggings +1"},
		neck={ name="Loricate Torque +1"},
		waist={ name="Flume Belt +1"},
		ear1={ name="Eabani Earring"},
		ear2={ name="Genmei Earring"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Defending Ring"},
		back=gear.Ogma_Emnity,
	}
	sets.defense.PDT_HP = {
		sub={ name="Utu Grip"},
		ammo={ name="Staunch Tathlum",},
		head={ name="Turms Cap +1"},
		body={ name="Futhark Coat +3",},
		hands={ name="Turms Mittens +1"},
		legs={ name="Eri. Leg Guards +1"},
		feet={ name="Turms Leggings +1"},
		neck={ name="Loricate Torque +1"},
		waist={ name="Flume Belt +1"},
		ear1={ name="Eabani Earring"},
		ear2={ name="Genmei Earring"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Defending Ring"},
		back=gear.Ogma_Emnity, 
	}
	sets.defense.MDT = {
		sub={ name="Utu Grip"},
		ammo={ name="Staunch Tathlum",},
		head={ name="Aya. Zucchetto +1"},
		body={ name="Futhark Coat +3",},
		hands={ name="Aya. Manopolas +1"},
		legs={ name="Aya. Cosciales +2"},
		feet={ name="Aya. Gambieras +1"},
		neck={ name="Futhark torque +1"},
		waist={ name="Flax Sash"},
		ear1={ name="Etiolation Earring"},
		ear2={ name="Odnowa Earring +1"},
		ring1={ name="Fortified Ring"},
		ring2={ name="Defending Ring"},
		back=gear.Ogma_Emnity,
	}
	sets.defense.MDT_HP = {
		sub={ name="Utu Grip"},
		ammo={ name="Staunch Tathlum",},
		head={ name="Aya. Zucchetto +1"},
		body={ name="Futhark Coat +3",},
		hands={ name="Aya. Manopolas +1"},
		legs={ name="Aya. Cosciales +2"},
		feet={ name="Aya. Gambieras +1"},
		neck={ name="Futhark torque +1"},
		waist={ name="Flax Sash"},
		ear1={ name="Etiolation Earring"},
		ear2={ name="Odnowa Earring +1"},
		ring1={ name="Fortified Ring"},
		ring2={ name="Defending Ring"},
		back=gear.Ogma_Emnity,
	}	
	sets.defense.BDT = {
		sub={ name="Utu Grip"},
		ammo={ name="Staunch Tathlum"},
        head={ name="Erilaz Galea +1"},
		neck={ name="Warder's Charm +1",
		ear1={ name="Sanare Earring",
		ear2={ name="Odnowa Earring +1"},
		body={ name="Futhark Coat +3",},
		hands=gear.herculean_dt_hands,
		ring1={ name="Shadow Ring",
		ring2={ name="Defending Ring"},
        back={ name="Moonlight Cape",
		waist={ name="Engraved Belt",
		legs=gear.herculean_dt_legs,
		feet={ name="Erilaz Greaves +1"},
	}
	sets.defense.BDT_HP = {
		sub={ name="Utu Grip"},
		ammo={ name="Staunch Tathlum"},
        head={ name="Erilaz Galea +1"},
		neck={ name="Loricate Torque +1"},
		ear1={ name="Tuisto Earring"},
		ear2={ name="Odnowa Earring +1"},
		body={ name="Futhark Coat +3",},
		hands=gear.herculean_dt_hands,
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Moonbeam Ring"},
        back={ name="Moonlight Cape",
		waist={ name="Engraved Belt",
		legs={ name="Eri. Leg Guards +1",
		feet={ name="Erilaz Greaves +1"},
	}
	
	sets.defense.MEVA = {
		sub={ name="Utu Grip"},
		ammo={ name="Staunch Tathlum"},
        head={ name="Erilaz Galea +1"},
		neck={ name="Warder's Charm +1",
		ear1={ name="Sanare Earring",
		ear2={ name="Odnowa Earring +1"},
		body={ name="Futhark Coat +3",},
		hands={ name="Erilaz Gauntlets +1",
		ring1={ name="Purity Ring",
		ring2={ name="Vengeful Ring",
        back=gear.Ogma_Emnity,
		waist={ name="Engraved Belt",
		legs={ name="Rune. Trousers +2"},
		feet={ name="Erilaz Greaves +1"},
	}
	sets.defense.MEVA_HP = {
		sub={ name="Utu Grip"},
		ammo={ name="Staunch Tathlum"},
        head={ name="Erilaz Galea +1"},
		neck={ name="Warder's Charm +1",
		ear1={ name="Sanare Earring",
		ear2={ name="Odnowa Earring +1"},
		hands={ name="Erilaz Gauntlets +1",
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Moonbeam Ring"},
        back={ name="Moonlight Cape",
		waist={ name="Engraved Belt",
		legs={ name="Rune. Trousers +2"},
		feet={ name="Erilaz Greaves +1"},
	}
	sets.defense.Death = {
		sub={ name="Utu Grip"},
		ammo={ name="Staunch Tathlum"},
        head={ name="Erilaz Galea +1"},
		neck={ name="Warder's Charm +1",
		ear1={ name="Sanare Earring",
		ear2={ name="Odnowa Earring +1"},
		body={ name="Futhark Coat +3",},
		hands={ name="Erilaz Gauntlets +1",
		ring1={ name="Purity Ring",
		ring2={ name="Vengeful Ring",
        back=gear.Ogma_Emnity,
		waist={ name="Engraved Belt",
		legs={ name="Rune. Trousers +2"},
		feet={ name="Erilaz Greaves +1"},
	}
	sets.defense.DTCharm = {
		sub={ name="Utu Grip"},
		ammo={ name="Staunch Tathlum"},
        head={ name="Erilaz Galea +1"},
		neck={ name="Unmoving Collar +1",
		ear1={ name="Sanare Earring",
		ear2={ name="Odnowa Earring +1"},
		body={ name="Futhark Coat +3",},
		hands={ name="Erilaz Gauntlets +1",
		ring1={ name="Defending Ring",
		ring2={ name="Dark Ring",
        back=gear.Ogma_Emnity,
		waist={ name="Engraved Belt",
		legs={ name="Rune. Trousers +2"},
		feet={ name="Erilaz Greaves +1"},
	}		
	sets.defense.Charm = {
		sub={ name="Utu Grip"},
		aammo={ name="Staunch Tathlum"},
        head={ name="Erilaz Galea +1"},
		neck={ name="Unmoving Collar +1",
		ear1={ name="Sanare Earring",
		ear2={ name="Odnowa Earring +1"},
		body={ name="Futhark Coat +3",},
		hands={ name="Erilaz Gauntlets +1",
		ring1={ name="Purity Ring",
		ring2={ name="Vengeful Ring",
        back=gear.Ogma_Emnity,
		waist={ name="Engraved Belt",
		legs={ name="Rune. Trousers +2"},
		feet={ name="Erilaz Greaves +1"},
	}	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {
		ear1={ name="Brutal Earring"
	}
	sets.AccMaxTP = {
		ear1={ name="Telos Earring"
	}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

    sets.engaged = {
		sub={ name="Utu Grip"},
		ammo={ name="Yamarang"},
		head={ name="Turms Cap +1"},
		body={ name="Futhark Coat +3",},
		hands={ name="Turms Mittens +1"},
		legs={ name="Eri. Leg Guards +1"},
		feet={ name="Turms Leggings +1"},	
		neck={ name="Loricate Torque +1"},
		waist={ name="Ioskeha belt"},
		ear1={ name="Telos Earring"},
		ear2={ name="Odnowa Earring +1"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Defending Ring"},
		back=gear.Ogma_DEXFITE,
	}
    sets.engaged.SomeAcc = {
		sub={ name="Utu Grip"},
		ammo={ name="Yamarang"},
		head={ name="Turms Cap +1"},
		body={ name="Futhark Coat +3",},
		hands={ name="Turms Mittens +1"},
		legs={ name="Eri. Leg Guards +1"},
		feet={ name="Turms Leggings +1"},	
		neck={ name="Loricate Torque +1"},
		waist={ name="Ioskeha belt"},
		ear1={ name="Telos Earring"},
		ear2={ name="Odnowa Earring +1"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Defending Ring"},
		back=gear.Ogma_DEXFITE,
	}
	sets.engaged.Acc = {
		sub={ name="Utu Grip"},
		ammo={ name="Yamarang"},
		head={ name="Turms Cap +1"},
		body={ name="Futhark Coat +3",},
		hands={ name="Turms Mittens +1"},
		legs={ name="Eri. Leg Guards +1"},
		feet={ name="Turms Leggings +1"},	
		neck={ name="Defiant Collar"},
		waist={ name="Ioskeha belt"},
		ear1={ name="Telos Earring"},
		ear2={ name="Odnowa Earring +1"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Defending Ring"},
		back=gear.Ogma_DEXFITE,
	}
	sets.engaged.HighAcc = {
		sub={ name="Utu Grip"},
		ammo={ name="Yamarang"},
		head={ name="Turms Cap +1"},
		body={ name="Futhark Coat +3",},
		hands={ name="Turms Mittens +1"},
		legs={ name="Eri. Leg Guards +1"},
		feet={ name="Turms Leggings +1"},	
		neck={ name="Defiant Collar"},
		waist={ name="Ioskeha belt"},
		ear1={ name="Telos Earring"},
		ear2={ name="Odnowa Earring +1"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Defending Ring"},
		back=gear.Ogma_DEXFITE,
	}
	sets.engaged.FullAcc = {
		sub={ name="Utu Grip"},
		ammo={ name="Yamarang"},
		head={ name="Turms Cap +1"},
		body={ name="Futhark Coat +3",},
		hands={ name="Turms Mittens +1"},
		legs={ name="Eri. Leg Guards +1"},
		feet={ name="Turms Leggings +1"},	
		neck={ name="Defiant Collar"},
		waist={ name="Ioskeha belt"},
		ear1={ name="Telos Earring"},
		ear2={ name="Odnowa Earring +1"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Defending Ring"},
		back=gear.Ogma_DEXFITE,
	}
    sets.engaged.DTLite = {
		sub={ name="Utu Grip"},
		ammo={ name="Yamarang"},
		head={ name="Turms Cap +1"},
		body={ name="Futhark Coat +3",},
		hands={ name="Turms Mittens +1"},
		legs={ name="Eri. Leg Guards +1"},
		feet={ name="Turms Leggings +1"},	
		neck={ name="Loricate Torque +1"},
		waist={ name="Flume Belt +1"},
		ear1={ name="Telos Earring"},
		ear2={ name="Odnowa Earring +1"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Defending Ring"},
		back=gear.Ogma_DEXFITE,
	}
    sets.engaged.SomeAcc.DTLite = {
		sub={ name="Utu Grip"},
		ammo={ name="Yamarang"},
		head={ name="Turms Cap +1"},
		body={ name="Futhark Coat +3",},
		hands={ name="Turms Mittens +1"},
		legs={ name="Eri. Leg Guards +1"},
		feet={ name="Turms Leggings +1"},	
		neck={ name="Loricate Torque +1"},
		waist={ name="Flume Belt +1"},
		ear1={ name="Telos Earring"},
		ear2={ name="Odnowa Earring +1"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Defending Ring"},
		back=gear.Ogma_DEXFITE,
	}
	sets.engaged.Acc.DTLite = {
		sub={ name="Utu Grip"},
		ammo={ name="Yamarang"},
		head={ name="Turms Cap +1"},
		body={ name="Futhark Coat +3",},
		hands={ name="Turms Mittens +1"},
		legs={ name="Eri. Leg Guards +1"},
		feet={ name="Turms Leggings +1"},	
		neck={ name="Defiant Collar"},
		waist={ name="Flume Belt +1"},
		ear1={ name="Telos Earring"},
		ear2={ name="Odnowa Earring +1"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Defending Ring"},
		back=gear.Ogma_DEXFITE,
	}
	sets.engaged.HighAcc.DTLite = {
		sub={ name="Utu Grip"},
		ammo={ name="Yamarang"},
		head={ name="Turms Cap +1"},
		body={ name="Futhark Coat +3",},
		hands={ name="Turms Mittens +1"},
		legs={ name="Eri. Leg Guards +1"},
		feet={ name="Turms Leggings +1"},	
		neck={ name="Defiant Collar"},
		waist={ name="Flume Belt +1"},
		ear1={ name="Telos Earring"},
		ear2={ name="Odnowa Earring +1"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Defending Ring"},
		back=gear.Ogma_DEXFITE,
	}
	sets.engaged.FullAcc.DTLite = {
		sub={ name="Utu Grip"},
		ammo={ name="Staunch Tathlum",},
		head={ name="Turms Cap +1"},
		body={ name="Futhark Coat +3",},
		hands={ name="Turms Mittens +1"},
		legs={ name="Eri. Leg Guards +1"},
		feet={ name="Turms Leggings +1"},	
		neck={ name="Defiant Collar"},
		waist={ name="Flume Belt +1"},
		ear1={ name="Telos Earring"},
		ear2={ name="Odnowa Earring +1"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Defending Ring"},
		back=gear.Ogma_DEXFITE,
	}
    sets.engaged.Tank = {
		sub={ name="Utu Grip"},
		ammo={ name="Yamarang"},
		head={ name="Turms Cap +1"},
		body={ name="Futhark Coat +3",},
		hands={ name="Turms Mittens +1"},
		legs={ name="Eri. Leg Guards +1"},
		feet={ name="Turms Leggings +1"},	
		neck={ name="Loricate Torque +1"},
		waist={ name="Flume Belt +1"},
		ear1={ name="Telos Earring"},
		ear2={ name="Odnowa Earring +1"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Defending Ring"},
		back=gear.Ogma_DEXFITE,
	}
	sets.engaged.Tank_HP = {
		sub={ name="Utu Grip"},
		ammo={ name="Yamarang"},
		head={ name="Turms Cap +1"},
		body={ name="Futhark Coat +3",},
		hands={ name="Turms Mittens +1"},
		legs={ name="Eri. Leg Guards +1"},
		feet={ name="Turms Leggings +1"},	
		neck={ name="Loricate Torque +1"},
		waist={ name="Flume Belt +1"},
		ear1={ name="Telos Earring"},
		ear2={ name="Odnowa Earring +1"},
		ring1={ name="Gelatinous Ring +1"},
		ring2={ name="Defending Ring"},
		back=gear.Ogma_DEXFITE,
	}
    sets.engaged.SomeAcc.Tank = sets.engaged.Tank
	sets.engaged.Acc.Tank = sets.engaged.Tank
	sets.engaged.HighAcc.Tank = sets.engaged.Tank
	sets.engaged.FullAcc.Tank = sets.engaged.Tank
	
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {
		head={ name="Frenzy Sallet",
	}
	sets.buff.Battuta = {
		hands={name="Turms Mittens +1",
	} }
	sets.buff.Embolden = {
		back={ name="Evasionist's Cape",
	} }
	
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
