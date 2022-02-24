using EquipmentRent.DataModel;

namespace EquipmentRent.HelperClasses
{
	public static class ContextWrapper
	{
		public static EquipmentRentEntities Context;

		static ContextWrapper()
		{
			Context = new EquipmentRentEntities();
		}
	}
}
