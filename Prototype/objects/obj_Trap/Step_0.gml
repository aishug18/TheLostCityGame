// THIS IS A PARENT OBJECT, SO ALL TRAP OBJECTS SHOULD INHERIT FROM THIS, NO EXTRA
// CODE NEEDED FOR EACH TRAP OBJECT

if (place_meeting(x, y, obj_Player)) {
	with (obj_Player) {
		die();
	}
}