using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

public partial class client : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            String URL = "http://localhost:49990/Service.svc/";
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(URL);
            WebResponse response = request.GetResponse();
            StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8);
            string json = reader.ReadToEnd();
            DataTable db = JsonConvert.DeserializeObject<DataTable>(json);
            DatabaseFields.DataSource = db;
            DatabaseFields.DataBind();
        }
    }

    protected void LoadView(object sender, EventArgs e)
    {
        DataTable query = new DataTable();
        query.Columns.Add("AlbumName");
        query.Columns.Add("Artist");
        query.Columns.Add("TrackCount");
        query.Columns.Add("RecordLabel");
        query.Columns.Add("ReleaseDate");
        
        DataRow[] curr = new DataRow[25];
        String URL = "http://localhost:49990/Service.svc/";
        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(URL);
        WebResponse response = request.GetResponse();
        StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8);
        string json = reader.ReadToEnd();
        DataTable table = JsonConvert.DeserializeObject<DataTable>(json);

        for (int row = 0; row < table.Rows.Count; row++)
        {
             curr = table.Select();
        }

        foreach(DataRow dr in curr){

            if (dr["AlbumName"].Equals(CD.Text)){

                DataRow r = query.NewRow();
                r["AlbumName"] = dr["AlbumName"];
                r["Artist"] = dr["Artist"];
                r["TrackCount"] = dr["TrackCount"];
                r["RecordLabel"] = dr["RecordLabel"];
                // gets release date and removes the time from display
                string x = dr["ReleaseDate"].ToString();
                string y = x.Replace(" 00:00:00", "");
                r["ReleaseDate"] = y;
                
                query.Rows.Add(r); // add row

            }

        }
        QueryGV.DataSource = query;
        QueryGV.DataBind();
       
    }


}