$(function() {
    let height = 25.5;
    window.addEventListener("message", function(event) {
        if (event.data.type == "updateStatusHud") {
            $("#varSetHealth")
                .find(".progress")
                .attr("style", "width: " + event.data.varSetHealth + "%;");
            $("#varSetArmor")
                .find(".progress")
                .attr("style", "width: " + event.data.varSetArmor + "%;");

            widthHeightSplit(
                event.data.varSetHunger,
                $("#varSetHunger").find(".progressBar")
            );
            widthHeightSplit(
                event.data.varSetThirst,
                $("#varSetThirst").find(".progressBar")
            );
            widthHeightSplit(
                event.data.varSetOxy,
                $("#varSetOxy").find(".progressBar")
            );

            widthHeightSplit(
                event.data.varSetStress,
                $("#varSetStress").find(".progressBar")
            );

            let voice = event.data.varSetVoice;
            if (voice == 1) {
                Progress(event.data.varSetVoice * 25, '.progress-voice')
            }
            if (voice == 2) {
                Progress(event.data.varSetVoice * 30, '.progress-voice')
            }
            if (voice == 3) {
                Progress(101, '.progress-voice')
            }
            if (event.data.hasParachute == true) {
                $("#parachute").removeClass("hidden");
            } else {
                $("#parachute").addClass("hidden");
            }
            if (event.data.setOxy == false){
                $("#progress-oxygens").fadeOut();
                $("#oxygen-circle").fadeOut();
                document.getElementById("stress-circle").style.left = "88px";
                document.getElementById("stressLeft").style.left = "87%";

            }else if(event.data.setOxy == true){
                $("#oxygen-circle").fadeIn();
                $("#progress-oxygens").fadeIn();
                document.getElementById("stressLeft").style.left = "106%";
            }
            if (event.data.setStress == false){
                $("#stress-circle").fadeOut();
                $("#stressLeft").fadeOut();
            }else if(event.data.setStress == true && event.data.setOxy == false){
                $("#stress-circle").fadeIn();
                $("#stressLeft").fadeIn();
                document.getElementById("stress-circle").style.left = "88px";
            }else if(event.data.setStress == true){
                $("#stress-circle").fadeIn();
                $("#stressLeft").fadeIn();
                document.getElementById("stress-circle").style.left = "108px";
            }
            //  console.log("for shit",event.data.setStress,event.data.setOxy)
            // $("#progress-oxygen").addClass("hidden");
            changeColor($(".progress-health"), event.data.varSetHealth, false)
            changeColor($(".progress-armor"), event.data.varSetArmor, false)
            changeColor($(".progress-burger"), event.data.varSetHunger, false)
            changeColor($(".progress-water"), event.data.varSetThirst, false)
            changeColor($(".progress-oxygen"), event.data.varSetOxy, false)
            changeColor($(".progress-stress"), event.data.varSetStress, true)
            Progress(event.data.varSetHealth, '.progress-health')
            Progress(event.data.varSetHunger, '.progress-burger')
            Progress(event.data.varSetThirst, '.progress-water')
            Progress(event.data.varSetArmor, '.progress-armor')
            Progress(event.data.varSetOxy, '.progress-oxygen')
            Progress(event.data.varSetStress, '.progress-stress')

            if (event.data.varSetHunger <= 15) {
                document.getElementById("progress-hungerr").style.fill = "#B82929";
            } else {
                document.getElementById("progress-hungerr").style.fill = "#1c1c20";
            }

            if (event.data.varSetThirst <= 15) {
                document.getElementById("progress-thirstt").style.fill = "#B82929";
            } else {
                document.getElementById("progress-thirstt").style.fill = "#1c1c20";
            }

            if (event.data.varSetHealth == 100) {
                Progress(event.data.varSetHealth + 1, '.progress-health')
            } else {
                Progress(event.data.varSetHealth, '.progress-health')
            }

            if (event.data.varSetArmor == 100) {
                Progress(event.data.varSetArmor + 1, '.progress-armor')
            } else {
                Progress(event.data.varSetArmor, '.progress-armor')
            }

            if (event.data.varSetHunger == 100) {
                Progress(event.data.varSetHunger + 1, '.progress-burger')
            } else {
                Progress(event.data.varSetHunger, '.progress-burger')
            }

            if (event.data.varSetThirst == 100) {
                Progress(event.data.varSetThirst + 1, '.progress-water')
            } else {
                Progress(event.data.varSetThirst, '.progress-water')
            }
        } else if (event.data.type == "talkingStatus") {
            if (event.data.is_talking) {
                document.getElementById("progress-voicer").style.stroke = "#D5CD31";
                document.getElementById("back-voicer").style.fill = "#B9B44E";
            } else {
                document.getElementById("progress-voicer").style.stroke = "";
                document.getElementById("back-voicer").style.fill = "";
            }
        } else if (event.data.type == "transmittingStatus") {
            var element = document.getElementById("progress-voicer");
            var backelement = document.getElementById("back-voicer");
            if (event.data.is_transmitting) {
                element.classList.add("transmitting");
                backelement.classList.add("transmitting2");
            } else {
                element.classList.remove("transmitting");
                backelement.classList.remove("transmitting2");
            }
        }
    });

    function widthHeightSplit(value, ele) {
        let eleHeight = (value / 100) * height;
        let leftOverHeight = height - eleHeight;

        ele.attr(
            "style",
            "height: " + eleHeight + "px; top: " + leftOverHeight + "px;"
        );
    }

    function changeColor(ele, value, flip) {
        let add = false;
        if (flip) {
            if (value > 85) {
                add = true;
            }
        } else {
            if (value < 25) {
                add = true;
            }
        }

        if (add) {
            // ele.find(".barIcon").addClass("danger")
            ele.find(".progressBar").addClass("dangerGrad");
        } else {
            // ele.find(".barIcon").removeClass("danger")
            ele.find(".progressBar").removeClass("dangerGrad");
        }
    }
});


function Progress(percent, element) {
    var circle = document.querySelector(element);
    var radius = circle.r.baseVal.value;
    var circumference = radius * 2 * Math.PI;
    var html = $(element).parent().parent().find("span");

    circle.style.strokeDasharray = `${circumference} ${circumference}`;
    circle.style.strokeDashoffset = `${circumference}`;

    const offset = circumference - ((-percent * 99) / 100 / 100) * circumference;
    circle.style.strokeDashoffset = -offset;

    html.text(Math.round(percent));
}
