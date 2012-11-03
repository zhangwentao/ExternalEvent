package me.wentao.external
{
	import flash.events.IEventDispatcher;
	import flash.external.ExternalInterface;
	
	/**
	 * 向JS提供的侦听器类[单例]
	 * @author taowenzhang@gmail.com
	 */
	public class ExternalEventDispatcher
	{
		private static var instance:ExternalEventDispatcher;
		private var register:Object = new Object();//存储"事件名-侦听器数组"列表的对象，以下注释中称“注册表”
		
		public function ExternalEventDispatcher(key:Key) 
		{
			addExternalCall();
		}
	    
		/**
		 * 获取此类的唯一实例
		 * @return	<ExternalEventDispatcher>
		 */
		public static function getInstance():ExternalEventDispatcher
		{
			if (!instance)
				instance = new ExternalEventDispatcher(new Key());
			return instance;
		}
		
		/**
		 * 把两个方法开放给JS调用
		 */
		public function addExternalCall():void
		{
			ExternalInterface.addCallback("addEventListener", addEventListener);
			ExternalInterface.addCallback("removeEventListener", removeEventListener);
		}
		
		/**
		 * 注册侦听器
		 * @param	type	<String>	事件类型
		 * @param	listenerName	<String>	侦听器的方法名
		 * @return  <Boolean>	type类型事件的侦听方法是否添加成功
		 */
		private function addEventListener(type:String, listenerName:String):Boolean
		{
			if (!register.hasOwnProperty(type))
			{
				var funcArr:Array = new Array();
				register[type] = funcArr;
			}
			//在注册表中，listenerName 方法名已被注册到type类型的事件
			if (register[type].indexOf(listenerName) >= 0)
			{
				return false;
			}
			register[type].push(listenerName);
			return true;
		}
		
		/**
		 * 移除侦听器
		 * @param	type	<String>	事件类型
		 * @param	listenerName	<String>	侦听器的方法名
		 */
		private function removeEventListener(type:String, listenerName:String):int
		{
			//注册表无此事件的相应侦听器名列表
			if (!register.hasOwnProperty(type))
			{
				return 1;
			}
			var funcArr:Array = register[type] as Array;
			var index:int = funcArr.indexOf(listenerName);
			//此事件的侦听器名列表中无 listenerName 指定的方法名
			if (index < 0)
			{
				return 2;
			}
			//在注册表中找到listenerName 的方法名，并从中移除
			funcArr.splice(index, 1);
			return 0;
		}
		
		/**
		 * 调度事件
		 * @param	event	<ExternalEvent>	事件对象
		 */
		public function dispatchEvent(event:ExternalEvent):void
		{
			var type:String = event.getInfoObject().type;
			
			if (register[type] != null)
			{
				var funcNameArr:Array = register[type];
				var length:int = funcNameArr.length;
				for (var i:int = 0; i < length; i++)
				{
					ExternalInterface.call(funcNameArr[i], event.getInfoObject());
				}
			}
		}
		
	}
}

class Key
{
	
}