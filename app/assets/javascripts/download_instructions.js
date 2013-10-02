function downloadInstructions(){    
	if (BrowserDetect.browser == "Chrome" && chrome.app.isInstalled == true){
		$('.chrome').hide();
		$('.nochrome').hide();
	}
	else if (BrowserDetect.browser == "Chrome" && chrome.app.isInstalled == false){
		$('.nochrome').hide();
	}
	else{
		$('.chrome').hide();
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