async function WebRequest(Url, Method="GET", Headers={}, Data=null) {
    var Body = await fetch(
        Url,
        {
            method: Method,
            body: Data,
            headers: Headers
        }
    )
    return Body.text()
}

async function JsonRequest(Url, Method="GET", Headers={}, Data=null) {
    return await JSON.parse(await WebRequest(Url, Method, Headers, Data))
}

globalThis.WebRequest = WebRequest
globalThis.JsonRequest = JsonRequest