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
   public class ControllerProfesor
    {
        UtBaseDatoDataContext contexto = new UtBaseDatoDataContext();
        public bool InsertarProfe(TblProfesor _TBL_Profe)
        {
            bool respuesta = false;
            try
            {
                contexto.TblProfesors.InsertOnSubmit(_TBL_Profe);
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
        public TblNino validarNino(int id)
        {
            return contexto.TblNinos.Where(n=>n.id==id).FirstOrDefault();
        }
        public List<TblTaller> verTalleres()
        {
            return contexto.TblTallers.ToList();
        }
        public List<TblActividadTaller> verActividades(int idTaller)
        {
            return contexto.TblActividadTallers.Where(i=>i.idTaller==idTaller).ToList();
        }
        public TblActividadTaller verActividadPorId(int id)
        {
            return contexto.TblActividadTallers.Where(a => a.id == id).FirstOrDefault();
        }
        public TblTaller verTallerPorId(int id)
        {
            return contexto.TblTallers.Where(i => i.id == id).FirstOrDefault();
        }
        public bool actualizarActividad(TblActividadTaller actividad)
        {
            try
            {
                var item = contexto.TblActividadTallers.Where(i => i.id == actividad.id).FirstOrDefault();
                item.idTaller = actividad.idTaller;
                item.strvalor = actividad.strvalor;
                item.strdescripcion = actividad.strdescripcion;
                contexto.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
            
        }
        public bool eliminarActividad(int id)
        {
            try
            {
                var item = contexto.TblActividadTallers.Where(i => i.id == id).FirstOrDefault();
                contexto.TblActividadTallers.DeleteOnSubmit(item);
                contexto.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public bool CrearActividad(TblActividadTaller actividad)
        {
            try
            {
                contexto.TblActividadTallers.InsertOnSubmit(actividad);
                contexto.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public bool abonoMonedero(int id, decimal cantidad)
        {
            try
            {
                var monedero = contexto.TblModederoNinos.Where(m => m.idNino == id).FirstOrDefault();
                monedero.cantidad = monedero.cantidad + cantidad;
                contexto.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
            
        }
        public bool cargoMonedero(int id, decimal cantidad)
        {
            try
            {
                var monedero = contexto.TblModederoNinos.Where(m => m.idNino == id).FirstOrDefault();
                monedero.cantidad = monedero.cantidad - cantidad;
                contexto.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }
        public decimal verSaldo(int id)
        {
            return contexto.TblModederoNinos.Where(i => i.id == id).FirstOrDefault().cantidad;
        }
    }
}


