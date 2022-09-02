using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class admin_organizations : System.Web.UI.Page
{
    public static TextBox TxtId = new TextBox();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillGVOrganizations();
        }
    }
    protected void BtnEdit_Click(object sender, EventArgs e)
    {
        LinkButton linkdetail = sender as LinkButton;
        GridViewRow grow = (GridViewRow)linkdetail.NamingContainer;
        TxtId.Text = grow.Cells[0].Text;

        try
        {
            using (SqlConnection conn = Connection.getdbConnection())
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM organizations WHERE id = '" + TxtId.Text + "' ", conn);
                SqlDataReader sdr = cmd.ExecuteReader();

                while (sdr.Read())
                {
                    //Id 0
                    TxtOrgName.Text = sdr[1].ToString();
                    TxtOrgDescr.Text = sdr[2].ToString();
                    TxtOrgTellNum.Text = sdr[3].ToString();
                    TxtOrgEmail.Text = sdr[4].ToString();
                    TxtPassword.Text = sdr[5].ToString();
                    //OrgLogo.FileBytes = sdr[7].ToString();
                    //Reg Date 8
                    //User Id 9
                    DDLStatus.Text = sdr[9].ToString();
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
        InsertUpdateOrganizations();
    }

    //Custom defined Functions


    //Populate/Fill GridView Users Users
    void FillGVOrganizations()
    {
        DataTable dt = new DataTable();
        try
        {
            using (SqlConnection con = Connection.getdbConnection())
            {
                SqlDataAdapter sqlda = new SqlDataAdapter("SELECT * FROM organizations", con);
                sqlda.Fill(dt);
                TxtId.Text = "0";
            }
            if (dt.Rows.Count > 0)
            {
                GVOrganizations.DataSource = dt;
                GVOrganizations.DataBind();
            }
        }
        catch (Exception ex)
        {
            GVOrganizations.DataSource = ex.Message.ToString();
            GVOrganizations.DataBind();
            GVOrganizations.BackColor = System.Drawing.Color.Red;
        }

    }

    //Insert Or Update Users
    void InsertUpdateOrganizations()
    {
        string msg, filepath, filename;
        try
        {
            String date = DateTime.Now.ToString("yyyy-MM-dd");

            if (OrgLogo.HasFile)
            {
                filepath = "~/assets/ProfPics/user3.jpg";
                filename = Path.GetFileName(OrgLogo.PostedFile.FileName);
                OrgLogo.SaveAs(Server.MapPath("assets/ProfPics/" + filename));
                filepath = "~/assets/ProfPics/" + filename;


                using (SqlConnection conn = Connection.getdbConnection())
                {
                    ////txtid.Text = "0";
                    SqlCommand cmd = new SqlCommand("spOrganizations", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", TxtId.Text);
                    cmd.Parameters.AddWithValue("@orgName", TxtOrgName.Text);
                    cmd.Parameters.AddWithValue("@descr", TxtOrgDescr.Text);
                    cmd.Parameters.AddWithValue("@tellNum", TxtOrgTellNum.Text);
                    cmd.Parameters.AddWithValue("@email ", TxtOrgEmail.Text);
                    cmd.Parameters.AddWithValue("@password", TxtPassword.Text);
                    cmd.Parameters.AddWithValue("@logo", filepath);
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
                    FillGVOrganizations();
                }
            }
            else
            {
                LblMsg.Text = "Select Profile Pic";
                LblMsg.ForeColor = System.Drawing.Color.Red;
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
        TxtId.Text = "0";
        TxtOrgName.Text = "";
        TxtOrgDescr.Text = "";
        TxtOrgTellNum.Text = "";
        TxtOrgEmail.Text = "";
        TxtPassword.Text = "";
        OrgLogo.Dispose();
        //Reg Date
        //User Id
        DDLStatus.ClearSelection();
    }

}