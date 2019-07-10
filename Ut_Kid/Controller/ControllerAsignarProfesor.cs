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
    public class ControllerAsignarProfesor
    {
        UtBaseDatoDataContext contexto = new UtBaseDatoDataContext();

        public List<TblProfesor> ConsultaProfesor()
        {
            return contexto.TblProfesor.ToList<TblProfesor>();
        }

        public List<TblTaller> ConsultaTaller()
        {
            return contexto.TblTaller.ToList<TblTaller>();
        }

        public bool InsertarAsigProfe(TblAsignacionProfesor _TBL_ASIGTALLLER)
        {
            bool respuesta = false;
            try
            {
                contexto.TblAsignacionProfesor.InsertOnSubmit(_TBL_ASIGTALLLER);
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
