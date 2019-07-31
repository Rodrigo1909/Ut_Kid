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
                contexto.TblTaller.InsertOnSubmit(_TBL_Taller);
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

        public void Eliminar(int id)
        {
            TblTaller taller = contexto.TblTaller.Where(t => t.id == id).FirstOrDefault<TblTaller>();
            contexto.TblTaller.DeleteOnSubmit(taller);
            contexto.SubmitChanges();
        }

        public void Editar(TblTaller taller)
        {
            TblTaller tallerBd = contexto.TblTaller.Where(t => t.id == taller.id).FirstOrDefault<TblTaller>();
            tallerBd.strNombre = taller.strNombre;
            tallerBd.strDescripcion = taller.strDescripcion;
            contexto.SubmitChanges();
        }
    }
}
