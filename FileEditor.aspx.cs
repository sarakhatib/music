using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FileEditor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ValidUser"] != null && Session["ValidUser"].ToString().Equals("yes"))
        {
            string type = "File (" + DropDownListFileType.SelectedItem.Text.ToString() + ")";
            FillGridView(type);
        }
        else
        {
            Response.Redirect("LogIn.aspx");
        }

    }
    protected void FillGridView(string type)
    {
        ClassFiles[] A = ClassFiles.GetAll(type);
        GridViewFiles.DataSource = A;
        GridViewFiles.DataBind();
    }
    protected void ButtonUpload_Click(object sender, EventArgs e)
    {
        try
        {
            string type = "File (" + DropDownListFileType.SelectedItem.Text.ToString() + ")";
            string date = DateTime.Now.ToString();
            string descrip = TextBoxDiscription.Text;
            ClassFiles obj = new ClassFiles();
            obj.FileType = type;
            obj.UploadDate = date;
            obj.Description = descrip;
            // Request.PhysicalApplicationPath تعيد لنا مكان وجود الموقع على الخادم
            // C:\Inetpub\wwwroot\FilesHandling\ مثلا
            string strRealPath = Request.PhysicalApplicationPath;
            // C:\Inetpub\wwwroot\FilesHandling\Docs الملفات مخزنة في المجلد
            strRealPath += "Docs\\";
            // هل اختار المستخدم ملفا؟
            if (FileUploadBrowser.HasFile)
            {
                // هل المجلد الذي نريد حفظ الملفات فيه موجود؟
                if (!System.IO.Directory.Exists(strRealPath))
                {
                    LabelError.Text = "Docs directory does not exist";
                    return;
                }
                // هل حجم الملف يزيد عن الحجم الذي نسمح به؟
                else if (FileUploadBrowser.PostedFile.ContentLength < 100000000)
                {
                    // هل يوجد ملف بهذا الاسم في مجلد حفظ الملفات؟
                    if (System.IO.File.Exists(strRealPath + FileUploadBrowser.FileName))
                    {
                        LabelError.Text = "A file with this name already exists";
                        return;
                    }
                    else
                    {
                        // نحفظ الملف في المجلد المُعد لذلك
                        FileUploadBrowser.SaveAs(strRealPath + FileUploadBrowser.FileName);
                        obj.FileSize = FileUploadBrowser.PostedFile.ContentLength.ToString();
                        obj.FileName = FileUploadBrowser.FileName;
                        if (obj.Insert().ToString().Equals(string.Empty))
                        {
                            LabelError.Text = "Successfully Uploaded ";
                        }
                        else
                        {
                            LabelError.Text = "There must be some kind of problem";
                            return;
                        }
                    }
                }
                else
                {
                    LabelError.Text = "The file size must be <= to 100 MB ";
                    return;
                }
            }
            else
            {
                LabelError.Text = "Please select a file first";
                return;
            }
            FillGridView(type);
        }
        catch (Exception ex)
        {
            LabelError.Text = ex.Message;
        }


    }
    protected void GridViewFiles_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {


    }
    protected void GridViewFiles_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "Delete")
            {
                string id = e.CommandArgument.ToString();
                ClassFiles file = new ClassFiles();
                file.FileID = id;
                DataTable dt = ClassFiles.GetByID(id);
                if (!file.Delete().Equals(string.Empty))
                {
                    LabelError.Text = "There must be some kind of problem";
                }
                else
                {
                   
                    string strPath = Request.PhysicalApplicationPath;
                    System.IO.File.Delete(strPath + "Docs\\"+dt.Rows[0]["FileName"]);
                }
            }
        }
        catch (Exception ex)
        {
            LabelError.Text = ex.Message;
        }
    }
}