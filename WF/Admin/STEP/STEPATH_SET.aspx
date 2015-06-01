<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="STEP_STEPATH_SET" CodeFile="STEPATH_SET.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Lib/stepPath.css" rel="stylesheet" type="text/css" />
    <script src="../../../Lib/JQuery/ui/jquery.ui.core.min.js" type="text/javascript"></script>
    <script src="../../../Lib/jsPlugin/layLR/layLR.js" type="text/javascript"></script>
    <script src="../Lib/StepPath.js" type="text/javascript"></script>
    
<script type="text/javascript">
    SP.wfid = '<%=wfid %>';
    SP.procid = '<%=procid %>';

    function aaaaaaa() {
        alert($("#divRight").scrollTop());
    }
    $(function () {

        SP.divMoveObj = $("#divMove");
        SP.divStepMapObj = $("#divStepMap");
        SP.reSetRowsObj();

        SP.rowsObj.each(function (i) {
            if (i == 0) {
                SP.firstRowTop = $(this).offset().top;
            }
            var steps = $(this).find("div.step"); //alert($(this).getNextRow());
            var rowW = $(this).width();
            var stepNum = steps.length;
            var stepDiv = $(steps[0]);
            var stepWidth = stepDiv.width();
            var left = (rowW - stepWidth * stepNum) / 2;
            stepDiv.css({ "margin-left": left + 'px' });
        });

        SP.leftWidth = SP.divStepMapObj.offset().left;

        var divSteps = SP.divStepMapObj.find("div.step");
        var divShapes = $("div.shaps").children();
        
        ///����¼�
        divShapes.each(function (i) {
            $(this).bind("mousedown", $(this), function (e) {
                SP.divMoveObj.data("move", true);

                var dataStr = e.data.attr("data");
                var dataObj = eval("(" + dataStr + ")");

                if (dataObj.id != undefined) {
                    var stepHtml = SP.stepsHtml[dataObj.type];
                    stepHtml = stepHtml.replaceAll("{NAME}", dataObj.name);
                    stepHtml = stepHtml.replaceAll("{ID}", dataObj.id);

                    var useStep = $(stepHtml);
                    SP.divStepMapObj.data("movedStep", useStep);
                    SP.NoUseMoved = $(this);
                }

                SP.divMoveObj.html(e.data.html());
                SP.divMoveObj.attr("data", dataStr);

                var off = e.data.offset();
                SP.divMoveObj.css({ top: off.top + "px", left: off.left + "px", width: e.data.width() + "px", height: e.data.height() + "px" });
                SP.divMoveObj.show();
            });

        });

        divSteps.each(function (i) {
            SP.initStepEvent($(this));
        });

        var overRow = null;
        $("#divLR").bind("mousemove", SP.divMoveObj, function (e) {
            var mouseY = e.pageY - 15;

            var off = e.data.offset();
            var y = e.pageY - 15; // (e.pageY - off.top);
            var x = e.pageX - 15; // (e.pageX - off.left);
            if (e.data.data("move") == true) {
                e.data.css({ top: y + "px", left: x + "px" });
            }
            //window.status = $("#divLR")[0].scrollHeight + "|" + $("#divStepMap").height() + "|" + $("#divRight").scrollTop() + "|" + y; // $("#divLR")[0].scrollTop; // e.target.tagName;
            if (overRow != null) {
                overRow.removeClass("over");
            }
            y += $("#divRight").scrollTop();
            if (y > SP.firstRowTop && x > 120) {
                if (e.data.data("move") == true) {
                    var tagObj = $(e.target);
                    window.status = "aaaa";
                    overRow = SP.getOverRowObj(tagObj);
                } else {
                    window.status = "bbbb";
                    overRow = SP.getOverRowObj(y);
                }
                if (overRow != null) {
                    overRow.addClass("over");
                }
            } else {
                overRow = null;
            }

        });



        SP.divMoveObj.bind("mouseup", SP.divMoveObj, function (e) {
            e.data.data("move", false);
            if (e.pageY < SP.firstRowTop || e.pageX < 120) {
                e.data.hide();
                return;
            }
            var rowObj = SP.getOverRowObj(e.data); // alert(rowObj.length);
            e.data.hide();
            if (rowObj == null) {
                return;
            }


            var obj = eval("(" + e.data.attr("data") + ")");
            var newType = obj.type;



            var rowType = rowObj.getRowType(); //alert(rowType);
            if (newType == 0) {
                if (SP.hadBegin()) {
                    alert("�Ѿ����ڿ�ʼ�ڵ�"); return;
                }
            }

            if (newType == 1) {

                var movedStep = SP.divStepMapObj.data("movedStep");
                if (movedStep != undefined && movedStep != null) {
                    SP.divStepMapObj.data("movedStep", null);
                    var oldIndex = SP.rowsObj.index(movedStep.parent());
                    var curIndex = SP.rowsObj.index(rowObj);
                    if (oldIndex == curIndex) {
                        return;
                    }
                    var delOld = false;
                    if (rowType != 3) {
                        if (rowType == 2 || rowType == 0) {

                            var newRow = rowObj.getNextRow();
                            if (newRow == null || newRow.getRowType() != 1) {
                                newRow = $(SP.rowHtml);
                                rowObj.after(newRow);
                                rowObj = newRow;
                                delOld = true;
                                SP.reSetRowsObj();
                            } else {
                                alert("�����ƶ����˴���"); return;
                            }
                        }
                        var movedP = movedStep.parent();
                        //alert( movedP.html());
                        rowObj.append(movedStep);
                        SP.initLeft(movedP, null); //�ƶ��ڵ�� ���������ڵ�λ��
                        SP.initLeft(rowObj, movedStep);

                        SP.updateStepPath(rowObj, obj.id, delOld);
                        if (SP.NoUseMoved != undefined && SP.NoUseMoved != null) {
                            SP.NoUseMoved.remove();
                        }
                    } else {
                        alert("�����ƶ����˴���");
                    }

                } else {
                    SP.hdNum++;
                    var newStep = $(SP.stepsHtml[newType].replaceAll("{NAME}", "�" + SP.hdNum));
                    if (rowType == 1 || rowType == -1) {
                        SP.addNewToRow(rowObj, newStep, false);
                    } else {
                        var newRow = rowObj.getNextRow();
                        var delObj = false;
                        if (newRow == null || newRow.getRowType() != 1) {
                            newRow = $(SP.rowHtml);
                            if (rowType == 3) {
                                rowObj.before(newRow);
                            } else {
                                rowObj.after(newRow);
                            }
                            delObj = true;
                        }
                        SP.addNewToRow(newRow, newStep, delObj);
                        SP.reSetRowsObj();
                    }
                }
                return;
            }

            if (newType == 2) {
                var movedStep = SP.divStepMapObj.data("movedStep");
                if (movedStep != undefined && movedStep != null) {
                    SP.divStepMapObj.data("movedStep", null);
                    if (rowType == 2 || rowType == 0) {

                        var oldIndex = SP.rowsObj.index(movedStep.parent());
                        var curIndex = SP.rowsObj.index(rowObj);
                        if (oldIndex > curIndex) {
                            SP.addBackLine(rowObj, movedStep);
                        }
                        else if (oldIndex < curIndex) {
                            alert("�����ƶ�·�ɽڵ㣡");
                        }
                    } else {
                        if (SP.NoUseMoved != undefined && SP.NoUseMoved != null) {
                            var stepHtml = SP.stepsHtml[newType].replaceAll("{NAME}", obj.name);
                            stepHtml = stepHtml.replaceAll("{ID}", obj.id);
                            //alert(stepHtml);
                            var newStep = $(stepHtml);
                            //alert(SP.stepsHtml[newType].replaceAll("{NAME}", obj.name));
                            var newRow = $(SP.rowHtml);
                            rowObj.after(newRow);
                            newRow.append(newStep);
                            SP.updateStepPath(newRow, obj.id, true);

                            SP.initLeft(newRow, newStep);

                            SP.reSetRowsObj();
                            SP.NoUseMoved.remove();
                        } else {
                            return; //�ƶ�����·�ɽڵ� �򷵻�
                        }
                    }
                } else {

                    SP.lyNum++;
                    var newStep = $(SP.stepsHtml[newType].replaceAll("{NAME}", "·��" + SP.lyNum));
                    var newRow = $(SP.rowHtml);
                    if (rowType == 3) {
                        rowObj.before(newRow);
                    } else {
                        rowObj.after(newRow);
                    }
                    SP.addNewToRow(newRow, newStep, true);
                    SP.reSetRowsObj();
                }
                return;
            }

            if (newType == 3) {
                if (SP.hadEnd()) {
                    alert("�Ѿ����ڽ����ڵ�"); return;
                }
            }

        });

        //getStepDataObj

        ///����¼��󣬳־û������ݿ�
        divSteps.each(function (i) {
            var stepObj = $(this);
            var dataObj = stepObj.getStepDataObj(); //alert(dataObj.type);
            if (dataObj.type == 2) {
                $.ajax({
                    url: "STEPATH_BACK.aspx?GetBackNextIDS=" + Math.random(),
                    cache: false,
                    data: "wfid=" + SP.wfid + "&procid=" + SP.procid + "&STEP_ID=" + dataObj.id,
                    success: function (svrData) {
                        if (svrData != "") {
                            var arr = svrData.split(',');
                            for (var a = 0; a < arr.length; a++) {
                                if (arr[a] == "") {
                                    continue;
                                }
                                var nextStep = SP.getDivStepByID(arr[a], divSteps);
                                if (nextStep != null) {
                                    //alert(nextStep.html());
                                    //alert(nextStep.parent().html());
                                    SP.showBackLine(nextStep.parent(), stepObj);
                                }
                            }

                        }
                    },
                    error: function (a, b, c) {
                        alert(a + b);
                    }
                });
            }
        });

        $("div,ul, li,a").disableSelection();
    });
    ///�ڵ�� ��������
    function stepSetting(me) {
        var dataObj = eval("(" + $(me).parent().parent().attr("data") + ")");
        var id = dataObj.id;//alert(id);
                
        var prevRow = $(me).parent().parent().parent().prev();
        var previd = 0; 
        var rowType=prevRow.getRowType();
        if (rowType == 2 || rowType==0) {
            previd =prevRow.getRowStepIDS();
        }

        var url = "StepSetting.aspx?wfid=" + SP.wfid + "&procid=" + SP.procid + "&STEP_ID=" + id + "&PREV_ID=" + previd + "&r=" + Math.random();
        if (dataObj.type == 2) {
            url = "RoateSetting.aspx?wfid=" + SP.wfid + "&procid=" + SP.procid + "&STEP_ID=" + id + "&r=" + Math.random();
        }
        var re=  window.showModalDialog(url, "StepSetting", "dialogHeight=600px; dialogWidth=750px;dialogLeft:;dialogTop:; status=No;");
    }


    function setLineCond(stepid, nextid, pt) {
        var url = "../CondSet.aspx?wfid=" + SP.wfid + "&StepID=" + stepid + "&NextID=" + nextid + "&from=2&PATH_TYPE=" + pt + "&r=" + Math.random();
        window.showModalDialog(url, "winCondSet", "dialogHeight=650px; dialogWidth=750px;dialogLeft:;dialogTop:; status=No;");
    }

    function delLine(stepid, nextid, pt, me) {
        if (!confirm("ȷ��Ҫɾ����·��·����")) {
            return;
        }
        $.ajax({
            url: "STEPATH_BACK.aspx?WFID=" + SP.wfid + "&PROCID=" + SP.procid + "&STEP_ID=" + stepid + "&NEXT_ID=" + nextid + "&PATH_TYPE=" + pt + "&delLine=" + Math.random(),
            cache: false,
            success: function (svrData) {
                var id = parseInt(svrData);
                if (id > 0) {
                    $(me).parent().parent().remove();
                } else {
                    alert("ɾ��ʧ�ܣ�");
                }
            },
            error: function (a, b, c) {
                alert(a);
            }
        });
    }

    function delStepInPath(me, type) {
        if (type == 2) { 
           
        }
        if (!confirm("ɾ���˽ڵ㽫��ɾ����֮��ص�·����Ϣ��ȷ��Ҫɾ����?")) {
            return;
        }
        var delStep = 0;
        if (confirm("ͬʱɾ���˽ڵ������Ϣ��?")) {
            delStep = 1;
        }
        var stepObj = $(me).parent().parent(); 
        var nextids = "";
        var previds = "";
        var rowObj = stepObj.parent(); //alert(rowObj.getPrevStepIDS()); alert(rowObj.getNextStepIDS());
        if (rowObj.children().length == 1) {
            previds = rowObj.getPrevStepIDS();
            nextids = rowObj.getNextStepIDS();
        }

        var dataObj = eval("(" + stepObj.attr("data") + ")");
        var stepid = dataObj.id;
        $.ajax({
            url: "STEPATH_BACK.aspx?WFID=" + SP.wfid + "&PROCID=" + SP.procid + "&STEP_ID=" + stepid + "&PrevIDS=" + previds + "&NextIDS=" + nextids + "&delStepInPath=" + Math.random(),
            cache: false,
            success: function (svrData) {
                var id = parseInt(svrData);
                if (id > 0) {
                    var nexts = SP.divStepMapObj.find("div.xian1[data$='-" + stepid + "']");
                    nexts.remove();

                    var begins = SP.divStepMapObj.find("div.xian1[data^='" + stepid + "-']");
                    begins.remove();
                    if (delStep == 1) {
                        $.ajax({
                            url: "STEPATH_BACK.aspx?WFID=" + SP.wfid + "&PROCID=" + SP.procid + "&STEP_ID=" + stepid + "&delStep=" + Math.random(),
                            cache: false,
                            success: function (sss) {
                                var re = parseInt(sss);
                                if (re <= 0) {
                                    alert("ɾ���ڵ�ʧ�ܣ�");
                                }
                            },
                            error: function (a, b, c) {
                                alert(a);
                            }
                        });
                    } else {
                        $("#divNoUse").append("<div class='step type-" + dataObj.type + "' data=\"{name:'" + dataObj.name + "',id:'" + dataObj.id + "',type:'" + dataObj.type + "'}\"><b>" + dataObj.name + "</b></div>");
                    }
                    if (rowObj.children().length == 1) {
                        rowObj.remove(); SP.reSetRowsObj();
                    } else {
                        stepObj.remove(); SP.initLeft(rowObj, null);
                    }


                } else {
                    alert("ɾ��ʧ�ܣ�");
                }
            },
            error: function (a, b, c) {
                alert(a);
            }
        });
    }


    </script>

    <script type="text/javascript">
    //////////////////*****************
        function checkProc(me) {
           // alert("ssssss");
            //alert("STEPBack.aspx?wfid=" + SP.wfid + "&procid=" + SP.procid + "&checkProc=" + Math.random());
        $.ajax({
            url: "STEPBack.aspx?wfid=" + SP.wfid + "&procid=" + SP.procid + "&checkProc=" + Math.random(),
            cache: false,
            success: function (svrData) {
                alert(svrData);
            },
            error: function (a, b, c) {
                alert(a);
            }
        });
    }

    function cloneProc(me) {
        if (confirm('���ѵ�ǰģ�����õĹ������в������Ƶ�һ���µ�Ӧ�ù��̣��Ժ��ύ�ļ�¼��������¹��̣���ȷ��Ҫ��������')) {
            $.ajax({
                url: "STEPBack.aspx?wfid=" + SP.wfid + "&procid=" + SP.procid + "&cloneProc=" + Math.random(),
                cache: false,
                success: function (svrData) {
                    if (svrData == "ok") {
                        alert("�������̳ɹ���");
                        $(me).parent().parent().prev().find("input").attr("disabled", false);
                    } else if (svrData == "err") {
                        alert("����ʧ�ܣ�");
                    } else {
                        alert(svrData);
                    }
                },
                error: function (a, b, c) {
                    alert(a);
                }
            });
        }
        
    }
    function applyProc(me) {
        if (confirm('���ѵ�ǰ����ģ�����õ����в���Ӧ�õ�����ʹ�õĹ��̣����������¹��̡��������ܻ�Ӱ�����ڴ�������̣�������ʹ�á���ȷ��Ҫ��������')) {
            $.ajax({
                url: "STEPBack.aspx?wfid=" + SP.wfid + "&procid=" + SP.procid + "&applyProc=" + Math.random(),
                cache: false,
                success: function (svrData) {
                    if (svrData == "ok") {
                        alert("�������̳ɹ���");
                    } else if (svrData == "err") {
                        alert("����ʧ�ܣ�");
                    } else {
                        alert(svrData);
                    }
                },
                error: function (a, b, c) {
                    alert(a);
                }
            });
        }
    }

