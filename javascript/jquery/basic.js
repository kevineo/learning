$(document).on('ready page:load', function(){
	// Keyboard
	$(document).keydown(function(key){
		switch(parseInt(key.which, 10)) {
			case 37: // Left Arrow Key
				break;
			case 38: // Up Arrow Key
				break;
			case 39: // Right Arrow Key
				break;
			case 40: // Down Arrow Key
				break;
		}
	});

	// Mouse Click
	$(document).dblclick(function(){
		// Double click function
	});
	$(document).click(function(){
		// Single click Function
	})


	// Animate
	$('img').animate({top: "-=10px"}, 'fast');


	// Effect
	// More can be found in http://jqueryui.com/
});