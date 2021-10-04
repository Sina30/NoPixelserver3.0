//progbar event
let progbarp = 0
let curTask;
let progbarloop;

function animatprogbar(){
    $("#progress-bar").css("width", progbarp+"%");
}

function drawprogbar(duration,label,taskid){
    curTask = taskid
    $(".nicesexytext").html(label);
    if (typeof progbarloop !== undefined) clearInterval(progbarloop);
    const timeprog = (duration / 1000) * 10;
    progbarloop = setInterval(animateprog_to, timeprog);
}

function animateprog_to(){
    if (progbarp === 100) {
        clearInterval(progbarloop);
        progbarp = 0;
        // $("#progress-bar").css("width", "0%");
        console.log("Success")
        return
    }
    progbarp++;
    animatprogbar()
}
//End progbar event

// skillbarcode
let skillbaractive = false
let canvas = document.getElementById("canvas");
let ctx = canvas.getContext("2d");

let W = canvas.width;
let H = canvas.height;
let degrees = 0;
let new_degrees = 0;
let time = 0;
let color = "#ffffff";
let bgcolor = "#404b58";
let bgcolor2 = "#41a491";
let key_to_press;
let g_start, g_end;
let animation_loop;

function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min + 1) + min); //The maximum is inclusive and the minimum is inclusive
}

function initskillbar() {
    // Clear the canvas every time a chart is drawn
    ctx.clearRect(0,0,W,H);

    // Background 360 degree arc
    ctx.beginPath();
    ctx.strokeStyle = bgcolor;
    ctx.lineWidth = 20;
    ctx.arc(W / 2, H / 2, 100, 0, Math.PI * 2, false);
    ctx.stroke();

    // Green zone
    ctx.beginPath();
    ctx.strokeStyle = bgcolor2;
    ctx.lineWidth = 20;
    ctx.arc(W / 2, H / 2, 100, g_start - 90 * Math.PI / 180, g_end - 90 * Math.PI / 180, false);
    ctx.stroke();

    // Angle in radians = angle in degrees * PI / 180
    let radians = degrees * Math.PI / 180;
    ctx.beginPath();
    ctx.strokeStyle = color;
    ctx.lineWidth = 20;
    ctx.arc(W / 2, H / 2, 100, 0 - 90 * Math.PI / 180, radians - 90 * Math.PI / 180, false);
    ctx.stroke();

    // Adding the key_to_press
    ctx.fillStyle = color;
    ctx.font = "100px sans-serif";
    let text_width = ctx.measureText(key_to_press).width;
    ctx.fillText(key_to_press, W / 2 - text_width / 2, H / 2 + 35);
}

function drawskillbar(duration,level) {
    $(".skillbar").show()
    skillbaractive = true
    if (typeof animation_loop !== undefined) clearInterval(animation_loop);

    g_start = getRandomInt(20,40) / 10;
    g_end = getRandomInt(5,10) / 10;
    g_end = g_start + g_end;

    degrees = 0;
    new_degrees = 360;

    key_to_press = ''+getRandomInt(1,4);

    time = (duration / 1000 ) * 3;

    animation_loop = setInterval(animate_to, time);
}

function animate_to() {
    if (degrees >= new_degrees) {
        wrong();
        return;
    }

    degrees++;
    initskillbar();
}

function correct(){
    $(".skillbar").hide()
    clearInterval(animation_loop);
    skillbaractive = false
    $.post('https://ab-ui/ab-ui:taskBarSkillResult', JSON.stringify({
        success: true,
    }));
}

function wrong(){
    $(".skillbar").hide()
    clearInterval(animation_loop);
    skillbaractive = false
    $.post('https://ab-ui/ab-ui:taskBarSkillResult', JSON.stringify({
        success: false,
    }));
}
// End skillbarcode


var RowsData = [];
var Rows = [];
var saved = "";
arraydatainteract = null;
contextdata = null
entitydata = null
textmenucallbackurl = null
menucontextdata = null
contextmenuactive = false
textboxactive = false
textmenukey = null;



