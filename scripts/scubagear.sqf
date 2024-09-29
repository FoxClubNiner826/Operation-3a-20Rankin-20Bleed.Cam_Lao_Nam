playerLoadout = getUnitLoadout player;

comment "Remove existing items";
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

comment "Add weapons";
player addWeapon "vn_m_mk2_knife_01";

comment "Add containers";
player forceAddUniform "vn_b_uniform_seal_07_03";
player addVest "vn_b_vest_seal_01";
player addItemToVest "vn_b_item_toolkit";

comment "Add binoculars";
player addWeapon "vn_m19_binocs_grn";

comment "Add items to containers";
player addItemToUniform "vn_b_item_firstaidkit";
for "_i" from 1 to 2 do {player addItemToUniform "vn_m61_grenade_mag";};
player addGoggles "vn_b_acc_seal_01";

comment "Add items";
player linkItem "vn_b_item_map";
player linkItem "vn_b_item_compass_sog";
player linkItem "vn_b_item_watch";
player linkItem "vn_b_item_radio_urc10";

scubaEquipped = true;
