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
    public class ControllerHijo
    {
        UtBaseDatoDataContext contexto = new UtBaseDatoDataContext();
        public bool InsertarHijo(TblNino _TBL_Hijo)
        {
            bool respuesta = false;
            try
            {
                contexto.TblNino.InsertOnSubmit(_TBL_Hijo);
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
