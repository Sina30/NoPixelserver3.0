window.onload = function(e)
{
    let menuStructure = {};
    let activeMenuIndex = 0;
    let maxMenuItems = 10;
    let scriptName = "ab-wheelfitment";

    function toggleMenu(state)
    {
        var menu = menuStructure[0];
        
        if(state)
        {
            if(menu.currentItem < maxMenuItems)
            {
                $(`.${menu.menu}`).empty();

                for(var i = 0; i < Object.keys(menu.itemsArray).length; i++)
                {
                    if(i < maxMenuItems)
                    {
                        $(`.${menu.menu}`).append(menu.itemsArray[i]);
                    }
                }

                $(`.${menu.menu} .item_selected`).find("i").remove();
                menu.itemsArray[menu.currentItem].classList.add("item_selected");
                var currentHTML = $(`.${menu.menu} .item_selected`).html();
                $(`.${menu.menu} .item_selected`).html(`<i class = "fas fa-angle-double-right"></i> ${currentHTML}`);

                var val1 = $(`.${menu.menu} .item_selected`).attr("class").split(" ")[0];
                var val2 = $(`.${menu.menu} .item_selected .item_1`).text();
                var val3 = $(`.${menu.menu} .item_selected .item_2`).text();
                var val4 = $(`.${menu.menu} .item_selected .item_1`).attr("class").split(" ")[1];
                var val5 = $(`.${menu.menu} .item_selected .item_2`).attr("class").split(" ")[1];

                $.post(`https://${scriptName}/currentItem`, JSON.stringify({
                    menu: menu.menu,
                    name: val1,
                    item_1: val2,
                    item_2: val3,
                    type_1: val4,
                    type_2: val5,
                    sliderItems_1: menu.items[menu.currentItem].sliderItems_1,
                    sliderItems_2: menu.items[menu.currentItem].sliderItems_2,
                    sliderPos: menu.items[menu.currentItem].currentSlider
                }));
            }
            else
            {
                $(`.${menu.menu}`).empty();

                for(var i = 0; i < Object.keys(menu.itemsArray).length; i++)
                {
                    if(i > (menu.currentItem - maxMenuItems) && i <= (maxMenuItems + (menu.currentItem - maxMenuItems)))
                    {
                        $(`.${menu.menu}`).append(menu.itemsArray[i]);
                    }
                }

                $(`.${menu.menu} .item_selected`).find("i").remove();
                menu.itemsArray[menu.currentItem].classList.add("item_selected");
                var currentHTML = $(`.${menu.menu} .item_selected`).html();
                $(`.${menu.menu} .item_selected`).html(`<i class = "fas fa-angle-double-right"></i> ${currentHTML}`);

                var val1 = $(`.${menu.menu} .item_selected`).attr("class").split(" ")[0];
                var val2 = $(`.${menu.menu} .item_selected .item_1`).text();
                var val3 = $(`.${menu.menu} .item_selected .item_2`).text();
                var val4 = $(`.${menu.menu} .item_selected .item_1`).attr("class").split(" ")[1];
                var val5 = $(`.${menu.menu} .item_selected .item_2`).attr("class").split(" ")[1];

                $.post(`https://${scriptName}/currentItem`, JSON.stringify({
                    menu: menu.menu,
                    name: val1,
                    item_1: val2,
                    item_2: val3,
                    type_1: val4,
                    type_2: val5,
                    sliderItems_1: menu.items[menu.currentItem].sliderItems_1,
                    sliderItems_2: menu.items[menu.currentItem].sliderItems_2,
                    sliderPos: menu.items[menu.currentItem].currentSlider
                }));
            }

            $("#menu_heading").text(menu.heading);
            $("#menu_subheading").text(menu.subheading);
            $(`.${menu.menu}`).show();
            $("#menu_container").show();
        }
        else
        {
            $("#menu_container").hide();
            $(`.${menu.menu}`).hide();
        }
    }

    function createMenu(structure)
    {
        menuStructure = structure

        for(var i in menuStructure)
        {
            var menu = menuStructure[i];

            $("#menu_container").append(`<ul id = "menu_items" class = "${menu.menu}" style = "display: none; order: 5;"></ul>`);

            for(var j in menu.items)
            {
                var item = menu.items[j];

                if(item.type_1 == "slider")
                {
                    item.label_1 = "< " + item.sliderItems_1[item.sliderStartPos - 1] + " >";

                    item.currentSlider = item.sliderStartPos - 1;
                }

                if(item.type_2 == "slider")
                {
                    item.label_2 = "< " + item.sliderItems_2[item.sliderStartPos - 1] + " >";

                    item.currentSlider = item.sliderStartPos - 1;
                }

                $(`.${menu.menu}`).append(`<li class = "${item.name}"><span class = "item_1 ${item.type_1}">${item.label_1}</span> <span class = "item_2 ${item.type_2}" style = "float: right;">${item.label_2}</span></li>`);
            }

            menu.itemsArray = $(`.${menu.menu} li`).toArray();
            menu.currentItem = 0;
            menu.previousItem = 0;
        }

        activeMenuIndex = 0;
    }

    function destroyMenu()
    {
        for(var i in menuStructure)
        {
            $(`.${menuStructure[i].menu}`).remove();
        }

        menuStructure = {}
    }

    function addMenu(structure)
    {
        menuStructure[Object.keys(menuStructure).length + 1] = structure;

        var menu = menuStructure[Object.keys(menuStructure).length];

        $("#menu_container").append(`<ul id = "menu_items" class = "${menu.menu}" style = "display: none; order: 5;"></ul>`);

        for(var j in menu.items)
        {
            var item = menu.items[j];

            if(item.type_1 == "slider")
            {
                item.label_1 = "< " + item.sliderItems_1[item.sliderStartPos - 1] + " >";

                item.currentSlider = item.sliderStartPos - 1;
            }

            if(item.type_2 == "slider")
            {
                item.label_2 = "< " + item.sliderItems_2[item.sliderStartPos - 1] + " >";

                item.currentSlider = item.sliderStartPos - 1;
            }

            $(`.${menu.menu}`).append(`<li class = "${item.name}"><span class = "item_1 ${item.type_1}">${item.label_1}</span> <span class = "item_2 ${item.type_2}" style = "float: right;">${item.label_2}</span></li>`);
        }

        menu.itemsArray = $(`.${menu.menu} li`).toArray();
        menu.currentItem = 0;
        menu.previousItem = 0;
    }

    function removeMenu(menu)
    {
        for(var i in menuStructure)
        {
            if(menuStructure[i].menu == menu)
            {
                $(`.${menuStructure[i].menu}`).remove();
                menuStructure.splice(i, 1);

                break;
            }
        }
    }

    function switchMenu(menu)
    {
        $(`.${menuStructure[activeMenuIndex].menu}`).hide();

        for(var i in menuStructure)
        {
            if(menuStructure[i].menu == menu)
            {
                activeMenuIndex = i;

                break;
            }
        }

        $("#menu_heading").text(menuStructure[activeMenuIndex].heading);
        $("#menu_subheading").text(menuStructure[activeMenuIndex].subheading);

        if(menuStructure[activeMenuIndex].currentItem < maxMenuItems)
        {
            $(`.${menuStructure[activeMenuIndex].menu}`).empty();

            for(var i = 0; i < Object.keys(menuStructure[activeMenuIndex].itemsArray).length; i++)
            {
                if(i < maxMenuItems)
                {
                    $(`.${menuStructure[activeMenuIndex].menu}`).append(menuStructure[activeMenuIndex].itemsArray[i]);
                }
            }
        }
        else
        {
            $(`.${menuStructure[activeMenuIndex].menu}`).empty();

            for(var i = 0; i < Object.keys(menuStructure[activeMenuIndex].itemsArray).length; i++)
            {
                if(i > (menuStructure[activeMenuIndex].currentItem - maxMenuItems) && i <= (maxMenuItems + (menuStructure[activeMenuIndex].currentItem - maxMenuItems)))
                {
                    $(`.${menuStructure[activeMenuIndex].menu}`).append(menuStructure[activeMenuIndex].itemsArray[i]);
                }
            }
        }

        $(`.${menuStructure[activeMenuIndex].menu} .item_selected`).find("i").remove();
        menuStructure[activeMenuIndex].itemsArray[menuStructure[activeMenuIndex].currentItem].classList.add("item_selected");
        var currentHTML = $(`.${menuStructure[activeMenuIndex].menu} .item_selected`).html();
        $(`.${menuStructure[activeMenuIndex].menu} .item_selected`).html(`<i class = "fas fa-angle-double-right"></i> ${currentHTML}`);

        var val1 = $(`.${menuStructure[activeMenuIndex].menu} .item_selected`).attr("class").split(" ")[0];
        var val2 = $(`.${menuStructure[activeMenuIndex].menu} .item_selected .item_1`).text();
        var val3 = $(`.${menuStructure[activeMenuIndex].menu} .item_selected .item_2`).text();
        var val4 = $(`.${menuStructure[activeMenuIndex].menu} .item_selected .item_1`).attr("class").split(" ")[1];
        var val5 = $(`.${menuStructure[activeMenuIndex].menu} .item_selected .item_2`).attr("class").split(" ")[1];

        $.post(`https://${scriptName}/currentItem`, JSON.stringify({
            menu: menuStructure[activeMenuIndex].menu,
            name: val1,
            item_1: val2,
            item_2: val3,
            type_1: val4,
            type_2: val5,
            sliderItems_1: menuStructure[activeMenuIndex].items[menuStructure[activeMenuIndex].currentItem].sliderItems_1,
            sliderItems_2: menuStructure[activeMenuIndex].items[menuStructure[activeMenuIndex].currentItem].sliderItems_2,
            sliderPos: menuStructure[activeMenuIndex].items[menuStructure[activeMenuIndex].currentItem].currentSlider
        }));

        $.post(`https://${scriptName}/switchedMenuSuccessfully`, JSON.stringify({
            menu: menuStructure[activeMenuIndex].menu,
            name: val1,
            item_1: val2,
            item_2: val3,
            type_1: val4,
            type_2: val5,
            sliderItems_1: menuStructure[activeMenuIndex].items[menuStructure[activeMenuIndex].currentItem].sliderItems_1,
            sliderItems_2: menuStructure[activeMenuIndex].items[menuStructure[activeMenuIndex].currentItem].sliderItems_2,
            sliderPos: menuStructure[activeMenuIndex].items[menuStructure[activeMenuIndex].currentItem].currentSlider
        }));

        $(`.${menuStructure[activeMenuIndex].menu}`).show();
    }

    function updateMenuStatus(text)
    {
        $("#menu_status span").text(text);
    }

    function updateItemSliderItems(menu, item, name, sliderItems)
    {
        for(var i in menuStructure)
        {
            if(menuStructure[i].menu == menu)
            {
                if(item == 1)
                {
                    for(var j in menuStructure[i].items)
                    {
                        if(menuStructure[i].items[j].name == name)
                        {
                            menuStructure[i].items[j].currentSlider = 0;
                            menuStructure[i].items[j].sliderItems_1 = sliderItems;

                            menuStructure[i].items[j].label_1 = menuStructure[i].items[j].sliderItems_1[menuStructure[i].items[j].currentSlider];

                            $(`.${menuStructure[i].menu} .${menuStructure[i].items[j].name} .item_1`).text("< " + menuStructure[i].items[j].label_1 + " >");
                        }
                    }
                }
                else if(item == 2)
                {
                    for(var j in menuStructure[i].items)
                    {
                        if(menuStructure[i].items[j].name == name)
                        {
                            menuStructure[i].items[j].currentSlider = 0;
                            menuStructure[i].items[j].sliderItems_2 = sliderItems;

                            menuStructure[i].items[j].label_2 = menuStructure[i].items[j].sliderItems_2[menuStructure[i].items[j].currentSlider];
                            
                            $(`.${menuStructure[i].menu} .${menuStructure[i].items[j].name} .item_2`).text("< " + menuStructure[i].items[j].label_2 + " >");
                        }
                    }
                }

                var val1 = $(`.${menuStructure[i].menu} .item_selected`).attr("class").split(" ")[0];
                var val2 = $(`.${menuStructure[i].menu} .item_selected .item_1`).text();
                var val3 = $(`.${menuStructure[i].menu} .item_selected .item_2`).text();
                var val4 = $(`.${menuStructure[i].menu} .item_selected .item_1`).attr("class").split(" ")[1];
                var val5 = $(`.${menuStructure[i].menu} .item_selected .item_2`).attr("class").split(" ")[1];

                $.post(`https://${scriptName}/currentItem`, JSON.stringify({
                    menu: menuStructure[i].menu,
                    name: val1,
                    item_1: val2,
                    item_2: val3,
                    type_1: val4,
                    type_2: val5,
                    sliderItems_1: menuStructure[i].items[menuStructure[i].currentItem].sliderItems_1,
                    sliderItems_2: menuStructure[i].items[menuStructure[i].currentItem].sliderItems_2,
                    sliderPos: menuStructure[i].items[menuStructure[i].currentItem].currentSlider
                }));

                break;
            }
        }
    }

    function updateItemSlider(menu, item, name, sliderPos)
    {
        for(var i in menuStructure)
        {
            if(menuStructure[i].menu == menu)
            {
                if(item == 1)
                {
                    for(var j in menuStructure[i].items)
                    {
                        if(menuStructure[i].items[j].name == name)
                        {
                            menuStructure[i].items[j].currentSlider = sliderPos - 1;

                            menuStructure[i].items[j].label_1 = menuStructure[i].items[j].sliderItems_1[menuStructure[i].items[j].currentSlider];

                            $(`.${menuStructure[i].menu} .${menuStructure[i].items[j].name} .item_1`).text("< " + menuStructure[i].items[j].label_1 + " >");
                        }
                    }
                }
                else if(item == 2)
                {
                    for(var j in menuStructure[i].items)
                    {
                        if(menuStructure[i].items[j].name == name)
                        {
                            menuStructure[i].items[j].currentSlider = sliderPos - 1;

                            menuStructure[i].items[j].label_2 = menuStructure[i].items[j].sliderItems_2[menuStructure[i].items[j].currentSlider];
                            
                            $(`.${menuStructure[i].menu} .${menuStructure[i].items[j].name} .item_2`).text("< " + menuStructure[i].items[j].label_2 + " >");
                        }
                    }
                }

                var val1 = $(`.${menuStructure[i].menu} .item_selected`).attr("class").split(" ")[0];
                var val2 = $(`.${menuStructure[i].menu} .item_selected .item_1`).text();
                var val3 = $(`.${menuStructure[i].menu} .item_selected .item_2`).text();
                var val4 = $(`.${menuStructure[i].menu} .item_selected .item_1`).attr("class").split(" ")[1];
                var val5 = $(`.${menuStructure[i].menu} .item_selected .item_2`).attr("class").split(" ")[1];

                $.post(`https://${scriptName}/currentItem`, JSON.stringify({
                    menu: menuStructure[i].menu,
                    name: val1,
                    item_1: val2,
                    item_2: val3,
                    type_1: val4,
                    type_2: val5,
                    sliderItems_1: menuStructure[i].items[menuStructure[i].currentItem].sliderItems_1,
                    sliderItems_2: menuStructure[i].items[menuStructure[i].currentItem].sliderItems_2,
                    sliderPos: menuStructure[i].items[menuStructure[i].currentItem].currentSlider
                }));

                break;
            }
        }
    }

    function updateItemText(menu, item, name, label)
    {
        for(var i in menuStructure)
        {
            if(menuStructure[i].menu == menu)
            {
                if(item == 1)
                {
                    for(var j in menuStructure[i].items)
                    {
                        if(menuStructure[i].items[j].name == name)
                        {
                            menuStructure[i].items[j].label_1 = label;

                            $(`.${menuStructure[i].menu} .${menuStructure[i].items[j].name} .item_1`).text(menuStructure[i].items[j].label_1);
                        }
                    }
                }
                else if(item == 2)
                {
                    for(var j in menuStructure[i].items)
                    {
                        if(menuStructure[i].items[j].name == name)
                        {
                            menuStructure[i].items[j].label_2 = label;

                            $(`.${menuStructure[i].menu} .${menuStructure[i].items[j].name} .item_2`).text(menuStructure[i].items[j].label_2);
                        }
                    }
                }

                var val1 = $(`.${menuStructure[i].menu} .item_selected`).attr("class").split(" ")[0];
                var val2 = $(`.${menuStructure[i].menu} .item_selected .item_1`).text();
                var val3 = $(`.${menuStructure[i].menu} .item_selected .item_2`).text();
                var val4 = $(`.${menuStructure[i].menu} .item_selected .item_1`).attr("class").split(" ")[1];
                var val5 = $(`.${menuStructure[i].menu} .item_selected .item_2`).attr("class").split(" ")[1];

                $.post(`https://${scriptName}/currentItem`, JSON.stringify({
                    menu: menuStructure[i].menu,
                    name: val1,
                    item_1: val2,
                    item_2: val3,
                    type_1: val4,
                    type_2: val5,
                    sliderItems_1: menuStructure[i].items[menuStructure[i].currentItem].sliderItems_1,
                    sliderItems_2: menuStructure[i].items[menuStructure[i].currentItem].sliderItems_2,
                    sliderPos: menuStructure[i].items[menuStructure[i].currentItem].currentSlider
                }));

                break;
            }
        }
    }

    function scrollFunctionality(direction)
    {
        var menu = menuStructure[activeMenuIndex];

        switch(direction)
        {
            case "left":
                if(menu.items[menu.currentItem].type_1 == "slider")
                {
                    if(menu.items[menu.currentItem].currentSlider == 0)
                    {
                        menu.items[menu.currentItem].currentSlider = Object.keys(menu.items[menu.currentItem].sliderItems_1).length - 1;

                        menu.items[menu.currentItem].label_1 = menu.items[menu.currentItem].sliderItems_1[menu.items[menu.currentItem].currentSlider];

                        $(`.${menu.menu} .${menu.items[menu.currentItem].name} .item_1`).text("< " + menu.items[menu.currentItem].label_1 + " >");

                        var val1 = $(`.${menu.menu} .item_selected`).attr("class").split(" ")[0];
                        var val2 = $(`.${menu.menu} .item_selected .item_1`).text();
                        var val3 = $(`.${menu.menu} .item_selected .item_2`).text();
                        var val4 = $(`.${menu.menu} .item_selected .item_1`).attr("class").split(" ")[1];
                        var val5 = $(`.${menu.menu} .item_selected .item_2`).attr("class").split(" ")[1];

                        $.post(`https://${scriptName}/currentItem`, JSON.stringify({
                            menu: menu.menu,
                            name: val1,
                            item_1: val2,
                            item_2: val3,
                            type_1: val4,
                            type_2: val5,
                            sliderItems_1: menu.items[menu.currentItem].sliderItems_1,
                            sliderItems_2: menu.items[menu.currentItem].sliderItems_2,
                            sliderPos: menu.items[menu.currentItem].currentSlider
                        }));
                    }
                    else if(menu.items[menu.currentItem].currentSlider > 0)
                    {
                        menu.items[menu.currentItem].currentSlider--;

                        menu.items[menu.currentItem].label_1 = menu.items[menu.currentItem].sliderItems_1[menu.items[menu.currentItem].currentSlider];

                        $(`.${menu.menu} .${menu.items[menu.currentItem].name} .item_1`).text("< " + menu.items[menu.currentItem].label_1 + " >");

                        var val1 = $(`.${menu.menu} .item_selected`).attr("class").split(" ")[0];
                        var val2 = $(`.${menu.menu} .item_selected .item_1`).text();
                        var val3 = $(`.${menu.menu} .item_selected .item_2`).text();
                        var val4 = $(`.${menu.menu} .item_selected .item_1`).attr("class").split(" ")[1];
                        var val5 = $(`.${menu.menu} .item_selected .item_2`).attr("class").split(" ")[1];

                        $.post(`https://${scriptName}/currentItem`, JSON.stringify({
                            menu: menu.menu,
                            name: val1,
                            item_1: val2,
                            item_2: val3,
                            type_1: val4,
                            type_2: val5,
                            sliderItems_1: menu.items[menu.currentItem].sliderItems_1,
                            sliderItems_2: menu.items[menu.currentItem].sliderItems_2,
                            sliderPos: menu.items[menu.currentItem].currentSlider
                        }));
                    }
                }

                if(menu.items[menu.currentItem].type_2 == "slider")
                {
                    if(menu.items[menu.currentItem].currentSlider == 0)
                    {
                        menu.items[menu.currentItem].currentSlider = Object.keys(menu.items[menu.currentItem].sliderItems_2).length - 1;

                        menu.items[menu.currentItem].label_2 = menu.items[menu.currentItem].sliderItems_2[menu.items[menu.currentItem].currentSlider];

                        $(`.${menu.menu} .${menu.items[menu.currentItem].name} .item_2`).text("< " + menu.items[menu.currentItem].label_2 + " >");

                        var val1 = $(`.${menu.menu} .item_selected`).attr("class").split(" ")[0];
                        var val2 = $(`.${menu.menu} .item_selected .item_1`).text();
                        var val3 = $(`.${menu.menu} .item_selected .item_2`).text();
                        var val4 = $(`.${menu.menu} .item_selected .item_1`).attr("class").split(" ")[1];
                        var val5 = $(`.${menu.menu} .item_selected .item_2`).attr("class").split(" ")[1];

                        $.post(`https://${scriptName}/currentItem`, JSON.stringify({
                            menu: menu.menu,
                            name: val1,
                            item_1: val2,
                            item_2: val3,
                            type_1: val4,
                            type_2: val5,
                            sliderItems_1: menu.items[menu.currentItem].sliderItems_1,
                            sliderItems_2: menu.items[menu.currentItem].sliderItems_2,
                            sliderPos: menu.items[menu.currentItem].currentSlider
                        }));
                    }
                    else if(menu.items[menu.currentItem].currentSlider > 0)
                    {
                        menu.items[menu.currentItem].currentSlider--;

                        menu.items[menu.currentItem].label_2 = menu.items[menu.currentItem].sliderItems_2[menu.items[menu.currentItem].currentSlider];

                        $(`.${menu.menu} .${menu.items[menu.currentItem].name} .item_2`).text("< " + menu.items[menu.currentItem].label_2 + " >");

                        var val1 = $(`.${menu.menu} .item_selected`).attr("class").split(" ")[0];
                        var val2 = $(`.${menu.menu} .item_selected .item_1`).text();
                        var val3 = $(`.${menu.menu} .item_selected .item_2`).text();
                        var val4 = $(`.${menu.menu} .item_selected .item_1`).attr("class").split(" ")[1];
                        var val5 = $(`.${menu.menu} .item_selected .item_2`).attr("class").split(" ")[1];

                        $.post(`https://${scriptName}/currentItem`, JSON.stringify({
                            menu: menu.menu,
                            name: val1,
                            item_1: val2,
                            item_2: val3,
                            type_1: val4,
                            type_2: val5,
                            sliderItems_1: menu.items[menu.currentItem].sliderItems_1,
                            sliderItems_2: menu.items[menu.currentItem].sliderItems_2,
                            sliderPos: menu.items[menu.currentItem].currentSlider
                        }));
                    }
                }
            break;

            case "right":
                if(menu.items[menu.currentItem].type_1 == "slider")
                {
                    if(menu.items[menu.currentItem].currentSlider < (Object.keys(menu.items[menu.currentItem].sliderItems_1).length - 1))
                    {
                        menu.items[menu.currentItem].currentSlider++;

                        menu.items[menu.currentItem].label_1 = menu.items[menu.currentItem].sliderItems_1[menu.items[menu.currentItem].currentSlider];

                        $(`.${menu.menu} .${menu.items[menu.currentItem].name} .item_1`).text("< " + menu.items[menu.currentItem].label_1 + " >");

                        var val1 = $(`.${menu.menu} .item_selected`).attr("class").split(" ")[0];
                        var val2 = $(`.${menu.menu} .item_selected .item_1`).text();
                        var val3 = $(`.${menu.menu} .item_selected .item_2`).text();
                        var val4 = $(`.${menu.menu} .item_selected .item_1`).attr("class").split(" ")[1];
                        var val5 = $(`.${menu.menu} .item_selected .item_2`).attr("class").split(" ")[1];

                        $.post(`https://${scriptName}/currentItem`, JSON.stringify({
                            menu: menu.menu,
                            name: val1,
                            item_1: val2,
                            item_2: val3,
                            type_1: val4,
                            type_2: val5,
                            sliderItems_1: menu.items[menu.currentItem].sliderItems_1,
                            sliderItems_2: menu.items[menu.currentItem].sliderItems_2,
                            sliderPos: menu.items[menu.currentItem].currentSlider
                        }));
                    }
                    else if(menu.items[menu.currentItem].currentSlider == (Object.keys(menu.items[menu.currentItem].sliderItems_1).length - 1))
                    {
                        menu.items[menu.currentItem].currentSlider = 0;

                        menu.items[menu.currentItem].label_1 = menu.items[menu.currentItem].sliderItems_1[menu.items[menu.currentItem].currentSlider];

                        $(`.${menu.menu} .${menu.items[menu.currentItem].name} .item_1`).text("< " + menu.items[menu.currentItem].label_1 + " >");

                        var val1 = $(`.${menu.menu} .item_selected`).attr("class").split(" ")[0];
                        var val2 = $(`.${menu.menu} .item_selected .item_1`).text();
                        var val3 = $(`.${menu.menu} .item_selected .item_2`).text();
                        var val4 = $(`.${menu.menu} .item_selected .item_1`).attr("class").split(" ")[1];
                        var val5 = $(`.${menu.menu} .item_selected .item_2`).attr("class").split(" ")[1];

                        $.post(`https://${scriptName}/currentItem`, JSON.stringify({
                            menu: menu.menu,
                            name: val1,
                            item_1: val2,
                            item_2: val3,
                            type_1: val4,
                            type_2: val5,
                            sliderItems_1: menu.items[menu.currentItem].sliderItems_1,
                            sliderItems_2: menu.items[menu.currentItem].sliderItems_2,
                            sliderPos: menu.items[menu.currentItem].currentSlider
                        }));
                    }
                }

                if(menu.items[menu.currentItem].type_2 == "slider")
                {
                    if(menu.items[menu.currentItem].currentSlider < (Object.keys(menu.items[menu.currentItem].sliderItems_2).length - 1))
                    {
                        menu.items[menu.currentItem].currentSlider++;

                        menu.items[menu.currentItem].label_2 = menu.items[menu.currentItem].sliderItems_2[menu.items[menu.currentItem].currentSlider];

                        $(`.${menu.menu} .${menu.items[menu.currentItem].name} .item_2`).text("< " + menu.items[menu.currentItem].label_2 + " >");

                        var val1 = $(`.${menu.menu} .item_selected`).attr("class").split(" ")[0];
                        var val2 = $(`.${menu.menu} .item_selected .item_1`).text();
                        var val3 = $(`.${menu.menu} .item_selected .item_2`).text();
                        var val4 = $(`.${menu.menu} .item_selected .item_1`).attr("class").split(" ")[1];
                        var val5 = $(`.${menu.menu} .item_selected .item_2`).attr("class").split(" ")[1];

                        $.post(`https://${scriptName}/currentItem`, JSON.stringify({
                            menu: menu.menu,
                            name: val1,
                            item_1: val2,
                            item_2: val3,
                            type_1: val4,
                            type_2: val5,
                            sliderItems_1: menu.items[menu.currentItem].sliderItems_1,
                            sliderItems_2: menu.items[menu.currentItem].sliderItems_2,
                            sliderPos: menu.items[menu.currentItem].currentSlider
                        }));
                    }
                    else if(menu.items[menu.currentItem].currentSlider == (Object.keys(menu.items[menu.currentItem].sliderItems_2).length - 1))
                    {
                        menu.items[menu.currentItem].currentSlider = 0;

                        menu.items[menu.currentItem].label_2 = menu.items[menu.currentItem].sliderItems_2[menu.items[menu.currentItem].currentSlider];

                        $(`.${menu.menu} .${menu.items[menu.currentItem].name} .item_2`).text("< " + menu.items[menu.currentItem].label_2 + " >");

                        var val1 = $(`.${menu.menu} .item_selected`).attr("class").split(" ")[0];
                        var val2 = $(`.${menu.menu} .item_selected .item_1`).text();
                        var val3 = $(`.${menu.menu} .item_selected .item_2`).text();
                        var val4 = $(`.${menu.menu} .item_selected .item_1`).attr("class").split(" ")[1];
                        var val5 = $(`.${menu.menu} .item_selected .item_2`).attr("class").split(" ")[1];

                        $.post(`https://${scriptName}/currentItem`, JSON.stringify({
                            menu: menu.menu,
                            name: val1,
                            item_1: val2,
                            item_2: val3,
                            type_1: val4,
                            type_2: val5,
                            sliderItems_1: menu.items[menu.currentItem].sliderItems_1,
                            sliderItems_2: menu.items[menu.currentItem].sliderItems_2,
                            sliderPos: menu.items[menu.currentItem].currentSlider
                        }));
                    }
                }
            break;

            case "down":
                if(Object.keys(menu.itemsArray).length > 1)
                {
                    if(menu.currentItem < (maxMenuItems - 1) && menu.currentItem < (Object.keys(menu.itemsArray).length - 1))
                    {
                        menu.currentItem++;

                        menu.itemsArray[menu.currentItem].classList.add("item_selected");
                        $(`.${menu.menu} .item_selected`).find("i").remove();

                        menu.itemsArray[menu.currentItem - 1].classList.remove("item_selected");
                        var currentHTML = $(`.${menu.menu} .item_selected`).html();
                        $(`.${menu.menu} .item_selected`).html(`<i class = "fas fa-angle-double-right"></i> ${currentHTML}`);

                        var val1 = $(`.${menu.menu} .item_selected`).attr("class").split(" ")[0];
                        var val2 = $(`.${menu.menu} .item_selected .item_1`).text();
                        var val3 = $(`.${menu.menu} .item_selected .item_2`).text();
                        var val4 = $(`.${menu.menu} .item_selected .item_1`).attr("class").split(" ")[1];
                        var val5 = $(`.${menu.menu} .item_selected .item_2`).attr("class").split(" ")[1];

                        $.post(`https://${scriptName}/currentItem`, JSON.stringify({
                            menu: menu.menu,
                            name: val1,
                            item_1: val2,
                            item_2: val3,
                            type_1: val4,
                            type_2: val5,
                            sliderItems_1: menu.items[menu.currentItem].sliderItems_1,
                            sliderItems_2: menu.items[menu.currentItem].sliderItems_2,
                            sliderPos: menu.items[menu.currentItem].currentSlider
                        }));
                    }
                    else if(menu.currentItem < (Object.keys(menu.itemsArray).length - 1))
                    {
                        menu.currentItem++;

                        $(`.${menu.menu}`).append(menu.itemsArray[menu.currentItem]);
                        menu.itemsArray[menu.currentItem].classList.add("item_selected");
                        $(`.${menu.menu} .item_selected`).find("i").remove();

                        menu.itemsArray[menu.currentItem - 1].classList.remove("item_selected");
                        var currentHTML = $(`.${menu.menu} .item_selected`).html();
                        $(`.${menu.menu} .item_selected`).html(`<i class = "fas fa-angle-double-right"></i> ${currentHTML}`);

                        menu.itemsArray[menu.currentItem - maxMenuItems].remove();

                        var val1 = $(`.${menu.menu} .item_selected`).attr("class").split(" ")[0];
                        var val2 = $(`.${menu.menu} .item_selected .item_1`).text();
                        var val3 = $(`.${menu.menu} .item_selected .item_2`).text();
                        var val4 = $(`.${menu.menu} .item_selected .item_1`).attr("class").split(" ")[1];
                        var val5 = $(`.${menu.menu} .item_selected .item_2`).attr("class").split(" ")[1];

                        $.post(`https://${scriptName}/currentItem`, JSON.stringify({
                            menu: menu.menu,
                            name: val1,
                            item_1: val2,
                            item_2: val3,
                            type_1: val4,
                            type_2: val5,
                            sliderItems_1: menu.items[menu.currentItem].sliderItems_1,
                            sliderItems_2: menu.items[menu.currentItem].sliderItems_2,
                            sliderPos: menu.items[menu.currentItem].currentSlider
                        }));
                    }
                    else if(menu.currentItem == (Object.keys(menu.itemsArray).length - 1))
                    {
                        menu.currentItem = 0;

                        $(`.${menu.menu} .item_selected`).find("i").remove();
                        $(`.${menu.menu}`).empty();

                        for(var i = 0; i < Object.keys(menu.itemsArray).length; i++)
                        {
                            if(i < maxMenuItems)
                            {
                                $(`.${menu.menu}`).append(menu.itemsArray[i]);
                            }
                        }

                        menu.itemsArray[menu.currentItem].classList.add("item_selected");
                        menu.itemsArray[Object.keys(menu.itemsArray).length - 1].classList.remove("item_selected");
                        var currentHTML = $(`.${menu.menu} .item_selected`).html();
                        $(`.${menu.menu} .item_selected`).html(`<i class = "fas fa-angle-double-right"></i> ${currentHTML}`);

                        var val1 = $(`.${menu.menu} .item_selected`).attr("class").split(" ")[0];
                        var val2 = $(`.${menu.menu} .item_selected .item_1`).text();
                        var val3 = $(`.${menu.menu} .item_selected .item_2`).text();
                        var val4 = $(`.${menu.menu} .item_selected .item_1`).attr("class").split(" ")[1];
                        var val5 = $(`.${menu.menu} .item_selected .item_2`).attr("class").split(" ")[1];

                        $.post(`https://${scriptName}/currentItem`, JSON.stringify({
                            menu: menu.menu,
                            name: val1,
                            item_1: val2,
                            item_2: val3,
                            type_1: val4,
                            type_2: val5,
                            sliderItems_1: menu.items[menu.currentItem].sliderItems_1,
                            sliderItems_2: menu.items[menu.currentItem].sliderItems_2,
                            sliderPos: menu.items[menu.currentItem].currentSlider
                        }));
                    }
                }
            break;

            case "up":
                if(Object.keys(menu.itemsArray).length > 1)
                {
                    if(menu.currentItem == 0)
                    {
                        menu.currentItem = Object.keys(menu.itemsArray).length - 1;

                        $(`.${menu.menu} .item_selected`).find("i").remove();
                        $(`.${menu.menu}`).empty();

                        for(var i = 0; i < Object.keys(menu.itemsArray).length; i++)
                        {
                            if(i > (menu.currentItem - maxMenuItems) && i <= (maxMenuItems + (menu.currentItem - maxMenuItems)))
                            {
                                $(`.${menu.menu}`).append(menu.itemsArray[i]);
                            }
                        }

                        menu.itemsArray[menu.currentItem].classList.add("item_selected");
                        menu.itemsArray[0].classList.remove("item_selected");
                        var currentHTML = $(`.${menu.menu} .item_selected`).html();
                        $(`.${menu.menu} .item_selected`).html(`<i class = "fas fa-angle-double-right"></i> ${currentHTML}`);

                        var val1 = $(`.${menu.menu} .item_selected`).attr("class").split(" ")[0];
                        var val2 = $(`.${menu.menu} .item_selected .item_1`).text();
                        var val3 = $(`.${menu.menu} .item_selected .item_2`).text();
                        var val4 = $(`.${menu.menu} .item_selected .item_1`).attr("class").split(" ")[1];
                        var val5 = $(`.${menu.menu} .item_selected .item_2`).attr("class").split(" ")[1];

                        $.post(`https://${scriptName}/currentItem`, JSON.stringify({
                            menu: menu.menu,
                            name: val1,
                            item_1: val2,
                            item_2: val3,
                            type_1: val4,
                            type_2: val5,
                            sliderItems_1: menu.items[menu.currentItem].sliderItems_1,
                            sliderItems_2: menu.items[menu.currentItem].sliderItems_2,
                            sliderPos: menu.items[menu.currentItem].currentSlider
                        }));
                    }
                    else if(menu.currentItem < (maxMenuItems) && menu.currentItem > 0)
                    {
                        menu.currentItem--;

                        menu.itemsArray[menu.currentItem].classList.add("item_selected");
                        $(`.${menu.menu} .item_selected`).find("i").remove();

                        menu.itemsArray[menu.currentItem + 1].classList.remove("item_selected");
                        var currentHTML = $(`.${menu.menu} .item_selected`).html();
                        $(`.${menu.menu} .item_selected`).html(`<i class = "fas fa-angle-double-right"></i> ${currentHTML}`);

                        var val1 = $(`.${menu.menu} .item_selected`).attr("class").split(" ")[0];
                        var val2 = $(`.${menu.menu} .item_selected .item_1`).text();
                        var val3 = $(`.${menu.menu} .item_selected .item_2`).text();
                        var val4 = $(`.${menu.menu} .item_selected .item_1`).attr("class").split(" ")[1];
                        var val5 = $(`.${menu.menu} .item_selected .item_2`).attr("class").split(" ")[1];

                        $.post(`https://${scriptName}/currentItem`, JSON.stringify({
                            menu: menu.menu,
                            name: val1,
                            item_1: val2,
                            item_2: val3,
                            type_1: val4,
                            type_2: val5,
                            sliderItems_1: menu.items[menu.currentItem].sliderItems_1,
                            sliderItems_2: menu.items[menu.currentItem].sliderItems_2,
                            sliderPos: menu.items[menu.currentItem].currentSlider
                        }));
                    }
                    else if(menu.currentItem > (maxMenuItems - 1))
                    {
                        menu.currentItem--;

                        menu.itemsArray[menu.currentItem].classList.add("item_selected");
                        $(`.${menu.menu} .item_selected`).find("i").remove();

                        menu.itemsArray[menu.currentItem + 1].classList.remove("item_selected");
                        var currentHTML = $(`.${menu.menu} .item_selected`).html();
                        $(`.${menu.menu} .item_selected`).html(`<i class = "fas fa-angle-double-right"></i> ${currentHTML}`);

                        menu.itemsArray[menu.currentItem + 1].remove();

                        $(`.${menu.menu}`).prepend(menu.itemsArray[(menu.currentItem - maxMenuItems) + 1]);

                        var val1 = $(`.${menu.menu} .item_selected`).attr("class").split(" ")[0];
                        var val2 = $(`.${menu.menu} .item_selected .item_1`).text();
                        var val3 = $(`.${menu.menu} .item_selected .item_2`).text();
                        var val4 = $(`.${menu.menu} .item_selected .item_1`).attr("class").split(" ")[1];
                        var val5 = $(`.${menu.menu} .item_selected .item_2`).attr("class").split(" ")[1];

                        $.post(`https://${scriptName}/currentItem`, JSON.stringify({
                            menu: menu.menu,
                            name: val1,
                            item_1: val2,
                            item_2: val3,
                            type_1: val4,
                            type_2: val5,
                            sliderItems_1: menu.items[menu.currentItem].sliderItems_1,
                            sliderItems_2: menu.items[menu.currentItem].sliderItems_2,
                            sliderPos: menu.items[menu.currentItem].currentSlider
                        }));
                    }
                }
            break;
        }
    }

    window.addEventListener("message", function(event) 
    {
        var eventData = event.data;

        if(eventData.toggleMenu)
        {
            toggleMenu(eventData.state);
        }

        if(eventData.createMenu)
        {
            createMenu(eventData.structure);
        }

        if(eventData.destroyMenu)
        {
            destroyMenu();
        }

        if(eventData.addMenu)
        {
            addMenu(eventData.structure);
        }

        if(eventData.removeMenu)
        {
            removeMenu(eventData.menu);
        }

        if(eventData.switchMenu)
        {
            switchMenu(eventData.menu);
        }

        if(eventData.updateMenuStatus)
        {
            updateMenuStatus(eventData.textData);
        }

        if(eventData.updateItemSliderItems)
        {
            updateItemSliderItems(eventData.menu, eventData.item, eventData.name, eventData.sliderItems);
        }

        if(eventData.updateItemSlider)
        {
            updateItemSlider(eventData.menu, eventData.item, eventData.name, eventData.sliderPos);
        }

        if(eventData.updateItemText)
        {
            updateItemText(eventData.menu, eventData.item, eventData.name, eventData.label);
        }

        if(eventData.scrollFunctionality)
        {
            scrollFunctionality(eventData.direction);
        }
    });
}