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
    var getTagDetails = $("#getTagDetails");

    $.ajax("/getTagDetails",{
        dataType: 'json'
    }).done(function(data) {
        var tagDetails = data.tagDetails;
        $("#tags").children().remove();
        getTagDetails.after('<ul id="tags"></ul>');
        var tags = $("#tags");
        $.each(tagDetails,function(i, item) {
            console.log(item);
            tags.append('<li id="li' + i + '"><a href="#" >' + item.tagName + '(' + item.postCountOfTag + ')</a></li>');
        });

        for(var i=0; i<tagDetails.length; i++) {
            $("#li"+i).append('<ul id="tag'+i+'"></ul>');
            var posts = tagDetails[i].postsOfTag;
            for(var key in posts){
                $("#tag"+i).append('<li><a href="#" >' + posts[key].title + '</a></li>');
            }
        }
    });
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
    var content = editor.getValue();
    var renderContent = preview.html();

    var postCreateInfo = {
    	"title": title,
    	"content": content,
    	"renderContent": renderContent,
    	"tags": tags,
    };

    $.ajaxSettings.traditional = true;

    $.post("/post/create", postCreateInfo);

});
