var fnGetProductType = function (upperProdTypeNo, depth, elementId) {
    $.ajax({
        type: "POST"
        , cache: false
        , url: "/ws/common.asmx/GetProductType"
        , data: {
            "upperProdTypeNo": upperProdTypeNo
        	, "depth": depth
        }
        , async: false
        , dataType: "text" // Debugging을 위해 일단 TEXT로 받는다.
        , success: function (xml, status) {
            if (xml == null || $(xml).find("ResultCd").text() != "00") {
                $("#" + elementId).empty();
            } else {
                fnLoadProductType(xml, elementId);
            }
        }
	    , error: function (xhr, textStatus) {
	        alert("네트워크 오류 또는 요청을 처리할 수 없습니다.");
	    }
	    , complete: function (xhr, textStatus) {
	    }
    });
};

var fnLoadProductType = function (xml, elementId) {
    var xmlDoc = $.parseXML(xml);
    var html = "";
    html += '<option value="">선택</option>';

    $(xmlDoc).find("ProductType").each(function () {
        html += '<option value="' + $(this).find("PROD_TYPE_NO").text() +'">' + $(this).find("PROD_TYPE_NM").text() + '</option>';
    });

    $("#" + elementId).empty();
    $("#" + elementId).append(html);
};