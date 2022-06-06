var GetConnections = async function() {
    var Connections = await JsonRequest("http://localhost:6126/API/Connections")
    console.log(Connections)
}

await GetConnections()