$(document).ready(function(){
  // Listen for NUI Events
 window.addEventListener('message', function(event){
   var item = event.data;
   // Trigger adding a new message to the log and create its display
   if (item.open === 2) {
    // console.log(3)
    // update(item.info);


    if (item.direction) {
      $(".direction").find(".image").attr('style', 'transform: translate3d(' + item.direction + 'px, 0px, 0px)');
      return;
  }

  $(".Street_1").text(item.street);
  $(".Street_2").text(item.street2);

     if (item.atl === false) {
       $(".atlamount").attr("style", "display: none");
       $(".atlamounttxt").attr("style", "display: none");
     }
     else {
       $(".atlamount").attr("style", "display: block");
       $(".atlamounttxt").attr("style", "display: block");
       $(".atlamount").empty();
       $(".atlamount").append(item.atl);
     }

     $(".vehicle").removeClass("hide");
     $(".wrap").removeClass("lower");
     $(".time").removeClass("timelower");

     $(".fuelamount").empty();
     $(".fuelamount").append(item.fuel);
     setProgressFuel(item.fuel,'.progress-fuel');

     $(".speedamount").empty();
     $(".speedamount").append(item.mph);
     setProgressSpeed(item.mph,'.progress-speed');

     $(".Vehicle_hud").show();
     $("#Street1").show()
     $("#Street2").show()
     $("#streetwrapper").show()
     $("#compassindicator").show()
       
       
     
     $(".time").empty();
     $(".time").append(item.time); 


     if (item.belt == true || item.harnessDur > 0) {
       $(".belt").fadeOut(600);
     } else {
       $(".belt").fadeIn(600);
     }

     if (item.engine === true) {
       $(".ENGINE").fadeIn(1000);
     } else {
       $(".ENGINE").fadeOut(1000);
     }

     if (item.GasTank === true) {
       $(".FUEL").fadeIn(1000);
     } else {
       $(".FUEL").fadeOut(1000);
     }

     $(".harness").empty();
     if (item.harnessDur > 0) {
       if (item.harness === true) {
         let colorOn = (item.colorblind) ? 'blue' : 'green';
         $(".harness").append(`<div class='${colorOn}'> HARNESS </div>`);
       } else {
         let colorOff = (item.colorblind) ? 'yellow' : 'red';
         $(".harness").append(`<div class='${colorOff}'> HARNESS </div>`);
       }
     }

     $(".nos").empty();
     if (item.nos > 0) {
       if (item.nosEnabled === false) {
         let colorOn = (item.colorblind) ? 'blue' : 'green';
         $(".nos").append(`<div class='${colorOn}'> ${item.nos} </div>`);
       } else {
         let colorOff = (item.colorblind) ? 'yellow' : 'yellow';
         $(".nos").append(`<div class='${colorOff}'> ${item.nos} </div>`);
       }
     }
   }

   if (item.ShowLocation == true) {
    //  console.log('fat')
    $(".Vehicle_hud").hide();
    $(".belt").fadeOut(0);
    $(".FUEL").fadeOut(0);
    $(".ENGINE").fadeOut(0);
    $("#Street1").show()
    $("#Street2").show()
    $("#streetwrapper").show()
    $("#compassindicator").show()
    // $(".Vehicle_hud").hide();
   }

   if (item.open === 4) {
    // $(".full-screen").fadeIn(100);    
    $(".Vehicle_hud").fadeOut(100);
    $("#Street1").show()
    $("#Street2").show()
    $("#streetwrapper").show()
    $("#compassindicator").show()
   }

   if (item.open === 3) {
     $(".full-screen").fadeOut(100);    
   }    
   if (item.open === 1) {
     //console.log(1)
     $(".full-screen").fadeIn(100);    
   }    
 });
});

//if (screen.width == 2560) {
//	document.getElementById("myH1").style.color = "red";
//}    

function setProgressSpeed(value, element){
 var circle = document.querySelector(element);
 var radius = circle.r.baseVal.value;
 var circumference = radius * 2 * Math.PI;
 var html = $(element).parent().parent().find('span');
 var percent = value*100/220;

 circle.style.strokeDasharray = `${circumference} ${circumference}`;
 circle.style.strokeDashoffset = `${circumference}`;

 const offset = circumference - ((-percent*50)/100) / 100 * circumference;
 circle.style.strokeDashoffset = -offset;

 var predkosc = Math.floor(value * 1.8)
 if (predkosc == 81 || predkosc == 131) {
   predkosc = predkosc - 1
 }

 html.text(predkosc);
}

function setProgressFuel(percent, element){
 var circle = document.querySelector(element);
 var radius = circle.r.baseVal.value;
 var circumference = radius * 2 * Math.PI;
 var html = $(element).parent().parent().find('span');

 circle.style.strokeDasharray = `${circumference} ${circumference}`;
 circle.style.strokeDashoffset = `${circumference}`;

 const offset = circumference - ((-percent*62)/100) / 100 * circumference;
 circle.style.strokeDashoffset = -offset;

 html.text(Math.round(percent));
}