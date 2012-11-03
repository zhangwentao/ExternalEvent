#ExternalEvent#
ExternalEvent is a ActionScript3.0 package.It can give your swf the capability to dispatch event to javascript code.

##usage
###In ActionScript
follow 3 steps,can make your swf dispatch event In the specific time.
####step1
import the classes to your code:

	import me.wentao.external.ExternalEvent;
	import me.wentao.external.ExternalEventDispatcher;

####step2
write this line in your initial function:

	ExternalEventDispatcher.getInstance().addExternalCall();

ExternalEvent will use flash.externalInterface.addCallback() open two function to javascript code:

	addEventListener(typeName,listenerFuncName);
	removeEventListener(typeName,listenerFuncName);

####step3
create a ExternalEvent and add params that you want javascript received then dispatch it to javascript,like this:

	var event:ExternalEvent = new ExternalEvent("btn2click");
	event.addParam("msg","i am btn2");
	event.addParam("customParam",{x:1,y:2});
	ExternalEventDispatcher.getInstance().dispatchEvent(event);

###In Javascript

####step1
get the swf object:

	var swfdiv = document.getElementById("swfdiv");

####step2
add event listener:

	swfdiv.addEventListener("btn1click","console.log");
	
##Example
see [example](https://github.com/zhangwentao/ExternalEvent/tree/master/example)

##Download
[download swc](https://github.com/zhangwentao/ExternalEvent/blob/master/externalEvent/bin/externalEvent.swc)

	
