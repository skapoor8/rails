$.urlParam = function(name){
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results) {
        return results[1];
    }
    return 0;
}

$( document ).ready(function() {
    var current_tab = $.urlParam("current_tab");
    if (current_tab == "reported") {
        $('#all').removeClass("active");
        $('#resolvable').removeClass("active");
        $('#archives').removeClass("active");
        $('#reported').addClass("active");

    } else if (current_tab == "resolvable") {
        $('#all').removeClass("active");
        $('#reported').removeClass("active");
        $('#archives').removeClass("active");
        $('#resolvable').addClass("active");

    } else if (current_tab == "archives") {
        $('#reported').removeClass("active");
        $('#resolvable').removeClass("active");
        $('#archives').addClass("active");

    } else {
        $('#archives').removeClass("active");
        $('#reported').removeClass("active");
        $('#resolvable').removeClass("active");
        $('#all').addClass("active");
    }
});