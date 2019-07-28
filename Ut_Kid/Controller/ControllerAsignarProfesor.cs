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

        public object ConsultaProfesor()
        {
            return contexto.TblProfesors
                .Select(p => new
                {
                    id = p.id,
                    strNombre = (p.strNombre + " " + p.strApellidoP + " " + p.strApellidoM).ToUpper()
                })
                .ToList();
        }

        public List<TblTaller> ConsultaTaller()
        {
            return contexto.TblTallers.ToList<TblTaller>();
        }

        public bool InsertarAsigProfe(TblAsignacionProfesor  _TBL_ASIGTALLLER)
        {
            bool respuesta = false;
            try
            {
                contexto.TblAsignacionProfesors.InsertOnSubmit(_TBL_ASIGTALLLER);
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
