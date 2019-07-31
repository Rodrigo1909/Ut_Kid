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
                contexto.TblProfesor.InsertOnSubmit(_TBL_Profe);
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
        
        public TblProfesor verProfesorPorId(int id)
        {
            return contexto.TblProfesor.Where(p => p.id == id).FirstOrDefault();
        }
        public TblNino validarNino(int id)
        {
            return contexto.TblNino.Where(n=>n.id==id).FirstOrDefault();
        }
        public List<TblTaller> verTalleres()
        {
            return contexto.TblTaller.ToList();
        }
        public List<TblActividadTaller> verActividades(int idTaller)
        {
            return contexto.TblActividadTaller.Where(i=>i.idTaller==idTaller).ToList();
        }
        public TblActividadTaller verActividadPorId(int id)
        {
            return contexto.TblActividadTaller.Where(a => a.id == id).FirstOrDefault();
        }
        public TblTaller verTallerPorId(int id)
        {
            return contexto.TblTaller.Where(i => i.id == id).FirstOrDefault();
        }
        public bool actualizarActividad(TblActividadTaller actividad)
        {
            try
            {
                var item = contexto.TblActividadTaller.Where(i => i.id == actividad.id).FirstOrDefault();
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
                var item = contexto.TblActividadTaller.Where(i => i.id == id).FirstOrDefault();
                contexto.TblActividadTaller.DeleteOnSubmit(item);
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
                contexto.TblActividadTaller.InsertOnSubmit(actividad);
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
                var monedero = contexto.TblModederoNino.Where(m => m.idNino == id).FirstOrDefault();
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
                var monedero = contexto.TblModederoNino.Where(m => m.idNino == id).FirstOrDefault();
                monedero.cantidad = monedero.cantidad - cantidad;
                contexto.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }
        public decimal? verSaldo(int id)
        {
            return contexto.TblModederoNino.Where(i => i.id == id).FirstOrDefault().cantidad;
        }
    }
}


