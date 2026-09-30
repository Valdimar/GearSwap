-------------------------------------------------------------------------------------------------------------------
-- WAR.lua
-- Simplified from AlanWarren/gearswap WAR.lua
-- Gear intentionally left blank for the user to populate.
-------------------------------------------------------------------------------------------------------------------

local res = require('resources')

function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
end

-------------------------------------------------------------------------------------------------------------------
-- Job setup
-------------------------------------------------------------------------------------------------------------------

function job_setup()
    state.Buff.Berserk = buffactive.Berserk or false
    state.Buff.Retaliation = buffactive.Retaliation or false
    state.Buff.Restraint = buffactive.Restraint or false
    state.Buff.MightyStrikes = buffactive['Mighty Strikes'] or false

    -- Used only to distinguish a weapon in the sub slot from a shield/grip.
    -- Add unusual offhand weapons here only if automatic detection ever needs help.
    no_swap_gear = S{
        "Warp Ring", "Dim. Ring (Dem)", "Dim. Ring (Holla)", "Dim. Ring (Mea)",
        "Trizek Ring", "Echad Ring", "Facility Ring", "Capacity Ring"
    }

    lockstyleset = 2
end

-------------------------------------------------------------------------------------------------------------------
-- User setup
-------------------------------------------------------------------------------------------------------------------

function user_setup()
    state.OffenseMode:options('Normal', 'Acc')
    state.HybridMode:options('Normal', 'DT')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.IdleMode:options('Normal', 'DT', 'Regain')

    state.Auto_Kite = M(false, 'Auto_Kite')
    moving = false

    select_default_macro_book()
    set_lockstyle()

    update_combat_form()
end

function user_unload()
end

-------------------------------------------------------------------------------------------------------------------
-- Gear sets
-------------------------------------------------------------------------------------------------------------------

