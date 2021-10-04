$("#leftpos").change(function(){
    const c = document.getElementById("containerhud")
    switch (this.checked) {
        case true:
            // console.log("Hud in Middle")
            c.style.marginLeft = "auto";
            c.style.marginRight = "auto";
            c.style.left = '0';
            c.style.right = '0';
            c.style.justifyContent = "center";
            break;
        case false:
            // console.log("Hud in Left")
            c.style.marginLeft = "";
            c.style.marginRight = "";
            c.style.left = '';
            c.style.right = '';
            c.style.justifyContent = "";
            break;
    }
})

$("#toppos").change(function(){
    const test = document.getElementById("containerhud")
    switch (this.checked) {
        case true:
            // console.log("Hud in TOP")
            test.style.bottom = "";
            test.style.top = "0%";
            break;
        case false:
            // console.log("Hud in BOTTOM")
            test.style.top = "";
            test.style.bottom = "0%";
            break;
    }
})