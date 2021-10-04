$(function() {
    let height = 25.5;
    window.addEventListener("message", function(event) {
       
        let item = event.data;
        console.log(JSON.stringify(item))
        if (item.response == 'hud') {
            console.log('this is for the hud')
            hudMenuOpen()
        }else if (item.response == 'hudoff') {
            console.log("closing hud")
            hudMenuClose()
        }
    });
})

function hudMenuOpen()
{
    $('.hud-menu').fadeIn()
}

document.onkeyup = function (data) {
    if (data.key == 'Escape') {
        hudMenuClose();
    }
};

function hudMenuClose()
{
    
    $('.hud-menu').fadeOut()
    $.post('https://ab-hudmenu/closeHud');
}

$(document).ready(function () {
    $('.save-settings').click(() => {
        console.log("SAVING SETTINGS")
        Health = $('input[name="Health"]').prop('checked');
        Armor = $('input[name="Armor"]').prop('checked');
        Food = $('input[name="Food"]').prop('checked');
        Water = $('input[name="Water"]').prop('checked');
        Oxygen = $('input[name="Oxygen"]').prop('checked');
        Stress = $('input[name="Stress"]').prop('checked');

        //Send post message with new settings
        $.post(
            'https://ab-hudmenu/UpdateHudSettings',
            JSON.stringify({
                Health: Health,
                Armor: Armor,
                Food: Food,
                Water: Water,
                Oxygen: Oxygen,
                Stress: Stress
            }),
        );
    });
    $('.CloseHud').click(() => {
        hudMenuClose()
    });
});