const OpenMenu = (data) => {
    if (data.show) {
        $(`.root-wrapper`).fadeIn(0)
        $(`.background`).fadeIn(0)
        textmenucallbackurl = data.callbackUrl
        SetHeader(data.header)
        textmenukey = data.key
        // console.log("textmenu key ",textmenukey)
        AddRow(data.items) 
    }
    
}

function SetHeader(header) {
    var element
    element = $('<h1>' + header + '<h1>');
    $('.heading').append(element);
    saved = element
}

const CloseMenu = () => {
    $(`.root-wrapper`).fadeOut(0);
    $(`.background`).fadeOut(0);
    $(saved).remove();
    RowsData = [];
    Rows = [];
    saved = "";
    textboxactive = false
    $.post(`https://ab-ui/guccimanecancel`)
    
};

const CancelMenu = () => {
    $.each(RowsData, function (idx, item) {
        var id = item.name;
        
        $(Rows[id]).remove();
    })
    
    $.post(`https://ab-ui/guccimanecancel`)
    return CloseMenu();
}

function AddRow(data) {
    RowsData = data
    $.each(data, function (idx, item) {
        var element
        element = $('<label for="usr"><i class="'+item.icon+'" style="margin-right: 2%;"></i>' + item.label + '</label> <input type="text" class="form-control" id="' + item.name + '" />');
        $('.body').append(element);
        Rows[item.name] = element
    })
}

function SubmitData() {
    returnData = [];
    $.each(RowsData, function (idx, item) {
        var id = item.name;
        var data = document.getElementById(id);
        if (data.value) {
            returnData.push({
                value: data.value,
            });
        } else {
            returnData.push({
                value: null,
            });
        }
        
        $(Rows[id]).remove();
    })
    returnData.push({
        value: textmenukey,
    })
    PostData(returnData)
    CloseMenu();
}


const PostData = (data) => {
    return $.post(`https://ab-ui/`+textmenucallbackurl, JSON.stringify(data))
}

function closesettings(){
    $(".settings").hide();
    $.post('https://ab-ui/close');
}

function Progress(percent, element) {
    var circle = document.querySelector(element);
    var radius = circle.r.baseVal.value;
    var circumference = radius * 2 * Math.PI;
    circle.style.strokeDasharray = `${circumference} ${circumference}`;
    circle.style.strokeDashoffset = `${circumference}`;
    const offset = circumference - ((-percent * 100) / 100 / 100) * circumference;
    circle.style.strokeDashoffset = -offset;
}

function addGaps(nStr) {
    nStr += '';
    var x = nStr.split('.');
    var x1 = x[0];
    var x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + '<span style="margin-left: 3px; margin-right: 3px;"/>' + '$2');
    }
    return x1 + x2;
}

function setProgressSpeed(value, element){
    var circle = document.querySelector(element);
    var radius = circle.r.baseVal.value;
    var circumference = radius * 2 * Math.PI;
    var html = $(element).parent().parent().find('span');
    var percent = value*100/450;

    circle.style.strokeDasharray = `${circumference} ${circumference}`;
    circle.style.strokeDashoffset = `${circumference}`;

    const offset = circumference - ((-percent*73)/100) / 100 * circumference;
    circle.style.strokeDashoffset = -offset;

    html.text(value);
}

function setProgressFuel(percent, element) {
    var circle = document.querySelector(element);
    var radius = circle.r.baseVal.value;
    var circumference = radius * 2 * Math.PI;
    var html = $(element).parent().parent().find("span");
    circle.style.strokeDasharray = `${circumference} ${circumference}`;
    circle.style.strokeDashoffset = `${circumference}`;
    const offset = circumference - ((-percent * 73) / 100 / 100) * circumference;
    circle.style.strokeDashoffset = -offset;
    html.text(Math.round(percent));
}

