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
using System.Data.Objects;
using System.Data.Objects.DataClasses;
using System.Linq;

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

    public virtual int SP_ELIMINAUSUARIO(Nullable<decimal> pARAM_ID_USR)
    {
        var pARAM_ID_USRParameter = pARAM_ID_USR.HasValue ?
            new ObjectParameter("PARAM_ID_USR", pARAM_ID_USR) :
            new ObjectParameter("PARAM_ID_USR", typeof(decimal));

        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SP_ELIMINAUSUARIO", pARAM_ID_USRParameter);
    }

    public virtual int SP_INSERTAUSUARIO(string pARAM_LOGIN_USR, string pARAM_PASS_USR, Nullable<decimal> pARAM_ID_TIPO_USUARIO, string pARAM_ACTIVO, ObjectParameter pARA_ID_USR)
    {
        var pARAM_LOGIN_USRParameter = pARAM_LOGIN_USR != null ?
            new ObjectParameter("PARAM_LOGIN_USR", pARAM_LOGIN_USR) :
            new ObjectParameter("PARAM_LOGIN_USR", typeof(string));

        var pARAM_PASS_USRParameter = pARAM_PASS_USR != null ?
            new ObjectParameter("PARAM_PASS_USR", pARAM_PASS_USR) :
            new ObjectParameter("PARAM_PASS_USR", typeof(string));

        var pARAM_ID_TIPO_USUARIOParameter = pARAM_ID_TIPO_USUARIO.HasValue ?
            new ObjectParameter("PARAM_ID_TIPO_USUARIO", pARAM_ID_TIPO_USUARIO) :
            new ObjectParameter("PARAM_ID_TIPO_USUARIO", typeof(decimal));

        var pARAM_ACTIVOParameter = pARAM_ACTIVO != null ?
            new ObjectParameter("PARAM_ACTIVO", pARAM_ACTIVO) :
            new ObjectParameter("PARAM_ACTIVO", typeof(string));

        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SP_INSERTAUSUARIO", pARAM_LOGIN_USRParameter, pARAM_PASS_USRParameter, pARAM_ID_TIPO_USUARIOParameter, pARAM_ACTIVOParameter, pARA_ID_USR);
    }

    public virtual int SP_INSERTCLIENTE(Nullable<decimal> cNUMRUT_CLI, string cDRUT_CLI, string cNOMBRE_CLI, string cAPELLIDO_PAT_CLI, string cAPELLIDO_MAT_CLI, string cMAIL_CLI, string cACTIVO_CLI, string cDIRECCION_CLI, Nullable<System.DateTime> cFECHA_NACIMIENTO_CLI, string cFONO_CLI)
    {
        var cNUMRUT_CLIParameter = cNUMRUT_CLI.HasValue ?
            new ObjectParameter("CNUMRUT_CLI", cNUMRUT_CLI) :
            new ObjectParameter("CNUMRUT_CLI", typeof(decimal));

        var cDRUT_CLIParameter = cDRUT_CLI != null ?
            new ObjectParameter("CDRUT_CLI", cDRUT_CLI) :
            new ObjectParameter("CDRUT_CLI", typeof(string));

        var cNOMBRE_CLIParameter = cNOMBRE_CLI != null ?
            new ObjectParameter("CNOMBRE_CLI", cNOMBRE_CLI) :
            new ObjectParameter("CNOMBRE_CLI", typeof(string));

        var cAPELLIDO_PAT_CLIParameter = cAPELLIDO_PAT_CLI != null ?
            new ObjectParameter("CAPELLIDO_PAT_CLI", cAPELLIDO_PAT_CLI) :
            new ObjectParameter("CAPELLIDO_PAT_CLI", typeof(string));

        var cAPELLIDO_MAT_CLIParameter = cAPELLIDO_MAT_CLI != null ?
            new ObjectParameter("CAPELLIDO_MAT_CLI", cAPELLIDO_MAT_CLI) :
            new ObjectParameter("CAPELLIDO_MAT_CLI", typeof(string));

        var cMAIL_CLIParameter = cMAIL_CLI != null ?
            new ObjectParameter("CMAIL_CLI", cMAIL_CLI) :
            new ObjectParameter("CMAIL_CLI", typeof(string));

        var cACTIVO_CLIParameter = cACTIVO_CLI != null ?
            new ObjectParameter("CACTIVO_CLI", cACTIVO_CLI) :
            new ObjectParameter("CACTIVO_CLI", typeof(string));

        var cDIRECCION_CLIParameter = cDIRECCION_CLI != null ?
            new ObjectParameter("CDIRECCION_CLI", cDIRECCION_CLI) :
            new ObjectParameter("CDIRECCION_CLI", typeof(string));

        var cFECHA_NACIMIENTO_CLIParameter = cFECHA_NACIMIENTO_CLI.HasValue ?
            new ObjectParameter("CFECHA_NACIMIENTO_CLI", cFECHA_NACIMIENTO_CLI) :
            new ObjectParameter("CFECHA_NACIMIENTO_CLI", typeof(System.DateTime));

        var cFONO_CLIParameter = cFONO_CLI != null ?
            new ObjectParameter("CFONO_CLI", cFONO_CLI) :
            new ObjectParameter("CFONO_CLI", typeof(string));

        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SP_INSERTCLIENTE", cNUMRUT_CLIParameter, cDRUT_CLIParameter, cNOMBRE_CLIParameter, cAPELLIDO_PAT_CLIParameter, cAPELLIDO_MAT_CLIParameter, cMAIL_CLIParameter, cACTIVO_CLIParameter, cDIRECCION_CLIParameter, cFECHA_NACIMIENTO_CLIParameter, cFONO_CLIParameter);
    }

    public virtual int SP_INSERTCONTRATO(Nullable<System.DateTime> pFECHA_INICIO, Nullable<System.DateTime> pFECHA_TERMINO, Nullable<decimal> pMETA, Nullable<decimal> pMONTO_RESERVA, string pESTADO, Nullable<decimal> pNUMRUT_EMP, Nullable<decimal> pNUMRUT_CLI_TITULAR)
    {
        var pFECHA_INICIOParameter = pFECHA_INICIO.HasValue ?
            new ObjectParameter("PFECHA_INICIO", pFECHA_INICIO) :
            new ObjectParameter("PFECHA_INICIO", typeof(System.DateTime));

        var pFECHA_TERMINOParameter = pFECHA_TERMINO.HasValue ?
            new ObjectParameter("PFECHA_TERMINO", pFECHA_TERMINO) :
            new ObjectParameter("PFECHA_TERMINO", typeof(System.DateTime));

        var pMETAParameter = pMETA.HasValue ?
            new ObjectParameter("PMETA", pMETA) :
            new ObjectParameter("PMETA", typeof(decimal));

        var pMONTO_RESERVAParameter = pMONTO_RESERVA.HasValue ?
            new ObjectParameter("PMONTO_RESERVA", pMONTO_RESERVA) :
            new ObjectParameter("PMONTO_RESERVA", typeof(decimal));

        var pESTADOParameter = pESTADO != null ?
            new ObjectParameter("PESTADO", pESTADO) :
            new ObjectParameter("PESTADO", typeof(string));

        var pNUMRUT_EMPParameter = pNUMRUT_EMP.HasValue ?
            new ObjectParameter("PNUMRUT_EMP", pNUMRUT_EMP) :
            new ObjectParameter("PNUMRUT_EMP", typeof(decimal));

        var pNUMRUT_CLI_TITULARParameter = pNUMRUT_CLI_TITULAR.HasValue ?
            new ObjectParameter("PNUMRUT_CLI_TITULAR", pNUMRUT_CLI_TITULAR) :
            new ObjectParameter("PNUMRUT_CLI_TITULAR", typeof(decimal));

        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SP_INSERTCONTRATO", pFECHA_INICIOParameter, pFECHA_TERMINOParameter, pMETAParameter, pMONTO_RESERVAParameter, pESTADOParameter, pNUMRUT_EMPParameter, pNUMRUT_CLI_TITULARParameter);
    }

    public virtual int SP_LISTAPAQUETEVIAJE()
    {
        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SP_LISTAPAQUETEVIAJE");
    }

    public virtual int SP_LISTATIPOUSUARIOS()
    {
        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SP_LISTATIPOUSUARIOS");
    }

    public virtual int SP_LISTAUSUARIOS()
    {
        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SP_LISTAUSUARIOS");
    }

    public virtual int SP_OBTENERUSUARIOPERSONAPORID(Nullable<decimal> p_ID_USR)
    {
        var p_ID_USRParameter = p_ID_USR.HasValue ?
            new ObjectParameter("P_ID_USR", p_ID_USR) :
            new ObjectParameter("P_ID_USR", typeof(decimal));

        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SP_OBTENERUSUARIOPERSONAPORID", p_ID_USRParameter);
    }

    public virtual int SP_SUMATRANSACCIONES(ObjectParameter mONTOSUMA)
    {
        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SP_SUMATRANSACCIONES", mONTOSUMA);
    }

    public virtual int SP_UPDATECLIENTE(Nullable<decimal> pRUT, string pNOMBRE, string pAPELLIDO_PAT, string pAPELLIDO_MAT, string pMAIL_CLI, string pACTIVO, string pDIRECCION, Nullable<System.DateTime> pFECHA_NACIMIENTO, string pTELEFONO)
    {
        var pRUTParameter = pRUT.HasValue ?
            new ObjectParameter("PRUT", pRUT) :
            new ObjectParameter("PRUT", typeof(decimal));

        var pNOMBREParameter = pNOMBRE != null ?
            new ObjectParameter("PNOMBRE", pNOMBRE) :
            new ObjectParameter("PNOMBRE", typeof(string));

        var pAPELLIDO_PATParameter = pAPELLIDO_PAT != null ?
            new ObjectParameter("PAPELLIDO_PAT", pAPELLIDO_PAT) :
            new ObjectParameter("PAPELLIDO_PAT", typeof(string));

        var pAPELLIDO_MATParameter = pAPELLIDO_MAT != null ?
            new ObjectParameter("PAPELLIDO_MAT", pAPELLIDO_MAT) :
            new ObjectParameter("PAPELLIDO_MAT", typeof(string));

        var pMAIL_CLIParameter = pMAIL_CLI != null ?
            new ObjectParameter("PMAIL_CLI", pMAIL_CLI) :
            new ObjectParameter("PMAIL_CLI", typeof(string));

        var pACTIVOParameter = pACTIVO != null ?
            new ObjectParameter("PACTIVO", pACTIVO) :
            new ObjectParameter("PACTIVO", typeof(string));

        var pDIRECCIONParameter = pDIRECCION != null ?
            new ObjectParameter("PDIRECCION", pDIRECCION) :
            new ObjectParameter("PDIRECCION", typeof(string));

        var pFECHA_NACIMIENTOParameter = pFECHA_NACIMIENTO.HasValue ?
            new ObjectParameter("PFECHA_NACIMIENTO", pFECHA_NACIMIENTO) :
            new ObjectParameter("PFECHA_NACIMIENTO", typeof(System.DateTime));

        var pTELEFONOParameter = pTELEFONO != null ?
            new ObjectParameter("PTELEFONO", pTELEFONO) :
            new ObjectParameter("PTELEFONO", typeof(string));

        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SP_UPDATECLIENTE", pRUTParameter, pNOMBREParameter, pAPELLIDO_PATParameter, pAPELLIDO_MATParameter, pMAIL_CLIParameter, pACTIVOParameter, pDIRECCIONParameter, pFECHA_NACIMIENTOParameter, pTELEFONOParameter);
    }

    public virtual int SP_UPDATECONTRATO(Nullable<decimal> pID_CONTRATO, Nullable<System.DateTime> pFECHA_INICIO, Nullable<System.DateTime> pFECHA_TERMINO, Nullable<decimal> pMETA, Nullable<decimal> pMONTO_RESERVA, string pESTADO, Nullable<decimal> pNUMRUT_EMP, Nullable<decimal> pNUMRUT_CLI_TITULAR)
    {
        var pID_CONTRATOParameter = pID_CONTRATO.HasValue ?
            new ObjectParameter("PID_CONTRATO", pID_CONTRATO) :
            new ObjectParameter("PID_CONTRATO", typeof(decimal));

        var pFECHA_INICIOParameter = pFECHA_INICIO.HasValue ?
            new ObjectParameter("PFECHA_INICIO", pFECHA_INICIO) :
            new ObjectParameter("PFECHA_INICIO", typeof(System.DateTime));

        var pFECHA_TERMINOParameter = pFECHA_TERMINO.HasValue ?
            new ObjectParameter("PFECHA_TERMINO", pFECHA_TERMINO) :
            new ObjectParameter("PFECHA_TERMINO", typeof(System.DateTime));

        var pMETAParameter = pMETA.HasValue ?
            new ObjectParameter("PMETA", pMETA) :
            new ObjectParameter("PMETA", typeof(decimal));

        var pMONTO_RESERVAParameter = pMONTO_RESERVA.HasValue ?
            new ObjectParameter("PMONTO_RESERVA", pMONTO_RESERVA) :
            new ObjectParameter("PMONTO_RESERVA", typeof(decimal));

        var pESTADOParameter = pESTADO != null ?
            new ObjectParameter("PESTADO", pESTADO) :
            new ObjectParameter("PESTADO", typeof(string));

        var pNUMRUT_EMPParameter = pNUMRUT_EMP.HasValue ?
            new ObjectParameter("PNUMRUT_EMP", pNUMRUT_EMP) :
            new ObjectParameter("PNUMRUT_EMP", typeof(decimal));

        var pNUMRUT_CLI_TITULARParameter = pNUMRUT_CLI_TITULAR.HasValue ?
            new ObjectParameter("PNUMRUT_CLI_TITULAR", pNUMRUT_CLI_TITULAR) :
            new ObjectParameter("PNUMRUT_CLI_TITULAR", typeof(decimal));

        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SP_UPDATECONTRATO", pID_CONTRATOParameter, pFECHA_INICIOParameter, pFECHA_TERMINOParameter, pMETAParameter, pMONTO_RESERVAParameter, pESTADOParameter, pNUMRUT_EMPParameter, pNUMRUT_CLI_TITULARParameter);
    }

    public virtual int SP_INSERTARCUENTA(Nullable<decimal> pARAM_SALDO, Nullable<decimal> pARAM_ID_CONTRATO, Nullable<decimal> pARAM_NUMRUT_CLIE, string pARAM_ACTIVO)
    {
        var pARAM_SALDOParameter = pARAM_SALDO.HasValue ?
            new ObjectParameter("PARAM_SALDO", pARAM_SALDO) :
            new ObjectParameter("PARAM_SALDO", typeof(decimal));

        var pARAM_ID_CONTRATOParameter = pARAM_ID_CONTRATO.HasValue ?
            new ObjectParameter("PARAM_ID_CONTRATO", pARAM_ID_CONTRATO) :
            new ObjectParameter("PARAM_ID_CONTRATO", typeof(decimal));

        var pARAM_NUMRUT_CLIEParameter = pARAM_NUMRUT_CLIE.HasValue ?
            new ObjectParameter("PARAM_NUMRUT_CLIE", pARAM_NUMRUT_CLIE) :
            new ObjectParameter("PARAM_NUMRUT_CLIE", typeof(decimal));

        var pARAM_ACTIVOParameter = pARAM_ACTIVO != null ?
            new ObjectParameter("PARAM_ACTIVO", pARAM_ACTIVO) :
            new ObjectParameter("PARAM_ACTIVO", typeof(string));

        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SP_INSERTARCUENTA", pARAM_SALDOParameter, pARAM_ID_CONTRATOParameter, pARAM_NUMRUT_CLIEParameter, pARAM_ACTIVOParameter);
    }

    public virtual int SP_UPDATESALDOCUENTA(Nullable<decimal> pID_CUENTA, Nullable<decimal> pSALDO)
    {
        var pID_CUENTAParameter = pID_CUENTA.HasValue ?
            new ObjectParameter("PID_CUENTA", pID_CUENTA) :
            new ObjectParameter("PID_CUENTA", typeof(decimal));

        var pSALDOParameter = pSALDO.HasValue ?
            new ObjectParameter("PSALDO", pSALDO) :
            new ObjectParameter("PSALDO", typeof(decimal));

        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SP_UPDATESALDOCUENTA", pID_CUENTAParameter, pSALDOParameter);
    }
}
