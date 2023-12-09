using ApiMN.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Web.Http.Description;

namespace ApiMN.Controllers
{
    public class ProductoController : ApiController
    {

        [HttpGet]
        [Route("ConsultarProductos")]
        public List<TProducto> ConsultarProductos()
        {
            //using (var context = new GYMEntities())
            //{
            //    context.Configuration.LazyLoadingEnabled = false;
            //    return context.TProducto.ToList();
            //}
            try
            {
                using (var context = new GYMEntities())
                {
                    context.Configuration.LazyLoadingEnabled = false;
                    return (from x in context.TProducto
                            select x).ToList();
                }
            }
            catch (Exception)
            {
                return new List<TProducto>();
            }
        }

        [HttpGet]
        [Route("ConsultarProductosPorCategoria")]
        public List<TProducto> ConsultarProductosPorCategoria(long q)
        {
            //using (var context = new GYMEntities())
            //{
            //    context.Configuration.LazyLoadingEnabled = false;
            //    return context.TProducto.ToList();
            //}
            try
            {
                using (var context = new GYMEntities())
                {
                    context.Configuration.LazyLoadingEnabled = false;
                    return (from x in context.TProducto
                            where x.Categoria == q
                            select x).ToList();
                }
            }
            catch (Exception)
            {
                return new List<TProducto>();
            }
        }


        [HttpGet]
        [Route("ConsultarCategorias")]
        public List<System.Web.Mvc.SelectListItem> ConsultarCategorias()
        {
            try
            {
                using (var context = new GYMEntities())
                {
                    var datos = (from x in context.TCategoria
                                 select x).ToList();

                    var respuesta = new List<System.Web.Mvc.SelectListItem>();
                    foreach (var item in datos)
                    {
                        respuesta.Add(new System.Web.Mvc.SelectListItem { Value = item.ConCategoria.ToString(), Text = item.Descripcion });
                    }

                    return respuesta;
                }
            }
            catch (Exception)
            {
                return new List<System.Web.Mvc.SelectListItem>();
            }
        }



        //where x.ConProducto == q

        [HttpGet]
        [Route("ConsultaProducto")]
        public TProducto ConsultaProducto(long q)
        {
            using (var context = new GYMEntities())
            {
                context.Configuration.LazyLoadingEnabled = false;
                return (from x in context.TProducto
                        where x.ConProducto == q
                        select x).FirstOrDefault();
            }
        }

        [HttpPost]
        [Route("RegistrarProducto")]
        public long RegistrarProducto(TProducto tProducto)
        {
            using (var context = new GYMEntities())
            {
                context.TProducto.Add(tProducto);
                context.SaveChanges();
                return tProducto.ConProducto;
            }
        }

        [HttpPut]
        [Route("ActualizarRutaImagen")]
        public string ActualizarRutaImagen(TProducto tProducto)
        {
            using (var context = new GYMEntities())
            {
                var datos = context.TProducto.FirstOrDefault(x => x.ConProducto == tProducto.ConProducto);

                if (datos != null)
                {
                    datos.Imagen = tProducto.Imagen;
                    context.SaveChanges();
                }

                return "OK";
            }
        }

        [HttpPut]
        [Route("ActualizarProducto")]
        public string ActualizarProducto(TProducto tProducto)
        {
            using (var context = new GYMEntities())
            {
                var datos = context.TProducto.Where(x => x.ConProducto == tProducto.ConProducto).FirstOrDefault();
                datos.Nombre = tProducto.Nombre;
                datos.Descripcion = tProducto.Descripcion;
                datos.Cantidad = tProducto.Cantidad;
                datos.Precio = tProducto.Precio;
                context.SaveChanges();
                return "OK";
            }
        }

        [HttpPut]
        [Route("ActualizarEstadoProducto")]
        public string ActualizarEstadoUsuario(TProducto tProducto)
        {
            using (var context = new GYMEntities())
            {
                var datos = context.TProducto.Where(x => x.ConProducto == tProducto.ConProducto).FirstOrDefault();
                datos.Estado = (datos.Estado ? false : true);
                context.SaveChanges();
                return "OK";
            }
        }

    }
}