var GetConnections = async function() {
    var Connections = await JsonRequest("http://localhost:6126/API/Connections")
    return Connections
}
globalThis.GetConnections = GetConnections;