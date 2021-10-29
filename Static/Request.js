export async function WebRequest(Method, Url, Headers, Body) {
    var RequestData = await fetch(
        "https://Fetch-Proxy.scriptitwithcod.repl.co/request/",
        {
            method: "POST",
    
            body: JSON.stringify(
                {
                    Method: Method,
                    Headers: [
                        Headers
                    ],
                    Url: Url,
                    Body: Body
                }
            )
        }
    );

    var Body = await RequestData.json()

    return Body
}
