const registered = [];

function RegisterUICallback(name, cb) {
    AddEventHandler(`_vui_uiReq:${name}`, cb);

    if (GetResourceState('ab-ui') === 'started') exports['ab-ui'].RegisterUIEvent(name);

    registered.push(name);
}

function SendUIMessage(data) {
    exports['ab-ui'].SendUIMessage(data);
}

function SetUIFocus(hasFocus, hasCursor) {
    exports['ab-ui'].SetUIFocus(hasFocus, hasCursor);
}

function GetUIFocus() {
    return exports['ab-ui'].GetUIFocus();
}

AddEventHandler('_vui_uiReady', () => {
    registered.forEach((eventName) => exports['ab-ui'].RegisterUIEvent(eventName));
});