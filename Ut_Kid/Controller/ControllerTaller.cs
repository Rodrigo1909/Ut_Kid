using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;
using System.Data.Linq;
using System.Linq.Expressions;

namespace Controller
{
    public class ControllerTaller
    {
        UtBaseDatoDataContext contexto = new UtBaseDatoDataContext();

        public bool InsertarTaller(TblTaller _TBL_Taller)
        {
            bool respuesta = false;
            try
            {
                contexto.TblTallers.InsertOnSubmit(_TBL_Taller);
                contexto.SubmitChanges();
                respuesta = true;

            }
            catch (Exception ex)
            {
                System.Console.WriteLine(ex.ToString());
                respuesta = false;

            }
            return respuesta;
        }
    }
}
