function downloadInstructions(){    
	if (BrowserDetect.browser == "Chrome" && chrome.app.isInstalled == true){
		$('.chrome').hide();
		$('.nochrome').hide();
	}
	else if (BrowserDetect.browser == "Chrome" && chrome.app.isInstalled == false){
		$('.nochrome').hide();
		$('.chrome').hide(); // for presentation //
	}
	else{
		$('.chrome').hide();
		$('.nochrome').hide(); // for presentation //
	}
};

function downloadExtension(){
	$('#download_extension').on('click',function(event){
	  event.preventDefault();
      chrome.webstore.install();
	});
}

$(document).ready(function(){
	downloadInstructions();
  downloadExtension();
});

$(document).on('page:load', function(){
	downloadInstructions();
	downloadExtension();
});
