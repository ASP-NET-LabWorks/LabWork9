using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace LabWork9
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LabelLoadTime.Text = DateTime.Now.ToLongTimeString();
        }

        protected void UpdatePanelGeneric_Load(object sender, EventArgs e)
        {
            try
            {
                var panel = (UpdatePanel)sender;
                var targetLabelID = $"Label{Regex.Match(panel.ID, @"\d+").Value}";
                var label = (Label)panel.Parent.FindControl(targetLabelID);
                label.Text = DateTime.Now.ToLongTimeString();
            }
            catch (Exception error)
            {
                Response.Write(error.Message);
            }
        }

        protected void UpdatePanel2_Load(object sender, EventArgs e)
        {
            Label2.Text = $"{DateTime.Now.ToLongTimeString()}: {TextBox1.Text}";
        }
        protected void UpdatePanel3_Load(object sender, EventArgs e)
        {
            var selected = new List<string>();
            foreach (ListItem i in CheckBoxList.Items)
                if (i.Selected)
                    selected.Add(i.Value);
            Label3.Text = $"{DateTime.Now.ToLongTimeString()}: {string.Join(", ", selected)}";
        }
        protected void UpdatePanel4_Load(object sender, EventArgs e)
        {
            Label4.Text = $"{DateTime.Now.ToLongTimeString()}: {RadioButtonList.SelectedValue}";
        }

        protected void ButtonError_Click(object sender, EventArgs e)
        {
            throw new ApplicationException("Test AsyncPostBack Error");
        }

        protected void ButtonSleep_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(5000);
        }
    }
}