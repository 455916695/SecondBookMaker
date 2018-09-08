<%--
  Created by IntelliJ IDEA.
  User: dell3020mt-50
  Date: 2018/5/3
  Time: 18:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>测试</title>
    <!-- 导入jquery核心类库 -->
    <script type="text/javascript"  src="../../../js/jquery-1.8.3.js"></script>
    <link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
    <script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
    <script type="text/javascript" charset="utf-8" src="/js/common.js"></script>
</head>
<body>
    <form id="contentAddForm" action="/upload/file"  class="itemForm" method="post">
        <table cellpadding="3">
            <!-------------    单图片上传的使用         --------------->
            <tr>
                <td>图片:</td>
                <td>
                    <input type="hidden" name="pic" />
                    <a href="javascript:void(0)" class="onePicUpload">图片上传</a>
                </td>
            </tr>

            <!-------------    批量图片上传的使用         --------------->
            <tr>
                <td>商品图片:</td>
                <td>
                    <a href="javascript:void(0)" class="picFileUpload">上传图片</a>
                    <input type="hidden" name="image"/>
                </td>
            </tr>

            <!-------------   完整的富文本编辑器的使用        --------------->
            <tr>
                <td>内容:</td>
                <td>
                    <%--<textarea style="width:800px;height:300px;visibility:hidden;" name="desc"></textarea>--%>
                    <textarea style="width:800px;height:300px;" name="desc"></textarea>
                </td>
            </tr>

        </table>
    </form>
    <div style="padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
    </div>


    <script type="text/javascript">
        var itemAddEditor ;
        //页面初始化完毕后执行此方法
        $(function(){
            //创建富文本编辑器
            itemAddEditor = E3.createEditor("#contentAddForm [name=desc]");
            //初始化类目选择和图片上传器
            E3.init({fun:function(node){

            }});
        });
        //提交表单
        function submitForm(){
            //同步文本框中的商品描述
            itemAddEditor.sync();               //将富文本编辑器中的内容，同步到 textarea

            //调用方法提交表单数据
            $("#contentAddForm").submit();
        }
        /**
         *   清空富文本编辑器中的内容
         */
        function clearForm(){
            $('#itemAddForm').form('reset');
            itemAddEditor.html('');
        }
    </script>

</body>
</html>
