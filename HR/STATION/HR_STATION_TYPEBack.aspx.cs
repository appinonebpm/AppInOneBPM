using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

public partial class HR_STATION_TYPEBack : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //在列表里点击删除按钮，通过AJAX执行这里的后台代码，删除一条记录
        if (Request["DelTYPE_ID"] != null)
        {
            int re = BLLTable<HR_STATION_TYPE>.Delete(HR_STATION_TYPE.Attribute.TYPE_ID, Request["DelTYPE_ID"]);
            if (re > 0)
            {
                Response.Write("1");//可以输出数字 大于0 表示操作成功，也可以直接输出 字符串，客户端将弹出此字符串信息作为提示
            }
            else
            {
                Response.Write("删除失败！");
            }
        }

        //在列表顶部点击删除按钮，通过AJAX执行这里的后台代码，删除多条记录
        if (Request["DelKeyIDS"] != null)
        {
            HR_STATION_TYPE cond = new HR_STATION_TYPE();
            cond.In(HR_STATION_TYPE.Attribute.TYPE_ID, Request["DelKeyIDS"]);
            int re = BLLTable<HR_STATION_TYPE>.Delete(cond);
            if (re > 0)
            {
                Response.Write("1");//可以输出数字 大于0 表示操作成功，也可以直接输出 字符串，客户端将弹出此字符串信息作为提示
            }
            else
            {
                Response.Write("删除失败！");
            }
        }

        //在用户详细信息查看编辑页面，点保存时，通过AJAX执行这里的后台代码，实现部门字段的更新
        if (Request["saveInfo"] != null)
        {
            HR_STATION_TYPE val = new HR_STATION_TYPE();
            val.TYPE_ID = int.Parse(Request["FieldKeyID"]);
            List<AttributeItem> lstCol = val.af_AttributeItemList;
            for (int i = 0; i < lstCol.Count; i++)
            {
                if (!string.IsNullOrEmpty(Request["txt" + lstCol[i].FieldName])) {
                    val.SetValue(lstCol[i].FieldName,Request["txt" + lstCol[i].FieldName]);
                }
            }

            BLLTable<HR_STATION_TYPE>.Update(val, HR_STATION_TYPE.Attribute.TYPE_ID);
            Response.Write("修改用户信息成功");

        }
        Response.End();
    }
}