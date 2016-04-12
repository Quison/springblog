'use strict';

// 全局变量
var editor = ace.edit("editor");

$(function() {
    editor.setTheme("ace/theme/monokai");
    editor.getSession().setMode("ace/mode/markdown");
    $("#editor").bind("DOMSubtreeModified", function(){
        $("#preview").html(marked(editor.getValue()));
    });
});

// 创建新的文章
$("#createNewPost").click(function() {
    editor.setValue("# 请输入标题...\r\ntags : 输入标签... \r\n\r\n---\r\n\r\n");
    $("#postId").val(0);
});

// 获取标签细节
$("#getTagDetails").click(function() {
    var getTagDetails = $.ajax('/manager/getAllTagDetail', {
        dataType: 'json'
    }).done(function(data) {
        dealWithTagDetails(data);
    }).fail(function(xhr, status) {
        alert("失败！" + xhr.status);
    });
})

function dealWithTagDetails(data) {
    alert("处理函数");
    var tagDetails = JSON.parse(data).tagDetails;

     for(var tagDetail in tagDetails) {
         console.log(tagDetail);
//         var ul = $("#tagDetails");
//         ul.append('<li><a href="#">' + tagDetail.tagName + "(" + tagDetail.postCountOfTag + ")</a></li>");
     }
}
