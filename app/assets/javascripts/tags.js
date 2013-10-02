var cloudify = function() {
    var tagsArray = $('#tagCloud a');
    var highCount = $('#tagCloud').attr('data-maxcount');

    for (var i=0; i<tagsArray.length; i++) {
        var tagLink = $(tagsArray[i]);
        var fontRatio = highCount / tagLink.data('count');
        tagLink.css("font-size", (5 / fontRatio) + "em"); 
    }
}

$(document).ready(cloudify);
$(document).on('page:load', cloudify);
