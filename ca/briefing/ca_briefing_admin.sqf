// CA - Briefing
// ====================================================================================
if (!isDedicated && (isNull player)) then
{
    waitUntil {sleep 0.1; !isNull player};
};

_briefing = "";
_briefing = _briefing + "
<font size='18'>Side ticket control</font><br/>

|- <execute expression=""_newnumb = ca_WestTickets + 10; missionNamespace setVariable ['ca_WestTickets',_newnumb, true]; systemChat 'Tickets added to west'; "">
Give side west +10 tickets</execute><br/>
|- <execute expression=""_newnumb = ca_EastTickets + 10; missionNamespace setVariable ['ca_EastTickets',_newnumb, true]; systemChat 'Tickets added to east';"">
Give side east +10 tickets</execute><br/>
|- <execute expression=""_newnumb = ca_IndependentTickets + 10; missionNamespace setVariable ['ca_IndependentTickets',_newnumb, true]; systemChat 'Tickets added to independent';"">
Give side independent +10 tickets</execute><br/>

<font size='18'>Side ticket control</font><br/>

|- <execute expression=""missionNamespace setVariable ['ca_WestTickets',0, true];systemChat 'Tickets reset for west';"">
Remove all tickets from west</execute><br/>
|- <execute expression=""missionNamespace setVariable ['ca_EastTickets',0, true];systemChat 'Tickets reset for east';"">
Remove all tickets from east</execute><br/>
|- <execute expression=""missionNamespace setVariable ['ca_IndependentTickets',0, true];systemChat 'Tickets reset for independent';"">
Remove all tickets from independent</execute><br/>
<font size='18'>Headless client markers(Global)</font><br/>

|- <execute expression="" missionNamespace setVariable ['ca_hcshowmarkers',true, true];"">
Show headless markers</execute><br/>
|- <execute expression=""missionNamespace setVariable ['ca_hcshowmarkers',false, true];"">
Hide headless markers</execute><br/>

<font size='18'>F3 admin Menu</font><br/>
|- <execute expression="" [] execvm 'f\briefing\f_briefing_admin.sqf'"">
Give self F3 admin menu</execute><br/>

<font size='18'>Respawn Options</font><br/>
|- <execute expression=""hint 'Wave spawned!'; [west] call ca_fnc_respawnwave;[east] call ca_fnc_respawnwave;[independent] call ca_fnc_respawnwave;"">
Spawn respawn wave(Note respawns everyone including different sides together)</execute><br/>
|- <execute expression=""systemChat 'Wave spawned West!'; [west] call ca_fnc_respawnwave;"">
Spawn respawn wave(West)</execute><br/>
|- <execute expression=""systemChat 'Wave spawned East!'; [east] call ca_fnc_respawnwave;"">
Spawn respawn wave(East)</execute><br/>
|- <execute expression=""systemChat 'Wave spawned independent!'; [independent] call ca_fnc_respawnwave;"">
Spawn respawn wave(Independent)</execute><br/><br/>

|- <execute expression=""missionNamespace setVariable ['ca_respawnmode',0, true];"">
Disable respawn (set respawnmode to 0)</execute><br/>
|- <execute expression=""missionNamespace setVariable ['ca_respawnmode',1, true];"">
Set respawn mode to base (set respawnmode to 1)</execute><br/>
|- <execute expression=""missionNamespace setVariable ['ca_respawnmode',2, true];"">
Set respawn mode to CO waves (set respawnmode to 2)</execute><br/>
|- <execute expression=""missionNamespace setVariable ['ca_respawnmode',3, true];"">
Set respawn mode to group respawn (set respawnmode to 3)</execute><br/><br/>

|- <execute expression=""missionNamespace setVariable ['ca_wavecooldown',1, true];"">
Set respawn wave time to 1 minutes</execute><br/>
|- <execute expression=""missionNamespace setVariable ['ca_wavecooldown',540, true];"">
Set respawn wave time to 10 minutes</execute><br/>
|- <execute expression=""missionNamespace setVariable ['ca_wavecooldown',1740, true];"">
Set respawn wave time to 30 minutes</execute><br/>

<font size='18'>Smooth markers Options</font><br/>
|- <execute expression=""missionNamespace setVariable ['f_var_smoothMarkers_hide',true, true];"">
Hide smooth markers</execute><br/>
|- <execute expression=""missionNamespace setVariable ['f_var_smoothMarkers_hide',false, true];"">
Show smooth markers</execute><br/>
|- <execute expression=""missionNamespace setVariable ['f_var_smoothFTMarkers_hide',true, true];"">
Hide smooth fireteam markers</execute><br/>
|- <execute expression=""missionNamespace setVariable ['f_var_smoothFTMarkers_hide',false, true];"">
Show smooth fireteam markers</execute><br/>
<font size='18'>High command markers option</font><br/>
|- <execute expression=""missionNamespace setVariable ['AIC_Command_Controls',[],true]"">
Hide High command markers for everyone</execute><br/>
";

// ====================================================================================

// CREATE DIARY ENTRY

player createDiaryRecord ["diary", ["CA Admin",_briefing]];

// ====================================================================================
