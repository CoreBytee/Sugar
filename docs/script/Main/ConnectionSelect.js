
var ConnectionListParent
var ConnectionTemplate
var ConnectionCountElement
function Load() {
    ConnectionListParent = document.getElementById("ConnectionList");
    ConnectionTemplate = document.getElementById("ConnectionTemplate");
    ConnectionCountElement = document.getElementById("ConnectionCount");
    console.log(ConnectionListParent);
    console.log(ConnectionTemplate);
    document.head.appendChild(ConnectionTemplate)
    RefreshConnectionList()
}
window.addEventListener("load", Load);

async function RefreshConnectionList() {
    ConnectionListParent.innerHTML = "";
    var Connections = await GetConnections()
    ConnectionCountElement.innerText = `${Connections.length} Total`
    Connections.forEach(
        function (Connection) {
            console.log(Connection)
            var Entry = ConnectionTemplate.cloneNode(true)
            Entry.id = `Connection_${Connection.Id}`
            Entry.innerText = `[${Connection.Id}] ${Connection.Envoirment.Username}@${Connection.Envoirment.OS}`
            ConnectionListParent.appendChild(Entry)
        }
    )
}

function ConnectionClick(Id) {
    var Entry = document.getElementById(`Connection_${Id}`)

    if (Entry.classList.contains("Selected-Entry")) {
        Entry.classList.remove("Selected-Entry");
    } else {
        Entry.classList.add("Selected-Entry");
    }
}

globalThis.ConnectionClick = ConnectionClick;