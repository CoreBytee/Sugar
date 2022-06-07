
var ModuleListParent
var ModuleTemplate
var ModuleCountElement
var Modules
async function Load() {
    Modules = await JsonRequest("/Modules.json")
    ModuleListParent = document.getElementById("ModuleList");
    ModuleTemplate = document.getElementById("ModuleTemplate");
    ModuleCountElement = document.getElementById("ModuleCount");
    console.log(ModuleListParent);
    console.log(ModuleTemplate);
    document.head.appendChild(ModuleTemplate)
    await RefreshModuleList()
    document.getElementById("Module_Welcome").click()
}
window.addEventListener("load", Load);

async function RefreshModuleList() {
    ModuleListParent.innerHTML = "";
    ModuleCountElement.innerText = `${Modules.length} Loaded`
    Modules.forEach(
        function (Module) {
            console.log(Module)
            var Entry = ModuleTemplate.cloneNode(true)
            Entry.id = `Module_${Module.Name}`
            Entry.setAttribute("onclick", `ModuleClick("${Module.Name}")`)
            Entry.innerText = `${Module.Name}`
            ModuleListParent.appendChild(Entry)
        }
    )
}

function ModuleClick(Id) {
    var Entry = document.getElementById(`Module_${Id}`)

    if (Entry.classList.contains("Selected-Entry")) {
        Entry.classList.remove("Selected-Entry");
    } else {
        Entry.classList.add("Selected-Entry");
    }
}

globalThis.ModuleClick = ModuleClick;