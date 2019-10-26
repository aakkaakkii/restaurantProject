function getUrl() {
    return window.location.protocol+"//"+window.location.hostname+":"+window.location.port;
}

function getUrlRest() {
    return getUrl()+"/rest"
}