</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div id="divMove"></div>
<div class="main">
    <div class="titnav">
      <dl><dt><b><%=title %></b></dt><dd><a href="../WFINFO/WFINFOManage.aspx">�������̹���</a></dd></dl>
    </div>
    <div class="warn">�������Ϸ��������̣��ڵ��Ϊ��ڵ��·�ɽڵ㣬��ڵ��������˶��������ˣ�·�ɽڵ����ڿ����������򡣹������·���������ÿ����ڵ�� �������Ϣ��<b><asp:Literal ID="litWarn" runat="server"></asp:Literal></b></div>
    <div class="tool">
        <ul>
        <li class="hide"><span><asp:Button ID="btnApplyTo" runat="server" Text="���µ�ʵ�ʹ���" 
                        onclick="btnApplyTo_Click" OnClientClick="return confirm('���ѵ�ǰ����ģ�����õ����в���Ӧ�õ�����ʹ�õĹ��̣����������¹��̡��������ܻ�Ӱ�����ڴ�������̣�������ʹ�á���ȷ��Ҫ��������');" /></span></li>
                <li class="hide"><span><asp:Button ID="btnAddProcess" runat="server" Text="Ӧ�ù��̲���������" 
                        onclick="btnAddProcess_Click" OnClientClick="return confirm('���ѵ�ǰģ�����õĹ������в������Ƶ�һ���µ�Ӧ�ù��̣��Ժ��ύ�ļ�¼��������¹��̣���ȷ��Ҫ��������');" /></span></li>
        <li>
        
        </li>
        <li>
        <span>
            <input id="btnCloneProc" onclick="cloneProc(this);" type="button" value="�����������" title="��Ӱ��ɵ�����;������" /></span>
        </li>
        <li>
        <span>
            <input id="btnCheckProc" onclick="checkProc(this);" type="button" value="��֤����" /></span>
        </li>
        <%-- <li>
        <span>
            <input id="btnLookProc" onclick="lookProc(this);" type="button" value="����Ԥ��" /></span>
        </li>--%>
        </ul>
    </div>

  <div id="divLR">
   <div style="width:100px;" id="shapC">
      <h3>ѡ��Ԫ��</h3>
      <div class="shaps">
         <%--<div class="type-0" data="{type:0}"><b>��ʼ</b></div>--%>
         <div class="type-1" data="{type:1}"><b>�</b></div>
         <div class="type-2" data="{type:2}"><b>·��</b></div>
         <%--<div class="type-3" data="{type:3}"><b>����</b></div>--%>
      </div>
      <h3><a href="#">ȫ�ֱ�������</a></h3>
      <h3>�Ѵ��ڽڵ�</h3>
      <div class="shaps" id="divNoUse">
          <asp:Literal ID="litSteps" runat="server"></asp:Literal>
         <%--<div class="type-0" data="{type:0}"><b>��ʼ</b></div>--%>
         <%--<div class="type-3" data="{type:3}"><b>����</b></div>--%>
      </div>
   </div>
   <div id="divRight">
    <div id="divStepMap">
        <div class="row">
        <div class="step type-0" data="{id:'<%=beginID %>',name:'��ʼ',type:'0'}" style="height:30px;">
            <h2><b><asp:Literal ID="litB" runat="server"></asp:Literal></b></h2>
        </div> 
        </div>

        <asp:Literal ID="litStepMap" runat="server"></asp:Literal>

        <div class="row">
        <div class="step type-3" style="height:30px;" data="{id:'<%=endID %>',name:'����',type:'3'}">
            <h2><b><asp:Literal ID="litE" runat="server"></asp:Literal></b></h2>
        </div>
        </div>

        
    </div>
   </div>
 </div>
 <div class="tool">
 <p>
            <span>
            <input id="Button1" onclick="#" type="button" value="�ݴ����̲ݸ�" runat="server" /></span>
            
            <span>
            <input id="btnApplyProc" onclick="applyProc(this);" type="button" value="�ύ�����¹���" runat="server" /></span>

            </p>
 </div>
 <script type="text/javascript">
    $("#divLR").Layout_LR({jianH: 101 });
 </script>
</div>
</asp:Content>