function init_gear_sets()

    ------------------------------------------------------------------------------------------------
    -- Job Abilities
    ------------------------------------------------------------------------------------------------

    sets.precast.JA['Berserk'] = {feet="Agoge Calligae +1"}
    sets.precast.JA['Warcry'] = {head="Agoge Mask +4", body="Pumm. Lorica +3"}
    sets.precast.JA['Aggressor'] = {head="Pummeler's Mask +1", body="Agoge Lorica +1"}
    sets.precast.JA['Retaliation'] = {hands="Pummeler's Mufflers +1"}
    sets.precast.JA['Restraint'] = {}
    sets.precast.JA['Blood Rage'] = {body="Boii Lorica +3"}
    sets.precast.JA['Tomahawk'] = {}
    sets.precast.JA['Mighty Strikes'] = {}

    sets.precast.JA['Provoke'] = {
	head="Souv. Schaller +1",
	neck="Unmoving Collar +1",
	ear1="Friomisi Earring",
	ear2="Cryptic Earring",
	body="Souv. Cuirass +1",
	hands="Souv. Handsch. +1",
	ring1="Apeile Ring",
	ring2="Apeile Ring +1",
	legs="Souv. Diechlings +1",
	feet="Souveran Schuhs +1"
}

    ------------------------------------------------------------------------------------------------
    -- Fast Cast
    ------------------------------------------------------------------------------------------------

    sets.precast.FC = {
	head="Sakpata's Helm",
	hands="Leyline Gloves",
	neck="Voltsurge Torque",
	left_ear="Loquac. Earring",
	left_ring="Prolix Ring",
	--right_ring="Rahab Ring",
}

    ------------------------------------------------------------------------------------------------
    -- Weapon Skills
    ------------------------------------------------------------------------------------------------

    -- Generic physical WS fallback.
    sets.precast.WS = {
	ammo="Knobkerrie",
	head="Agoge Mask +4",
	neck="War. Beads +1",
	ear1="Thrud Earring",
	ear2="Brutal Earring",
	body="Pumm. Lorica +3",
	hands="Boii Mufflers +3",
	ring1="Regal Ring",
	ring2="Cornelia's Ring",
	back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	waist="Sailfi Belt +1",
	legs="Boii Cuisses +3",
	feet="Sakpata's Leggings"
}

    -- Great Axe
    sets.precast.WS['Upheaval'] = {
	ammo="Knobkerrie",
	head="Agoge Mask +4",
	neck="War. Beads +1",
	ear1="Thrud Earring",
	ear2="Brutal Earring",
	body="Pumm. Lorica +3",
	hands="Boii Mufflers +3",
	ring1="Regal Ring",
	ring2="Niqmaddu Ring",
	back={ name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}},
	waist="Sailfi Belt +1",
	legs="Boii Cuisses +3",
	feet="Sakpata's Leggings"
}
    sets.precast.WS["Ukko's Fury"] = {
	ammo="Yetshila",
	head="Hjarrandi Helm",
	neck="War. Beads +1",
	ear1="Ishvara Earring",
	ear2="Boii Earring +1",
	body="Hjarrandi Breast.",
	hands="Flam. Manopolas +2",
	ring1="Regal Ring",
	ring2="Niqmaddu Ring",
	back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	waist="Sailfi Belt +1",
	legs="Boii Cuisses +3",
	feet="Boii Calligae +3"	
}

    sets.precast.WS["King's Justice"] = set_combine(sets.precast.WS['Upheaval'], {
	back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
})

    sets.precast.WS['Steel Cyclone'] = {
	ammo="Knobkerrie",
	head="Nyame Helm",
	neck="War. Beads +1",
	ear1="Thrud Earring",
	ear2="Ishvara Earring",
	body="Nyame Mail",
	hands="Boii Mufflers +3",
	ring1="Regal Ring",
	ring2="Cornelia's Ring",
	back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	waist="Sailfi belt +1",
	legs="Boii Cuisses +3",
	feet="Nyame Sollerets"
}
    sets.precast.WS['Fell Cleave'] = {
	ammo="Knobkerrie",
	head="Nyame Helm",
	neck="War. Beads +1",
	ear1="Thrud Earring",
	ear2="Ishvara Earring",
	body="Nyame Mail",
	hands="Boii Mufflers +3",
	ring1="Regal Ring",
	ring2="Cornelia's Ring",
	back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	waist="Sailfi belt +1",
	legs="Boii Cuisses +3",
	feet="Nyame Sollerets"}

    sets.precast.WS['Full Break'] = {
	ammo="Pemphredo tathlum",
	head="Sakpata's Helm",
	neck="Sanctity Necklace",
	ear1="Dignitary's Earring",
	ear2="Ishvara Earring",
	body="Sakpata's Plate",
	hands="Sakpata's Gauntlets",
	ring1="Metamor. Ring +1",
	ring2="Stikini Ring",
	back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	legs="Boii Cuisses +3",
	feet="Sakpata's leggings",
}
	

    -- Great Sword
    sets.precast.WS['Resolution'] = {
	ammo="Coiste Bodhar",
	head="Agoge Mask +4",
	neck="Fotia Gorget",
	ear1="Ishvara Earring",
	ear2="Boii Earring +1",
	body="Sakpata's Plate",
	hands="Sakpata's Gauntlets",
	ring1="Regal Ring",
	ring2="Niqmaddu Ring",
	back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	waist="Fotia Belt",
	legs="Boii Cuisses +3",
	feet="Pumm. Calligae +4"
}
    sets.precast.WS['Scourge'] = {
	ammo="Knobkerrie",
	head="Agoge Mask +4",
	neck="War. Beads +1",
	ear1="Ishvara Earring",
	ear2="Thrud Earring",
	body="Sakpata's Plate",
	hands="Boii mufflers +3",
	ring1="Regal Ring",
	ring2="Niqmaddu Ring",
	back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	waist="Sailfi Belt +1",
	legs="Boii Cuisses +3",
	feet="Revelation Sab."
}
    sets.precast.WS['Shockwave'] = {
	ammo="Knobkerrie",
	head="Agoge Mask +4",
	neck="Fotia gorget",
	ear1="Ishvara Earring",
	ear2="Thrud Earring",
	body="Nyame Mail",
	hands="Boii mufflers +3",
	ring1="Regal Ring",
	ring2="Cornelia's Ring",
	back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	waist="Fotia Belt",
	legs="Boii Cuisses +3",
	feet="Nyame Sollerets"}

    sets.precast.WS['Fimbulvetr'] = {}

    -- Sword
    sets.precast.WS['Savage Blade'] = {
	ammo="Knobkerrie",
	head="Agoge Mask +4",
	neck="War. Beads +1",
	ear1="Ishvara Earring",
	ear2="Thrud Earring",
	body="Pumm. Lorica +3",
	hands="Sakpata's Gauntlets",
	ring1="Regal Ring",
	ring2="Cornelia's Ring",
	back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	waist="Sailfi Belt +1",
	legs="Boii Cuisses +3",
	feet="Sakpata's Leggings"
}
    sets.precast.WS['Requiescat'] = {}
    sets.precast.WS['Sanguine Blade'] = {}

    -- Axe
    sets.precast.WS['Decimation'] = {
	ammo="Coiste Bodhar",
	head="Agoge Mask +4",
	neck="War. Beads +1",
	ear1="Cessance Earring",
	ear2="Brutal Earring",
	body="Sakpata's Plate",
	hands="Sakpata's Gauntlets",
	ring1="Regal Ring",
	ring2="Niqmaddu Ring",
	back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	waist="Sailfi Belt +1",
	legs="Boii Cuisses +3",
	feet="Pumm. Calligae +4"
}
    sets.precast.WS['Ruinator'] = {}
    sets.precast.WS['Mistral Axe'] = {
	ammo="Knobkerrie",
	head="Agoge Mask +4",
	neck="War. Beads +1",
	ear1="Ishvara Earring",
	ear2="Thrud Earring",
	body="Pumm. Lorica +3",
	hands="Boii Mufflers +3",
	ring1="Cornelia's Ring",
	ring2="Regal Ring",
	back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	waist="Sailfi Belt +1",
	legs="Boii Cuisses +3",
	feet="Revelation Sab.",
}

    -- Polearm
    sets.precast.WS['Impulse Drive'] = {
	ammo="Yetshila",
	head="Boii Mask +3",
	neck="War. Beads +1",
	ear1="Ishvara Earring",
	ear2="Thrud Earring",
	body="Perfection Plate.",
	hands="Boii Mufflers +3",
	ring1="Regal Ring",
	ring2="Niqmaddu Ring",
	back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	waist="Sailfi Belt +1",
	legs="Boii Cuisses +3",
	feet="Boii Calligae +3"
}
    sets.precast.WS['Sonic Thrust'] = {
	ammo="Yetshila",
	head="Hjarrandi Helm",
	neck="War. Beads +1",
	ear1="Cessance Earring",
	ear2="Thrud Earring",
	body="Hjarrandi Breast.",
	hands="Flam. Manopolas +2",
	ring1="Regal Ring",
	ring2="Cornelia's Ring",
	back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	waist="Sailfi Belt +1",
	legs="Sakpata's Cuisses",
	feet="Sakpata's Leggings"
}
    sets.precast.WS['Stardiver'] = {
	ammo="Yetshila",
	head="Boii Mask +3",
	neck="Fotia Gorget",
	ear1="Ishvara Earring",
	ear2="Thrud Earring",
	body="Revelation Plate.",
	hands="Boii Mufflers +3",
	ring1="Niqmaddu Ring",
	ring2="Cornelia's Ring",
	back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	waist="Fotia Belt",
	legs="Boii Cuisses +3",
	feet="Boii Calligae +3"
}

    -- Club
    sets.precast.WS['Judgement'] = {
	ammo="Knobkerrie",
	head="Agoge Mask +4",
	neck="War. Beads +1",
	ear1="Ishvara Earring",
	ear2="Thrud Earring",
	body="Sakpata's Plate",
	hands="Sakpata's Gauntlets",
	ring1="Regal Ring",
	ring2="Cornelia's Ring",
	back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	waist="Sailfi Belt +1",
	legs="Boii Cuisses +3",
	feet="Sakpata's Leggings"
}
    sets.precast.WS['Black Halo'] = {}

    ------------------------------------------------------------------------------------------------
    -- Midcast
    ------------------------------------------------------------------------------------------------

    sets.midcast.FastRecast = sets.precast.FC

    ------------------------------------------------------------------------------------------------
    -- Idle
    ------------------------------------------------------------------------------------------------

    sets.idle = {
	ammo="Staunch Tathlum",
	head="Sakpata's Helm",
	neck="Bathy Choker +1",
	ear1="Alabaster Earring",
	ear2="Eabani Earring",
	body="Sacro Breastplate",
	hands="Sakpata's Gauntlets",
	ring1="Defending Ring",
	ring2="Chirich Ring",
	back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	waist="Carrier's sash",
	legs="Sakpata's cuisses",
	feet="Sakpata's Leggings"
	}

    sets.idle.Regain = set_combine(sets.idle, {
	head="Valorous Mask",
	neck="Rep. Plat. Medal",
})

    sets.idle.DT = set_combine(sets.idle, {
	body="Sakpata's Plate",
	ring2="Defending Ring",
	back="Shadow Mantle",
})

    sets.idle.Town = sets.idle

    sets.Kiting = {
	ring1="Shneddick Ring"
}

    ------------------------------------------------------------------------------------------------
    -- Defense
    ------------------------------------------------------------------------------------------------

    sets.defense.PDT = {}
    sets.defense.MDT = {}

    ------------------------------------------------------------------------------------------------
    -- Engaged
    --
    -- CombatForm is selected automatically:
    --
    --   Great Axe                    -> sets.engaged.GreatAxe
    --   Great Sword                  -> sets.engaged.GreatSword
    --   Other two-handed / default   -> sets.engaged
    --   One-handed + shield          -> sets.engaged.OneHand
    --   One-handed + offhand weapon  -> sets.engaged.DW
    ------------------------------------------------------------------------------------------------

    sets.engaged = {
	ammo="Coiste Bodhar",
	head="Boii Mask +3",
	neck="War. Beads +1",
	left_ear="Schere Earring",
	right_ear="Boii Earring +1",
	body="Boii Lorica +3",
	hands="Sakpata's Gauntlets",
	left_ring="Niqmaddu Ring",
	right_ring="Moonbeam Ring",
	back="Null shawl",
	waist="Sailfi Belt +1",
	legs="Pumm. Cuisses +4",
	feet="Pumm. Calligae +4"
}

	-- OG engaged set, testing
	--ammo="Coiste Bodhar",
	--head="Boii Mask +3",
	--neck="War. Beads +1",
	--left_ear="Schere Earring",
	--right_ear="Boii Earring +1",
	--body="Perfection Plate.",
	--hands="Sakpata's Gauntlets",
	--left_ring="
	--right_ring="Moonbeam Ring",
	--back="Null shawl",
	--waist="Sailfi Belt +1",
	--legs="Pumm. Cuisses +4",
	--feet="Pumm. Calligae +4"

    sets.engaged.Acc = set_combine(sets.engaged, {
	ammo="Seething Bomblet +1",
	head="Boii mask +3",
	neck="War. Beads +1",
	ear1="Telos earring",
	ear2="Boii Earring +1",
	body="Boii Lorica +3",
	hands="Boii mufflers +3",
	ring1="Chirich Ring",
	ring2="Chirich Ring",
	back="Null shawl",
	waist="Ioskeha Belt",
	legs="Boii cuisses +3",
	feet="Boii calligae +3"
})

    -- Great Axe: Community Warrior Guide-style multi-attack set.
    sets.engaged.GreatAxe = {
	ammo="Coiste Bodhar",
	head="Boii Mask +3",
	neck="War. Beads +1",
	left_ear="Schere Earring",
	right_ear="Boii Earring +1",
	body="Boii Lorica +3",
	hands="Sakpata's Gauntlets",
	left_ring="Niqmaddu Ring",
	right_ring="Moonbeam Ring",
	back="Null shawl",
	waist="Sailfi Belt +1",
	legs="Pumm. Cuisses +4",
	feet="Pumm. Calligae +4"
}

    sets.engaged.GreatAxe.Acc = set_combine(sets.engaged.GreatAxe, {
	ammo="Seething Bomblet +1",
	left_ear="Telos Earring",
	hands="Boii Mufflers +3",
	left_ring="Chirich Ring",
	right_ring="Chirich Ring",
	back="Null Shawl",
	waist="Ioskeha Belt",
	legs="Boii Cuisses +3",
	feet="Boii Calligae +3"
})

    -- Great Sword: All Jobs Gear Sets-style Store TP set.
    sets.engaged.GreatSword = {
	ammo="Coiste Bodhar",
	head="Hjarrandi Helm",
	neck="War. Beads +1", -- Vim Torque
	left_ear="Schere Earring", -- Dedition Earring
	right_ear="Boii Earring +1", -- Schere earring
	body="Perfection Plate.",
	hands="Sakpata's Gauntlets",
	left_ring="Chirich Ring",
	right_ring="Niqmaddu Ring",
	back="Null Shawl",
	waist="Ioskeha Belt",
	legs="Revelation Brais",
	feet="Pumm. Calligae +4"
}

    sets.engaged.GreatSword.Acc = set_combine(sets.engaged.GreatSword, {
	ammo="Seething Bomblet +1",
	head="Boii Mask +3",
	hands="Boii Mufflers +3",
	left_ear="Telos Earring",
	left_ring="Chirich Ring",
	right_ring="Chirich Ring",
	back="Null Shawl",
	waist="Ioskeha Belt",
	legs="Boii Cuisses +3",
	feet="Boii Calligae +3"
})

    sets.engaged.OneHand = {
	ammo="Coiste Bodhar",
	head="Boii Mask +3",
	neck="War. Beads +1",
	ear1="Cessance Earring",
	ear2="Brutal Earring",
	body="Hjarrandi Breast.",
	hands="Sakpata's Gauntlets",
	ring1="Petrov Ring",
	ring2="Niqmaddu Ring",
	back="Null shawl",
	waist="Sailfi Belt +1",
	legs="Pumm. Cuisses +4",
	feet="Pumm. Calligae +4"
	
}
    sets.engaged.OneHand.Acc = set_combine(sets.engaged.OneHand, {
	ring1="Chirich Ring",
	waist="Kentarch Belt +1",
})

    sets.engaged.DW = {
	ammo="Coiste Bodhar",
	head="Boii Mask +3",
	neck="War. Beads +1",
	left_ear="Eabani Earring",
	right_ear="Boii Earring +1",
	body="Perfection Plate.",
	hands="Sakpata's Gauntlets",
	left_ring="Petrov Ring",
	right_ring="Niqmaddu Ring",
	back="Null shawl",
	waist="Reiki Yotai",
	legs="Pumm. Cuisses +4",
	feet="Pumm. Calligae +4",
}
    sets.engaged.DW.Acc = set_combine(sets.engaged.DW, {
	ring1="Chirich Ring",
	waist="Kentarch Belt +1",
})

    ------------------------------------------------------------------------------------------------
    -- Hybrid / DT
    ------------------------------------------------------------------------------------------------

    sets.engaged.DT = {
	ammo="Coiste Bodhar",
	head="Sakpata's Helm",
	body="Sakpata's Plate",
	hands="Sakpata's Gauntlets",
	legs="Sakpata's Cuisses",
	feet="Sakpata's Leggings",
	neck="War. Beads +1",
	ear1="Alabaster Earring",
	ear2="Boii Earring +1",
	ring1="Chirich Ring",
	ring2="Niqmaddu Ring",
	back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	waist="Sailfi Belt +1",
}
    sets.engaged.Acc.DT = set_combine(sets.engaged.DT, {
	ammo="Seething Bomblet +1",
	ring2="Chirich Ring",
	waist="Ioskeha Belt"
})

    -- Great Axe hybrid: Community Warrior Guide Sakpata-heavy hybrid set.
    sets.engaged.GreatAxe.DT = {
	ammo="Coiste Bodhar",
	head="Sakpata's Helm",
	neck="War. Beads +1",
	left_ear="Schere Earring",
	right_ear="Boii Earring +1",
	body="Sakpata's Plate",
	hands="Sakpata's Gauntlets",
	left_ring="Niqmaddu Ring",
	right_ring="Chirich Ring",
	back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	waist="Sailfi Belt +1",
	legs="Sakpata's Cuisses",
	feet="Sakpata's Leggings"
}

    sets.engaged.GreatAxe.Acc.DT = set_combine(sets.engaged.GreatAxe.DT, {
	ammo="Seething Bomblet +1",
	left_ear="Telos Earring",
	left_ring="Chirich Ring",
	right_ring="Chirich Ring",
	waist="Ioskeha Belt"
})

    -- Great Sword hybrid: All Jobs Gear Sets-style high-Store-TP DT set.
    sets.engaged.GreatSword.DT = {
	ammo="Aurgelmir Orb",
	head="Hjarrandi Helm",
	neck="War. Beads +1", -- Vim Torque
	left_ear="Schere Earring",
	right_ear="Boii Earring +1",
	body="Perfection Plate.",
	hands="Sakpata's Gauntlets",
	left_ring="Moonbeam Ring",
	right_ring="Niqmaddu Ring",
	back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	waist="Ioskeha Belt",
	legs="Revelation Brais",
	feet="Revelation Sab."
}

    sets.engaged.GreatSword.Acc.DT = set_combine(sets.engaged.GreatSword.DT, {
	ammo="Seething Bomblet +1",
	left_ear="Telos Earring",
	left_ring="Chirich Ring",
	right_ring="Chirich Ring",
	waist="Ioskeha Belt"
})
    sets.engaged.OneHand.DT = {
	ammo="Coiste Bodhar",
	head="Sakpata's Helm",
	body="Sakpata's Plate",
	hands="Sakpata's Gauntlets",
	legs="Sakpata's Cuisses",
	feet="Sakpata's Leggings",
	neck="Sailfi Belt +1",
	ear1="Cessance Earring",
	ear2="Brutal Earring",
	ring1="Petrov Ring",
	ring2="Niqmaddu Ring",
	back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	waist="Sailfi Belt +1",
}
    sets.engaged.OneHand.Acc.DT = set_combine(sets.engaged.OneHand.DT, {
	ring1="Chirich Ring",
	waist="Kentarch Belt +1",
})

    sets.engaged.DW.DT = {
	ammo="Coiste Bodhar",
	head="Sakpata's Helm",
	body="Sakpata's Plate",
	hands="Sakpata's Gauntlets",
	legs="Sakpata's Cuisses",
	feet="Sakpata's Leggings",
	neck="War. Beads +1",
	ear1="Eabani Earring",
	ear2="Cessance Earring",
	ring1="Niqmaddu Ring",
	ring2="Petrov Ring",
	waist="Reiki Yotai",
	back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
    sets.engaged.DW.Acc.DT = set_combine(sets.engaged.DW.DT, {
	ring1="Chirich Ring",
	waist="Kentarch Belt +1",
})

    ------------------------------------------------------------------------------------------------
    -- Buff overlays
    ------------------------------------------------------------------------------------------------

    sets.buff.Berserk = {}
    sets.buff.Retaliation = {}
    sets.buff.Restraint = {}
end

-------------------------------------------------------------------------------------------------------------------
-- Casting hooks
-------------------------------------------------------------------------------------------------------------------

function job_precast(spell, action, spellMap, eventArgs)
end

function job_post_precast(spell, action, spellMap, eventArgs)
end

function job_midcast(spell, action, spellMap, eventArgs)
end

function job_aftercast(spell, action, spellMap, eventArgs)
end

-------------------------------------------------------------------------------------------------------------------
-- Buff handling
-------------------------------------------------------------------------------------------------------------------

function job_buff_change(buff, gain)
    if state.Buff[buff] ~= nil then
        state.Buff[buff] = gain
    end

    if not midaction() then
        handle_equipping_gear(player.status)
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Update / state hooks
-------------------------------------------------------------------------------------------------------------------

function job_handle_equipping_gear(playerStatus, eventArgs)
    check_gear()
    update_combat_form()
    check_moving()
end

function job_update(cmdParams, eventArgs)
    update_combat_form()
end

function job_state_change(stateField, newValue, oldValue)
end

-------------------------------------------------------------------------------------------------------------------
-- Set customization
-------------------------------------------------------------------------------------------------------------------

function customize_idle_set(idleSet)
    if state.Auto_Kite.value then
        idleSet = set_combine(idleSet, sets.Kiting)
    end

    return idleSet
end

function customize_melee_set(meleeSet)
    if state.Buff.Berserk then
        meleeSet = set_combine(meleeSet, sets.buff.Berserk)
    end

    if state.Buff.Retaliation then
        meleeSet = set_combine(meleeSet, sets.buff.Retaliation)
    end

    if state.Buff.Restraint then
        meleeSet = set_combine(meleeSet, sets.buff.Restraint)
    end

    return meleeSet
end

function job_self_command(cmdParams, eventArgs)
    gearinfo(cmdParams, eventArgs)
end

function gearinfo(cmdParams, eventArgs)
    if cmdParams[1] == 'gearinfo' then
        if type(cmdParams[4]) == 'string' then
            if cmdParams[4] == 'true' then
                moving = true
            elseif cmdParams[4] == 'false' then
                moving = false
            end
        end

        if not midaction() then
            handle_equipping_gear(player.status)
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Automatic combat-form detection
-------------------------------------------------------------------------------------------------------------------

function update_combat_form()
    local main_item = get_equipped_item_resource('main')
    local sub_item  = get_equipped_item_resource('sub')

    -- Default to the generic two-handed set.
    state.CombatForm:reset()

    if not main_item then
        return
    end

    -- Weapon skill IDs used by FFXI resources:
    -- 1 Hand-to-Hand, 2 Dagger, 3 Sword, 4 Great Sword,
    -- 5 Axe, 6 Great Axe, 7 Scythe, 8 Polearm, 9 Katana,
    -- 10 Great Katana, 11 Club, 12 Staff.

    -- Great Sword and Great Axe each use their own TP / Hybrid families.
    if main_item.skill == 4 then
        state.CombatForm:set('GreatSword')
        return
    elseif main_item.skill == 6 then
        state.CombatForm:set('GreatAxe')
        return
    end

    -- WAR's common one-handed weapon families are Sword and Axe.
    local one_handed_main = S{2, 3, 5, 9, 11}:contains(main_item.skill)

    if not one_handed_main then
        return
    end

    if sub_item and is_weapon_resource(sub_item) then
        state.CombatForm:set('DW')
    else
        state.CombatForm:set('OneHand')
    end
end

function get_equipped_item_resource(slot)
    local item_name = player.equipment[slot]

    if not item_name or item_name == 'empty' then
        return nil
    end

    return res.items:with('en', item_name)
end

function is_weapon_resource(item)
    if not item or not item.skill then
        return false
    end

    return S{1,2,3,4,5,6,7,8,9,10,11,12}:contains(item.skill)
end

-------------------------------------------------------------------------------------------------------------------
-- Misc utility
-------------------------------------------------------------------------------------------------------------------

function check_moving()
    if state.Kiting.value == false then
        if state.Auto_Kite.value == false and moving then
            state.Auto_Kite:set(true)
        elseif state.Auto_Kite.value == true and moving == false then
            state.Auto_Kite:set(false)
        end
    end
end

function check_gear()
    if no_swap_gear:contains(player.equipment.left_ring) then
        disable('ring1')
    else
        enable('ring1')
    end

    if no_swap_gear:contains(player.equipment.right_ring) then
        disable('ring2')
    else
        enable('ring2')
    end
end

function select_default_macro_book()
    if player.sub_job == 'NIN' then
        set_macro_page(10, 9)
    elseif player.sub_job == 'SAM' then
        set_macro_page(1, 9)
    else
        set_macro_page(1, 9)
    end
end

function set_lockstyle()
    send_command('wait 2; input /lockstyleset ' .. lockstyleset)
end