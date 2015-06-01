using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

public partial class WF_F_COLUMNBack : AgileFrame.AppInOne.Common.BaseAdminPage_Ajax  //BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //在列表里点击删除按钮，通过AJAX执行这里的后台代码，删除一条记录
        if (Request["DelCOLUMN_ID"] != null)
        {
            int re = BLLTable<TF_F_COLUMN>.Factory(conn).Delete(TF_F_COLUMN.Attribute.COLUMN_ID, Request["DelCOLUMN_ID"]);
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
            TF_F_COLUMN cond = new TF_F_COLUMN();
            cond.In(TF_F_COLUMN.Attribute.COLUMN_ID, Request["DelKeyIDS"]);

            Relation rel = new Relation(TF_TB_FIELD.Attribute.FIELD_ID, TF_F_COLUMN.Attribute.FIELD_ID);

            TF_TB_FIELD obj = new TF_TB_FIELD();
            obj.CREATED =0;

            int re = BLLTable<TF_TB_FIELD>.Factory(conn).Update(obj, cond, rel);

            re = BLLTable<TF_F_COLUMN>.Factory(conn).Delete(cond);
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
            TF_F_COLUMN val = new TF_F_COLUMN();
            val.COLUMN_ID = int.Parse(Request["FieldKeyID"]);
            List<AttributeItem> lstCol = val.af_AttributeItemList;
            for (int i = 0; i < lstCol.Count; i++)
            {
                if (!string.IsNullOrEmpty(Request["txt" + lstCol[i].FieldName])) {
                    val.SetValue(lstCol[i].FieldName,Request["txt" + lstCol[i].FieldName]);
                }
            }

            BLLTable<TF_F_COLUMN>.Factory(conn).Update(val, TF_F_COLUMN.Attribute.COLUMN_ID);
            Response.Write("修改用户信息成功");

        }
        if (Request["getColItems"] != null)
        {
            string colid=Request["colID"];
            List<TF_F_COLUMN_ITEM> lst = BLLTable<TF_F_COLUMN_ITEM>.Factory(conn).Select(TF_F_COLUMN_ITEM.Attribute.COLUMN_ID, colid);
            StringBuilder sb = new StringBuilder("[");
            if (lst != null) {
                lst.ForEach(col => {
                    if(sb.Length>3){
                        sb.Append(",");

                        sb.Append("{val:'"+col.VALUE+"',txt:'"+col.TEXT+"'}");
                    }
                
                });
            }
            sb.Append("]");
            Response.Write(sb.ToString());
        }

        Response.End();
    }
}