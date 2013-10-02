function downloadInstructions(){    
	if(BrowserDetect.browser == "Chrome"){
		$('.nochrome').hide();
	}
	else{
		$('.chrome').hide();
	}
};

$(document).ready(function(){
	downloadInstructions();
});