window.addEventListener('message',function(event){
    const action = event.data.action;
    const msg = event.data;
    switch (action) {
        case "taskbarskill":
            if (msg.data.display) {
                drawskillbar(msg.data.duration,msg.data.difficulty)
            }
            break;
        case "contextmenu":
            if (msg.show == true) {
                // console.log("Show Contextmenu")
                $(".buttoncontext").html("");
                $(".containercontext").show();
                contextmenuactive = true
                if (msg.data.options) {
                    menucontextdata = msg.data.options
                    $.each(msg.data.options, function (index1, item1) {
                        // console.log(index1,item1.title,item1.description,item1.action,item1.key)
                        if (item1.children) {
                            //console.log("Have Chicldren")
                            $(".buttoncontext").append('<div class="button-context" id="contextmenu-'+index1+'"><div class="titlecontext" id="contextmenu-'+index1+'">'+item1.title+'</div><div class="descriptioncontext" id="contextmenu-'+index1+'">'+item1.description+'</div></div>');
                            $("#contextmenu-"+index1).data("action",item1.action);
                            $("#contextmenu-"+index1).data("key",item1.key);
                            $("#contextmenu-"+index1).data("children",item1.children);
                        }else{
                            $(".buttoncontext").append('<div class="button-context" id="contextmenu-'+index1+'"><div class="titlecontext" id="contextmenu-'+index1+'">'+item1.title+'</div><div class="descriptioncontext" id="contextmenu-'+index1+'">'+item1.description+'</div></div>');
                            $("#contextmenu-"+index1).data("action",item1.action);
                            $("#contextmenu-"+index1).data("key",item1.key);
                            $("#contextmenu-"+index1).data("children",null);
                            // console.log("Dont Have")
                        }
                    })
                }
            }else{
                //console.log("hide context menu")
                $(".containercontext").hide();
                $(".buttoncontext").html("");
            }
            break;
        case "taskbar":
            if (msg.data.display) {
                //console.log("Display Progbar")
                $(".progress-container").show();
                drawprogbar(msg.data.duration,msg.data.label,msg.data.taskID)
            }else{
                //console.log("Hide Progbar")
                
                $(".progress-container").hide();
                $("#progress-bar").css("width", "0%");
            }
            break;
        case "hud.compass":

            if (msg.data.area != null) {
                $(".areainfo").html(msg.data.area);
            }

            if (msg.data.street != null) {
                $(".streetinfo").html(msg.data.street);
            }
            $(".direction").find(".image").attr('style', 'transform: translate3d(' + ((-1* msg.data.heading) + -300) + 'px, 0px, 0px)');
            if (msg.data.speed) {
                setProgressSpeed(msg.data.speed,".progress-speed")
            }
            
            break;
        case "eye":
            const payload = msg.data.payload
            if (msg.data.action == "refresh") {
                //Refresh data items entity
                arraydatainteract = payload
            }else if(msg.data.action == "update"){
                //Update View of items looking
                $(".target-label").html("");
                if (payload.active == true) {
                    $(".target-eye").css("color", "#00b894");
                    $("#eyenonactive").hide();
                    $("#eyeactive").show();
                }else{
                    $("#eyenonactive").show();
                    $("#eyeactive").hide();
                    // $(".target-eye").css("color", "gray")
                }

                $.each(arraydatainteract, function (index1, item1) {
                    $.each(payload.options, function (index2, item2) {
                        if(index1 == index2 && item2 == true){
                            $(".target-label").append("<div id='target-"+index1+"'<li><span class='target-icon'><i class='"+item1.icon+"'></i></span>&nbsp"+item1.label+"</li></div>");
                            $("#target-"+index1).hover((e)=> {
                                $("#target-"+index1).css("color",e.type === "mouseenter"?"#00b894":"white")
                            })
                            $("#target-"+index1+"").css("padding-top", "13px");
                            $("#target-"+index1).data('eventData', item1.event);
                            $("#target-"+index1).data('parametersData', item1.parameters);
                        }
                    })
                })
            }else if(msg.data.action == "peek"){
                //Update eye event show or display
                if (payload.display == true) {
                    $(".target-label").html("");
                    $('.target-wrapper').show();
                    $("#eyenonactive").show();
                    $("#eyeactive").hide();
                }else{
                    $(".target-label").html("");
                    $('.target-wrapper').hide();
                }

                if (payload.active == true) {
                    $("#eyenonactive").hide();
                    $("#eyeactive").show();
                    // $(".target-eye").css("color", "#00b894");
                }else{
                    // $(".target-eye").css("color", "gray");
                    $("#eyenonactive").show();
                    $("#eyeactive").hide();
                    $(".target-label").html("");
                }
            }else if(msg.data.action == "interact"){
                contextdata = payload.context
                entitydata = payload.entity
            }
            break;
        case "sniper-scope":
            if (msg.data.show == true) {
                //Display Scope
                $(".scopecontainer").show();
            }else{
                //Hide Scope
                $(".scopecontainer").hide();
            }
            break;
        case "cash":
            if (msg.data.cash) {
                $('.cash').show();
                $('.cash').html('<p id="cash"><span class="green"> $ </span>' +addGaps(msg.data.cash)+'</p>');
                setTimeout(function(){
                    $('.cash').fadeOut(600)
                }, 5000)
            }

            if (msg.data.amountAdjustment >= 0) {
                $('.cashtransaction').show();
                var element = $('<p id="add-balance"><span class="pre">-</span><span class="red"> $ </span>' +addGaps(msg.data.amountAdjustment)+'</p>');
                $(".cashtransaction").append(element);
                setTimeout(function(){
                    $(element).fadeOut(600, function() { $(this).remove(); })
                }, 5000)
            }
            break;
        case "hud":
            if (msg.data.display == true) {
                $("#uicontent").css("display","block");
            }else if(msg.data.display == false){
                $("#uicontent").css("display","none");
            }

            if (msg.data.radarShow == true) {
                // Show Radar Border
                $(".radarmap").show()
                $(".vehiclehud").show()
                $(".areainfo").show();
                $(".direction").show();
                $(".streetinfo").show();
                $(".ditanceinfo").show();
            }else if(msg.data.radarShow == false){
                // Hide Radar Border
                $(".radarmap").hide()
                $(".vehiclehud").hide()
                $(".areainfo").hide();
                $(".direction").hide();
                $(".streetinfo").hide();
                $(".ditanceinfo").hide();
            }

            if (msg.data.waypointActive == true) {
                $(".ditanceinfo").show();
                var distan = msg.data.waypointDistance;
                $(".ditanceinfo").html(distan.toFixed(2) + "m");
            }else if(msg.data.waypointActive == false || msg.data.radarShow == false){
                $(".ditanceinfo").hide();
                $(".ditanceinfo").html("");
            }

            if (msg.data.health >= 0) {
                Progress(msg.data.health,"#health")
            }

            if (msg.data.armor >= 0) {
                Progress(msg.data.armor,"#armor")
            }

            if (msg.data.food >= 0) {
                Progress(msg.data.food,"#hunger")
            }

            if (msg.data.water >= 0) {
                Progress(msg.data.water,"#thirst")
            }

            if (msg.data.oxygen  >= 0) {
                Progress(msg.data.oxygen ,"#oxygen")
            }

            if (msg.data.stress >= 0) {
                Progress(msg.data.stress,"#stress")
            }

            if (msg.data.stamina >= 0) {
                Progress(msg.data.stamina,"#stamina")
            }
            
            // voice
            if (msg.data.voice >= 0) {
                Progress(msg.data.voice,"#voice")
            }

            if (msg.data.isTalking == true) {
                $("#voice").css("stroke","#F1C40F");
            }else{
                $("#voice").css("stroke","#FFF");
            }

            if (msg.data.isTransmitting == true) {
                $("#voice").css("stroke","#e74c3c");
            }else{
                $("#voice").css("stroke","#FFF");
            }

            if (msg.data.modeDev == true) {
                $("#develophud").show()
            }else{
                $("#develophud").hide()
            }

            if (msg.data.modeDebug == true) {
                $("#debuginghud").show()
            }else{
                $("#debuginghud").hide()
            }

            if (msg.data.fuel >= 0) {
                setProgressFuel(msg.data.fuel, ".progress-fuel");
            }

            if (msg.data.beltShow == true) {
                $(".car-seatbelt-info").show()
            }else{
                $(".car-seatbelt-info").hide()
            }

            if (msg.data.engineDamageShow == true) {
                $(".car-enginedamage-info").show()
            }else{
                $(".car-enginedamage-info").hide()
            }

            if (msg.data.gasDamageShow == true) {
                $(".car-fueldamage-info").show()
            }else{
                $(".car-fueldamage-info").hide()
            }
            break;
        case "game":
            //Its For Game Hud Like Show Hud vehicle compass and other
            // if (msg.data.modeDev == true) {
            //     $("#develophud").show()
            // }else{
            //     $("#develophud").hide()
            // }

            // if (msg.data.modeDebug == true) {
            //     $("#debuginghud").show()
            // }else{
            //     $("#debuginghud").hide()
            // }

            break;
        case "settings":
            $('.settings').show()
            document.getElementById("healthtoggle").checked = (msg.dataset.health == "true");
            document.getElementById("armortoggle").checked = (msg.dataset.armor == "true");
            document.getElementById("hungertoggle").checked = (msg.dataset.hunger == "true");
            document.getElementById("thirsttoggle").checked = (msg.dataset.thirst == "true");
            document.getElementById("staminatoggle").checked = (msg.dataset.stamina == "true");
            document.getElementById("oxygentoggle").checked = (msg.dataset.oxygen == "true");
            document.getElementById("stresstoggle").checked = (msg.dataset.stress == "true");
            document.getElementById("voicetoggle").checked = (msg.dataset.voice == "true");
            break;
        case "initialize":
            $('.cash').hide();
            $('.cashtransaction').hide();

            $("#develophud").hide()
            $("#debuginghud").hide()
            Progress(100,"#develop")
            Progress(100,"#debuging")

            if (msg.toggledata.health == "true") {
                $("#healthhud").fadeOut(500)
            }else{
                $("#healthhud").fadeIn(500)
            }

            if (msg.toggledata.armor == "true") {
                $("#armorhud").fadeOut(500)
            }else{
                $("#armorhud").fadeIn(500)
            }

            if (msg.toggledata.hunger == "true") {
                $("#hungerhud").fadeOut(500)
            }else{
                $("#hungerhud").fadeIn(500)
            }

            if (msg.toggledata.thirst == "true") {
                $("#thirsthud").fadeOut(500)
            }else{
                $("#thirsthud").fadeIn(500)
            }

            if (msg.toggledata.stamina == "true") {
                $("#staminahud").fadeOut(500)
            }else{
                $("#staminahud").fadeIn(500)
            }

            if (msg.toggledata.oxygen == "true") {
                $("#oxygenhud").fadeOut(500)
            }else{
                $("#oxygenhud").fadeIn(500)
            }

            if (msg.toggledata.stress == "true") {
                $("#stresshud").fadeOut(500)
            }else{
                $("#stresshud").fadeIn(500)
            }

            if (msg.toggledata.voice == "true") {
                $("#voicehud").fadeOut(500)
            }else{
                $("#voicehud").fadeIn(500)
            }
            // Color Data
            if (msg.colordata.health != "") {
                $("#health").css("stroke",msg.colordata.health)
            }

            if (msg.colordata.armor != "") {
                $("#armor").css("stroke",msg.colordata.armor)
            }

            if (msg.colordata.hunger != "") {
                $("#hunger").css("stroke",msg.colordata.hunger)
            }

            if (msg.colordata.thirst != "") {
                $("#thirst").css("stroke",msg.colordata.thirst)
            }

            if (msg.colordata.stamina != "") {
                $("#stamina").css("stroke",msg.colordata.stamina)
            }

            if (msg.colordata.oxygen != "") {
                $("#oxygen").css("stroke",msg.colordata.oxygen)
            }

            if (msg.colordata.stress != "") {
                $("#stress").css("stroke",msg.colordata.stress)
            }

            if (msg.colordata.voice != "") {
                $("#voice").css("stroke",msg.colordata.voice)
            }
            break;
        case "interactions":
            //Draw Text
            if (msg.data.show == true) {
                $("#containerInteractions").fadeIn(300)
            }else{
                $("#containerInteractions").fadeOut(300)
            }

            if (msg.data.type == "success") {
                $("#boxinteractions").css("background","#00b894");
            }else if(msg.data.type == "error"){
                $("#boxinteractions").css("background","#d63031");
            }else if(msg.data.type == "classic"){
                $("#boxinteractions").css("background","#30475e");
            }else if(msg.data.type == "info"){
                $("#boxinteractions").css("background","#0985e3f8");
            }else{
                $("#boxinteractions").css("background","#0985e3f8");
            }
            document.getElementById("textinteractions").innerHTML = msg.data.message;
            
            break;
        case "textbox":
            textboxactive = true
            OpenMenu(msg.data);
            break;
        default:
            return;
    }
})

