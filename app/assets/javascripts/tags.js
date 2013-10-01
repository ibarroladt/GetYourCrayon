var cloudify = function() {
    var tagsArray = $('#tagCloud a');
    var highCount = tagsArray.first().data('count');
    for (var i=0; i<tagsArray.length; i++) {
        var tagLink = $(tagsArray[i]);
        var fontRatio = highCount / tagLink.data('count');
        tagLink.css("font-size", (3 / fontRatio) + "em"); 
    }
}

$(document).ready(cloudify);
$(document).on('page:load', cloudify);
