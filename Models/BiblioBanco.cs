using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace Biblio.Models
{
    public class BiblioBanco
    {
        public SqlConnection conectar;
        public SqlCommand comando;
        public SqlDataAdapter adapter;
        public DataSet dset;
        public DataRow rowResultado;
        public ArrayList listaResultado;
        public string strResultado;
        public BiblioBanco()
        {
            string strcon = @"data source=.\SQLEXPRESS;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|sgbu.mdf;User Instance=true";
            this.conectar = new SqlConnection(strcon);
            this.listaResultado = new ArrayList();
        }
    }
}