// Click Event


$("#submit").click(() => {
    SubmitData();
})

$(".header").click(() => {
    closesettings();
})

$(document).on('mousedown', (event) => {
    let element = event.target;
    if (element.id.split("-")[0] === 'target') {
        let eventData = $("#"+element.id).data('eventData');
        let parametersData = $("#"+element.id).data('parametersData');
        $.post('https://ab-ui/ab-ui:targetSelectOption', JSON.stringify({
            entity : entitydata,
            option :{
                event: eventData,
                parameters: parametersData
            },
            context: contextdata,
        }));

        $(".target-label").html("");
        $('.target-wrapper').hide();
    }
});

$(document).keydown(function(event) {
    var key = (event.keyCode ? event.keyCode : event.which);
    if (key == 27) {
        if (contextmenuactive) {
            contextmenuactive = false
            $(".buttoncontext").html("");
            $(".containercontext").hide();
            $.post('https://ab-ui/closecontext', JSON.stringify({}));
        }
        if (textboxactive) {
            CancelMenu();
        }
    }
});

$(document).click(function(event){
    let $target = $(event.target);
    if ($target.closest('.button-context').length && $('.button-context').is(":visible")) {
        // $("#"+event.target.id).data('eventData', "context:cl:thisme");
        if (event.target.id == "backmenu") {
            //console.log("this for backmenu",menucontextdata.length)
            $(".buttoncontext").html("");
            $.each(menucontextdata, function (index1, item1) {
                if (item1.children) {
                    $(".buttoncontext").append('<div class="button-context" id="contextmenu-'+index1+'"><div class="titlecontext" id="contextmenu-'+index1+'">'+item1.title+'</div><div class="descriptioncontext" id="contextmenu-'+index1+'">'+item1.description+'</div></div>');
                    $("#contextmenu-"+index1).data("action",item1.action);
                    $("#contextmenu-"+index1).data("key",item1.key);
                    $("#contextmenu-"+index1).data("children",item1.children);
                }else{
                    $(".buttoncontext").append('<div class="button-context" id="contextmenu-'+index1+'"><div class="titlecontext" id="contextmenu-'+index1+'">'+item1.title+'</div><div class="descriptioncontext" id="contextmenu-'+index1+'">'+item1.description+'</div></div>');
                    $("#contextmenu-"+index1).data("action",item1.action);
                    $("#contextmenu-"+index1).data("key",item1.key);
                    $("#contextmenu-"+index1).data("children",null);
                }
            })
        }else{
            // console.log("Not Back Button")
            if (event.target.id.split("-")[0] === 'contextmenu') {
                let action = $("#"+event.target.id).data('action');
                let key = $("#"+event.target.id).data('key');
                let children = $("#"+event.target.id).data('children');
                if (children) {
                    // Create new Menu for children
                    $(".buttoncontext").html("");
                    $(".buttoncontext").append('<div class="button-context" id="backmenu"><div class="titlecontext" id="backmenu">< Go back</div><div class="descriptioncontext" id="backmenu"></div></div>');
                    $.each(children, function (index1, item1) {
                        if (item1.children) {
                            if (item1.description) {
                                $(".buttoncontext").append('<div class="button-context" id="subcontextmenu-'+index1+'"><div class="titlecontext" id="subcontextmenu-'+index1+'">'+item1.title+'</div><div class="descriptioncontext" id="subcontextmenu-'+index1+'">'+item1.description+'</div></div>');
                            }else{
                                $(".buttoncontext").append('<div class="button-context" id="subcontextmenu-'+index1+'"><div class="titlecontext" id="subcontextmenu-'+index1+'">'+item1.title+'</div><div class="descriptioncontext" id="subcontextmenu-'+index1+'"></div></div>');
                            }
                            
                            $("#subcontextmenu-"+index1).data("action",item1.action);
                            $("#subcontextmenu-"+index1).data("key",item1.key);
                            $("#subcontextmenu-"+index1).data("children",item1.children);
                        }else{
                            if (item1.description) {
                                $(".buttoncontext").append('<div class="button-context" id="subcontextmenu-'+index1+'"><div class="titlecontext" id="subcontextmenu-'+index1+'">'+item1.title+'</div><div class="descriptioncontext" id="subcontextmenu-'+index1+'">'+item1.description+'</div></div>');
                            }else{
                                $(".buttoncontext").append('<div class="button-context" id="subcontextmenu-'+index1+'"><div class="titlecontext" id="subcontextmenu-'+index1+'">'+item1.title+'</div><div class="descriptioncontext" id="subcontextmenu-'+index1+'"></div></div>');
                            }
                            $("#subcontextmenu-"+index1).data("action",item1.action);
                            $("#subcontextmenu-"+index1).data("key",item1.key);
                            $("#subcontextmenu-"+index1).data("children",null);
                        }
                    })
                }else{
                    //Post data
                    //console.log("Dont have Chiclred and submit post data")
                    // contextmenuactive = false
                    $(".buttoncontext").html("");
                    $(".containercontext").hide();
                    $.post('https://ab-ui/'+action, JSON.stringify({
                        key:key
                    }));
                    
                }
            }else if(event.target.id.split("-")[0] === 'subcontextmenu'){
                //console.log("Submit Post data")
                let subaction = $("#"+event.target.id).data('action');
                let subkey = $("#"+event.target.id).data('key');
                // console.log("This Sub Contextmenu",subaction,subkey)
                // contextmenuactive = false
                $(".buttoncontext").html("");
                $(".containercontext").hide();
                $.post('https://ab-ui/'+subaction, JSON.stringify({
                    key:subkey
                }));
            }
        }
    }
})
// skillbarcode

document.addEventListener("keydown", function(ev) {
    if (skillbaractive) {
        let key_pressed = ev.key;
        let valid_keys = ['1','2','3','4'];

        if( valid_keys.includes(key_pressed) ){
            if( key_pressed === key_to_press ){
                let d_start = (180 / Math.PI) * g_start;
                let d_end = (180 / Math.PI) * g_end;
                if( degrees < d_start ){
                    console.log('Failed: Too soon!');
                    wrong();
                }else if( degrees > d_end ){
                    console.log('Failed: Too late!');
                    wrong();
                }else{
                    console.log('Success!');
                    correct();
                }
            }else{
                console.log('Failed: Pressed '+key_pressed+' instead of '+key_to_press);
                wrong();
            }
        }
    }
});