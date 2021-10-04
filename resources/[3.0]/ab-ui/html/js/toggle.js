$("#healthtoggle").change(function(){
    $.post("https://ab-ui/saveToggle",JSON.stringify({
        state: this.checked,
        type: "healthshow",
    }))
    switch (this.checked) {
        case true:
            $("#healthhud").fadeOut(750)
            break;
        case false:
            $("#healthhud").fadeIn(750)
            break;
    }
})

$("#armortoggle").change(function(){
    $.post("https://ab-ui/saveToggle",JSON.stringify({
        state: this.checked,
        type: "armorshow",
    }))
    switch (this.checked) {
        case true:
            $("#armorhud").fadeOut(750)
            break;
        case false:
            $("#armorhud").fadeIn(750)
            break;
    }
})

$("#hungertoggle").change(function(){
    $.post("https://ab-ui/saveToggle",JSON.stringify({
        state: this.checked,
        type: "hungershow",
    }))
    switch (this.checked) {
        case true:
            $("#hungerhud").fadeOut(750)
            break;
        case false:
            $("#hungerhud").fadeIn(750)
            break;
    }
})

$("#thirsttoggle").change(function(){
    $.post("https://ab-ui/saveToggle",JSON.stringify({
        state: this.checked,
        type: "thirstshow",
    }))
    switch (this.checked) {
        case true:
            $("#thirsthud").fadeOut(750)
            break;
        case false:
            $("#thirsthud").fadeIn(750)
            break;
    }
})

$("#staminatoggle").change(function(){
    $.post("https://ab-ui/saveToggle",JSON.stringify({
        state: this.checked,
        type: "staminashow",
    }))
    switch (this.checked) {
        case true:
            $("#staminahud").fadeOut(750)
            break;
        case false:
            $("#staminahud").fadeIn(750)
            break;
    }
})

$("#oxygentoggle").change(function(){
    $.post("https://ab-ui/saveToggle",JSON.stringify({
        state: this.checked,
        type: "oxyshow",
    }))
    switch (this.checked) {
        case true:
            $("#oxygenhud").fadeOut(750)
            break;
        case false:
            $("#oxygenhud").fadeIn(750)
            break;
    }
})

$("#stresstoggle").change(function(){
    $.post("https://ab-ui/saveToggle",JSON.stringify({
        state: this.checked,
        type: "stressshow",
    }))
    switch (this.checked) {
        case true:
            $("#stresshud").fadeOut(750)
            break;
        case false:
            $("#stresshud").fadeIn(750)
            break;
    }
})

$("#voicetoggle").change(function(){
    $.post("https://ab-ui/saveToggle",JSON.stringify({
        state: this.checked,
        type: "voiceshow",
    }))
    switch (this.checked) {
        case true:
            $("#voicehud").fadeOut(750)
            break;
        case false:
            $("#voicehud").fadeIn(750)
            break;
    }
})