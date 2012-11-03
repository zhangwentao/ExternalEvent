var flashvars = {
readyDo:"init"
};
var param = {
	wmode: "transparent",
	allowscriptaccess: "always"
};
swfobject.embedSWF("example.swf","swfdiv", "600", "800", "10.0.0","",flashvars,param)	

function init() {
	alert("init");
	var swfdiv = document.getElementById("swfdiv");
	swfdiv.addEventListener("btn1click","console.log");
	swfdiv.addEventListener("btn2click","console.log");
}
