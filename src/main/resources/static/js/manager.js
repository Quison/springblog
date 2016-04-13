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
$("#newPost").click(function() {
    editor.setValue("# 请输入标题...\r\n<mark class=\"label label-primary\">标签</mark>\r\n\r\n---\r\n\r\n");
    $("#postId").val(0);
});

// 获取标签细节
$("#getTagDetails").click(function() {
    $("#tagDetails").toggle();
});

$("#getPostArchives").click(function() {
    $("#postArchives").toggle();
});

$("#createPost").click(function() {
	var preview = $("#preview");
	var title = preview.find('h1').html();
    var tags = [];
    preview.find('mark').each(function(){
    	tags.push($(this).html());
    });
    var authors = [1,2];
    var content = editor.getValue();
    var renderContent = preview.html();
    
    var postCreateInfo = {
    	"title": title,
    	"content": content,
    	"renderContent": renderContent,
    	"tags": tags,
    	"authors": authors
    };
    
    $.ajaxSettings.traditional = true;
    
    $.post("/post/create", postCreateInfo);
    
});
