var cloudify = function() {
    var tagsArray = $('#tagCloud a');
    var highCount = $('#tagCloud').attr('data-maxcount');
    var colorArray = ["#0B88BE" ,"#EE094C", "#FC4A04", "#FFA205", "#35AB95", "#2F9885"];

    for (var i=0; i<tagsArray.length; i++) {
    	var selectedColor = colorArray[Math.floor(Math.random()*6)];
        var tagLink = $(tagsArray[i]);
        var fontRatio = highCount / tagLink.data('count');
        tagLink.css("font-size", (5 / fontRatio) + "em"); 
        tagLink.css("color", selectedColor);
    }
}


// var tagPop = function(){
//   $('#tagCloud a').hover(function(){
//     $(this).css('color', 'black');
//   }, function() {
//     $(this).css('font-size', newSize);
//   });
// };


$(document).ready(cloudify);
$(document).on('page:load', cloudify);
// $(document).ready(tagPop);
// $(document).on('page:load', tagPop);
