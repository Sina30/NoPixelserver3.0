const colorPicker = new JSColor('#colorinput')
colorPicker.option({
    'onChange' : "changecolor(this)",
    'format': 'RGB',
    'width' : 310,
    'previewSize' : 80,
    'position' : 'bottom',
})

colorPicker.show()

varwillchanges = null;
varcolorchange = "#FFF";

function changecolor(){
    varcolorchange = document.getElementById("colorinput").value;
}

$("#voicehud").click(function(){
    varwillchanges = "#voice";
})

$("#healthhud").click(function(){
    varwillchanges = "#health";
})

$("#armorhud").click(function(){
    varwillchanges = "#armor";
})

$("#hungerhud").click(function(){
    varwillchanges = "#hunger";
})

$("#thirsthud").click(function(){
    varwillchanges = "#thirst";
})

$("#staminahud").click(function(){
    varwillchanges = "#stamina";
})

$("#oxygenhud").click(function(){
    varwillchanges = "#oxygen";
})

$("#stresshud").click(function(){
    varwillchanges = "#stress";
})

$("#btnset").click(function(){
    if (varwillchanges != null) {
        $(varwillchanges).css("stroke",varcolorchange)
        $.post("https://ab-ui/saveColor",JSON.stringify({
            color: varcolorchange,
            type: varwillchanges,
        }))
    }
})

$("#btnreset").click(function(){
    $("#voice").css("stroke","#FFF");
    $("#health").css("stroke","#3BB273");
    $("#armor").css("stroke","#418aff");
    $("#hunger").css("stroke","#D1993C");
    $("#thirst").css("stroke","#4F7CAC");
    $("#stamina").css("stroke","#3dc4dc");
    $("#oxygen").css("stroke","#495A74");
    $("#stress").css("stroke","#984447");
    $.post("https://ab-ui/resetcolor")
})