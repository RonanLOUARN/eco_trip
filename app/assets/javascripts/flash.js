var hideFlash = function(time){
    setTimeout(function(){
        document.getElementById('flash').innerHTML = ''
    }, time);
};
