package as3spec
{
	import as3spec.*;
	import flash.events.*;
	import flash.system.*;
	import mx.core.*;

	public class UIComponentSpec extends Spec
	{
		// redirect describe until after creationComplete
		override public function context (...args) :void
		{
			if (args[0] is UIComponent)
			{
				var component:UIComponent = (args.shift() as UIComponent);
				args.unshift(component.className);

				component.addEventListener('creationComplete', function () :void
				{
					invoke_context(args);
				});
				Application.application.addChild(component);
//				application.addChild(component);
			}
			else
			{
				invoke_context(args);
			}
		}

		private function invoke_context (args:Array) :void
		{
			super.context.apply(null, args);
		}

/*		private function get application () :*
		{
			var application:Object;
			try
			{
				application = ApplicationDomain.currentDomain.getDefinition('mx.core.Application').application;
			}
			catch (exception:*)
			{
				trace('[as3spec] mx.core.Application undefined: ' + exception);
			}

			application ||= {};
			return application;
		}
*/	}
}