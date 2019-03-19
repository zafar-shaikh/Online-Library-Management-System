using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Data.SqlClient;

namespace Online_Library_Management_System
{
    public partial class StockTypeMaster : System.Web.UI.Page
    {
        MainDB db = new MainDB();

        public static DataSet ds = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            Label lb;
            lb = (Label)Page.Master.FindControl("lblloginusr");
            lb.Text = Session["uname"].ToString();
            if (Session["isadmin"].ToString() == "Y")
            {
                Menu mnu;
                
                mnu = (Menu)Page.Master.FindControl("mnuadmin");
                
                mnu.Visible = true;
            }
            if (!IsPostBack)
            {
                GridViewDataBind();
                Session["ds"] = ds;

            }
        }

        protected void btninsert_Click(object sender, EventArgs e)
        {
            SqlDataReader dr;
            SqlCommand cmd = new SqlCommand();
            string rid;

            dr = db.SqlDataReaderConnection("select max([intYear_ID]) from YearMaster", " YearMaster");

            if (dr.HasRows == false)
            {
                rid = "SID" + 1;
                txtstkid.Text = rid;
                txtstknm.Text = "";
            }
            else
            {
                cmd = db.SqlCommandConnection("select [intStock_Type_ID] from StockTypeMaster", " StockTypeMaster");
                rid = cmd.ExecuteScalar().ToString();
                rid = rid.Substring(3);
                rid = "SID" + (int.Parse(rid) + 1).ToString();

            }
            txtstkid.Text = rid;
            txtstknm.Text = "";
            btnsave.Enabled = true;
            btninsert.Enabled = false;
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            string s = e.CommandArgument.ToString();

            switch (e.CommandName)
            {
                case "EditStock":

                    GridView1.EditIndex = Convert.ToInt32(s.Substring(3)) - 1;
                    GridViewDataBind();
                    break;

                case "UpdateStock":

                    SqlConnection cn = new SqlConnection();
                    SqlCommand cmd;

                    cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionStrigSql"].ToString();
                    cn.Open();
                    foreach (GridViewRow grvrow in GridView1.Rows)
                    {
                        if (e.CommandArgument.ToString() == ((Label)grvrow.FindControl("lblstkid")).Text)
                        {
                            string Stock = ((TextBox)grvrow.FindControl("txtstknm")).Text;

                            string strquery = "UPDATE StockTypeMaster SET strStock_Name = '" + Stock + "' WHERE intStock_Type_ID = '" + s + "' ";

                            cmd = new SqlCommand(strquery, cn);
                            cmd.ExecuteNonQuery();
                            GridView1.EditIndex = -1;

                        }
                    }

                    GridViewDataBind();

                    cn.Close();


                    break;


                case "CancelStock":

                    GridView1.EditIndex = -1;
                    GridViewDataBind();
                    break;
            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            string strQuery = "insert into StockTypeMaster (intStock_Type_ID,strStock_Name)" + "values(@intStock_Type_ID,@strStock_Name)";
            cmd = db.SqlCommandConnection(strQuery, "strStock_Name");
            cmd.Parameters.AddWithValue("@intStock_Type_ID", txtstkid.Text);
            cmd.Parameters.AddWithValue("@strStock_Name", txtstknm.Text);

            cmd.ExecuteNonQuery();
            //db.SqlCommandExecuteNonQuery("INSERT INTO [ItemTypeMaster] ([intItem_Type_ID], [strItem_Name]) VALUES '"+txtitemtp.Text+"','"+ txtitmnm.Text+"'", "ItemTyeMaster");
            GridViewDataBind();
            txtstkid.Text = "";
            txtstknm.Text = "";

            btnsave.Enabled = false;
            btninsert.Enabled = true;

        }
        public void GridViewDataBind()
        {
            ds = db.SqlDataAdapterconnection("select * from StockTypeMaster", "StockTypeMaster");
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }

        protected void btncancle_Click(object sender, EventArgs e)
        {
            btninsert.Enabled = true;
            txtstkid.Text = "";
            txtstknm.Text = "";
        }
    }
}
