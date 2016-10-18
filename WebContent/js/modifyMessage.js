
$(function(){
    select1();
    $('#S1').bind("change", select2);
    $('#S2').bind("change", select3);
    $('#S3').bind("change", select4);
    $('#S4').bind("change", select5);
});

function select1() {
    $.ajax(
    {
        type: "post",
        url: "user.do?method=getposition",
        data: { "type": "province" },
        dataType: "json", 
        success: function (msg) {
            for (var i = 0; i < msg.length; i++) {
                $("#S1").append("<option value=" + msg[i].ProvinceID + ">" + msg[i].ProvinceName + "</option>");
            }
            if(news_province!=null||news_province!=''){
            	  $("#S1").val(news_province);
            }
            select2();
        }
    });
};
function select2() {
    $("#S2").html("");
    $.ajax(
    {
        type: "post",
        url: "user.do?method=getposition",
        data: { "type": "city","provinceID":$('#S1').attr("value") },
        dataType: "json", 
        success: function (msg) {
            for (var i = 0; i < msg.length; i++) {
                $("#S2").append("<option value=" + msg[i].CityID + ">" + msg[i].CityName + "</option>");
            }
            if(news_city!=null||news_city!=''){
          	  $("#S2").val(news_city);
          }
            select3();
        }
    });
};

function select3() {
    $("#S3").html("");
    $.ajax(
    {
        type: "post",
        url: "user.do?method=getposition",
        data: { "type": "county","cityID":$('#S2').attr("value") },
        dataType: "json", 
        success: function (msg) {
            for (var i = 0; i < msg.length; i++) {
                $("#S3").append("<option value=" + msg[i].county_id + ">" + msg[i].county_name + "</option>");
            }
            if(news_county!=null||news_county!=''){
            	  $("#S3").val(news_county);
            }
            select4();
        }
    });
};
function select4() {
    $("#S4").html("");
    $.ajax(
    {
        type: "post",
        url: "user.do?method=getposition",
        data: { "type": "town","countyID":$('#S3').attr("value") },
        dataType: "json", 
        success: function (msg) {
            for (var i = 0; i < msg.length; i++) {
                $("#S4").append("<option value=" + msg[i].town_id + ">" + msg[i].town_name + "</option>");
            }
            if(news_town!=null||news_town!=''){
          	  $("#S4").val(news_town);
          }
            select5();
        }
    });
};
function select5() {
    $("#S5").html("");
    $.ajax(
    {
        type: "post",
        url: "user.do?method=getposition",
        data: { "type": "village","townID":$('#S4').attr("value") },
        dataType: "json", 
        success: function (msg) {
            for (var i = 0; i < msg.length; i++) {
                $("#S5").append("<option value=" + msg[i].village_id + ">" + msg[i].village_name + "</option>");
            }
            if(news_village!=null||news_village!=''){
            	  $("#S5").val(news_village);
            }
        }
    });
};

