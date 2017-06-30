/**
* 글자수를 Byte로 체크하는 메소드
* @param: id 글자수를 체크할 element의 ID
* @param: limit 제한 글자수(최대 입력 가능한 글자수), 단위(byte)
* @param: letterId 현재 입력 글자수의 element Id
*/
var checkContentLimitByte = function (id, limit, letterId) {
    var cont = $("#" + id).val();
    var len = getStrByte(cont);

    if (len > limit) {
        alert("글자수 제한을 초과 했습니다.");

        // 글자수를 자르고 자른 글자수를 다시 display
        var cont2 = byteSubstring(cont, 0, limit);
        $("#" + id).val(cont2);
        len = getStrByte(cont2);
        $("#" + id).focus();
    }

    $("#" + letterId).html(len);
}

var checkContentLimit = function (id, limit, letterId) {
    var cont = $("#" + id).val();
    var len = cont.length;

    if (len > limit) {
        alert("글자수 제한을 초과 했습니다.");

        // 글자수를 자르고 자른 글자수를 다시 display
        var cont2 = cont.substring(0, limit);
        $("#" + id).val(cont2);
        len = cont2.length;
        $("#" + id).focus();
    }

    $("#" + letterId).html(len);
}

/**
* byte단위 글자수 return
*/
var getStrByte = function (str) {
    var p, len = 0;
    for (p = 0; p < str.length; p++) {
        (str.charCodeAt(p) > 255) ? len += 2 : len++;
    }

    return len;
}

/**
* byte단위로 글자수를 substring함
*/
var byteSubstring = function (str, startIdx, endIdx) {
    var arr = [];
    var b = 0;
    for (var i = 0, m = str.length; i < m; i++) {

        if (str.charCodeAt(i) > 127) {
            arr.push(i);
            arr.push(i);
        } else {
            arr.push(i);
        }

    }
    if (arr[startIdx] == arr[endIdx]) {
        return false;
    } else {
        return str.substring(arr[startIdx], arr[endIdx])
    }
}