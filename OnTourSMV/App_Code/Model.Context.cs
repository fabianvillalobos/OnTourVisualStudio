﻿//------------------------------------------------------------------------------
// <auto-generated>
//    Este código se generó a partir de una plantilla.
//
//    Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//    Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;

public partial class EntitiesOnTour : DbContext
{
    public EntitiesOnTour()
        : base("name=EntitiesOnTour")
    {
    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        throw new UnintentionalCodeFirstException();
    }

    public DbSet<ACTIVIDAD> ACTIVIDAD { get; set; }
    public DbSet<CLIENTE> CLIENTE { get; set; }
    public DbSet<CONTRATO> CONTRATO { get; set; }
    public DbSet<CONTRATO_PAQUETE> CONTRATO_PAQUETE { get; set; }
    public DbSet<CUENTA> CUENTA { get; set; }
    public DbSet<DOCUMENTO> DOCUMENTO { get; set; }
    public DbSet<EMPLEADO> EMPLEADO { get; set; }
    public DbSet<PAQUETEVIAJE> PAQUETEVIAJE { get; set; }
    public DbSet<SERVICIO> SERVICIO { get; set; }
    public DbSet<SERVICIO_PAQUETE> SERVICIO_PAQUETE { get; set; }
    public DbSet<TIPO_ACTIVIDAD> TIPO_ACTIVIDAD { get; set; }
    public DbSet<TIPO_SERVICIO> TIPO_SERVICIO { get; set; }
    public DbSet<TIPO_TRANSACCION> TIPO_TRANSACCION { get; set; }
    public DbSet<TIPO_USUARIO> TIPO_USUARIO { get; set; }
    public DbSet<TRANSACCION> TRANSACCION { get; set; }
    public DbSet<USUARIO> USUARIO { get; set; }
}
