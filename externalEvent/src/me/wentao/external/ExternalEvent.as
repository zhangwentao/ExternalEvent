package me.wentao.external
{
	/**
	 * 给JS提供事件类
	 * @author wentao.zhang
	 */
	public class ExternalEvent 
	{
		private var info:Object = {};//存储与事件有关的信息的对象,这个对象会被作为参数传递给侦听器方法
		
		/**
		 * 
		 * @param	type <String>	事件类型
		 */
		public function ExternalEvent(type:String) 
		{
			info.type = type;
		}
		
		/**
		 * 向事件对象添加属性
		 * @param	name	<String>	属性名
		 * @param	value	<String>	属性对象
		 */
		public function addParam(name:String, value:Object):void
		{
			if (info.hasOwnProperty(name))
			{
				throw new Error(name + " attribute existed already!");
			}
			else
			{
				info[name] = value;
			}
		}
		
		/**
		 * 获取事件对象
		 * @return	<Object>	取得事件的信息对象
		 */
		internal function getInfoObject():Object
		{
			return info;
		}
	}
}