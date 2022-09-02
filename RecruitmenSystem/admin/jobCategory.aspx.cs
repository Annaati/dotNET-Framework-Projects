using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class admin_jobCategory : System.Web.UI.Page
{
    TextBox TxtId = new TextBox();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            FillGVjobCat();
            TxtId.Text = "0";
        }
    }

    protected void BtnEdit_Click(object sender, EventArgs e)
    {

        LinkButton linkdetail = sender as LinkButton;
        GridViewRow gvRow = (GridViewRow)linkdetail.NamingContainer;
        TxtId.Text = gvRow.Cells[0].Text;

        try
        {
            using (SqlConnection conn = Connection.getdbConnection())
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM jobCategory WHERE id = '" + TxtId.Text + "' ", conn);
                SqlDataReader sdr = cmd.ExecuteReader();

                while (sdr.Read())
                {
                    //Id 0
                    DDLOrgId.Text = sdr[2].ToString();
                    TxtOrgName.Text = sdr[1].ToString();
                    TxtOrgName.Text = sdr[3].ToString();
                    TxtCatName.Text = sdr[4].ToString();
                    //Password 6
                    //FUImg.FileBytes = sdr[7].ToString();
                    //Reg Date 8
                    //User Id 9
                    DDLStatus.Text = sdr[10].ToString();
                }
            }
        }
        catch (Exception ex)
        {
            LblMsg.Text = ex.Message.ToString();
            LblMsg.ForeColor = System.Drawing.Color.Red;
        }

        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openuserModal();", true);

    }

    protected void BtnSave_Click(object sender, EventArgs e)
    {
        InsertUpdatejobCat();
    }


    //Custom defined Functions


    //Populate/Fill GridView Users Users
    void FillGVjobCat()
    {
        DataTable dt = new DataTable();
        try
        {
            using (SqlConnection con = Connection.getdbConnection())
            {
                SqlDataAdapter sqlda = new SqlDataAdapter("SELECT * FROM jobCategory", con);
                sqlda.Fill(dt);
            }
            if (dt.Rows.Count > 0)
            {
                GVUsers.DataSource = dt;
                GVUsers.DataBind();
            }
        }
        catch (Exception ex)
        {
            GVUsers.DataSource = ex.Message.ToString();
            GVUsers.DataBind();
            GVUsers.BackColor = System.Drawing.Color.Red;
        }

    }

    //Insert Or Update Users
    void InsertUpdatejobCat()
    {
        string msg;
        try
        {
            String date = DateTime.Now.ToString("yyyy-MM-dd");

            

                using (SqlConnection conn = Connection.getdbConnection())
                {
                    ////txtid.Text = "0";
                    SqlCommand cmd = new SqlCommand("spJobCategory", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", TxtId.Text);
                    cmd.Parameters.AddWithValue("@orgId", DDLOrgId.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@catName", TxtCatName.Text);
                    cmd.Parameters.AddWithValue("@descr ", TxtDescr.Text);
                    cmd.Parameters.AddWithValue("@regDate", date);
                    cmd.Parameters.AddWithValue("@userId", "1");
                    cmd.Parameters.AddWithValue("@status", DDLStatus.SelectedItem.ToString());

                    cmd.Parameters.Add("@msg", SqlDbType.Char, 500);
                    cmd.Parameters["@msg"].Direction = ParameterDirection.Output;

                    cmd.ExecuteNonQuery();

                    msg = (string)cmd.Parameters["@msg"].Value;
                    LblMsg.Text = msg;
                    LblMsg.ForeColor = System.Drawing.Color.Green;

                    cmd.Parameters.Clear();
                    ClearTexts();
                    FillGVjobCat();
                }
        }
        catch (Exception ex)
        {
            LblMsg.Text = ex.Message.ToString();
            LblMsg.ForeColor = System.Drawing.Color.Red;
        }
    }

    //Clear Text Controls
    void ClearTexts()
    {
        TxtId.Text = "";
        DDLOrgId.ClearSelection();
        TxtOrgName.Text = "";
        TxtCatName.Text = "";
        TxtDescr.Text = "";
        //Reg Date
        //User Id
        DDLStatus.ClearSelection();
    }


}