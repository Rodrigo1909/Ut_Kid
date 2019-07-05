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
    public class ControllerPadre
    {
        UtBaseDatoDataContext contexto = new UtBaseDatoDataContext();
        public bool InsertarPadre(TblPadre _TBL_Padre)
        {
            bool respuesta = false;
            try
            {
                contexto.TblPadres.InsertOnSubmit(_TBL_Padre);
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

