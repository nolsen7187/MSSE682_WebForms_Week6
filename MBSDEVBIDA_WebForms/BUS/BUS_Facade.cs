using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SVC;

namespace BUS
{
    public class BUS_Facade
    {
        private SVC_PerformAction svcPerformAction = new SVC_PerformAction();
        private Object lclObjectClass;
        private int lclActionType;

        public BUS_Facade(Object Object, int ActionType)
        {   
            this.lclObjectClass = Object;
            this.lclActionType = ActionType;
        }
        public void ProcessRequest()
        {
            svcPerformAction.Action(lclObjectClass, lclActionType);
        }
    }
}
