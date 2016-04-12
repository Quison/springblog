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
    	var ul = $("#tagDetails");
    	$.each(data.tagDetails, function(i, item){
            ul.append('<li><a href="#">' + item.tagName + '(' + item.postCountOfTag + ')</a></li>');
    	});
    	
    }).fail(function(xhr, status) {
        alert("失败！" + xhr.status);
    });
})

