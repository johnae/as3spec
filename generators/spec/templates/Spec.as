package <%= package_name %>
{
	import as3spec.*;

	public class <%= test_case_name  %> extends Spec
	{
		override public function run () :void
		{
			describe ('a new <%= class_name %>', function () :void
			{
				const <%= instance_name %>:<%= class_name %> = new <%= class_name %>;

				it ('should be a <%= class_name %>')
					.so(<%= instance_name %>).should.be.a.kind_of(<%= class_name %>);

			});
		}
	}
}