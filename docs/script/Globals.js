globalThis.APIURLS = (await JsonRequest("/Config.json"))[document.location.host]
var Protocol = "http"
if (APIURLS.API.TLS){
    Protocol = "https"
}
globalThis.APIURL = `${Protocol}://${APIURLS.API.Host}:${APIURLS.API.Port}/`
console.log(APIURL)