function ConnectionClick(Id) {
    var Entry = document.getElementById(`Connection_${Id}`)

    if (Entry.classList.contains("Selected-Entry")) {
        Entry.classList.remove("Selected-Entry");
    } else {
        Entry.classList.add("Selected-Entry");
    }
}

globalThis.ConnectionClick = ConnectionClick;