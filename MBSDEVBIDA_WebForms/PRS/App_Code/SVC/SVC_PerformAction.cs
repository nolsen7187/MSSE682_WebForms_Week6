using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using System.Xml;

using DAL;

namespace PRS.SVC
{
    public class SVC_PerformAction
    {
        //Method used for websites
        public void Action(Object Class, int ActionType)
        {
            dynamic ClassObject = Class;
            string ClassType = Class.ToString();

            if (ClassType == "DAL.MBSWBWEBUSERCONTACT")
            {
                var Repo = SVC_RepositoryConcreteClass.CRUD<MBSWBWEBUSERCONTACT>();
                Act(Repo, ClassObject, ActionType);
            }
            else if (ClassType == "DAL.CUSTTABLE")
            {
                var Repo = SVC_RepositoryConcreteClass.CRUD<CUSTTABLE>();
                Act(Repo, ClassObject, ActionType);
            }
            else if (ClassType == "DAL.MBSBDSALESREPTABLE")
            {
                var Repo = SVC_RepositoryConcreteClass.CRUD<MBSBDSALESREPTABLE>();
                Act(Repo, ClassObject, ActionType);
            }
            else if (ClassType == "DAL.DATAAREA")
            {
                var Repo = SVC_RepositoryConcreteClass.CRUD<DATAAREA>();
                Act(Repo, ClassObject, ActionType);
            }
        }
        public void Act(DAL.IDataRepository DataRepo, dynamic ClassObject, int ActionType)
        {
            switch (ActionType)
            {

                case 1://Create
                    DataRepo.Create(ClassObject);
                    break;
                case 2://Update
                    DataRepo.Update(ClassObject);
                    break;
                case 3://Delete
                    DataRepo.Delete(ClassObject);
                    break;
                default:
                    break;
            }
        }
        //End of logic used by websites
    }

}
