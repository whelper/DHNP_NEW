/*파일 등록관련 */
var attachecategory = {
	params : {
		
	},

	init : function(p) {
		var self = this;
		
		if(p){
			$.each( p, function(key,value){
				self.params[key] = value;
			}); 
        }

		if(self.params.tags){ //add event tags
			$.each(self.params.tags,function(index,value){
				$("#"+value+"_view li").click(function(){
					$(this).remove();
				});
			});
        }

        self.getCategory(); //제품 수정시
		
		$(".add-cate").click(function(){
			var parent_id = $(this).attr("data-parent-id");
            var tag = $(this).attr("data-tag");
            var lang_cd = $(this).attr("data-langcd");
			self.params['tag'] = tag;
			var offset = $(this).offset();
           
            $.ajax({
                type: "POST",
                url: "/ws/common.asmx/GetCategory",
                dataType: "xml",
                data: "lang_cd=" + lang_cd +"&parent_id=" + parent_id,
                success: function (data) {
                    $xml = $(data);
                    //alert($xml.find("ResultCd").text());
                    var str_op = "";
                    var cate_cd = "";
                    var cate_name = "";
                    $xml.find("Category").each(function (i) {
                        cate_cd = "";
                        cate_name = "";
                        if (!parent_id) {
                            if ($xml.find("PARENT_NO").eq(i).text() == "0") {
                                cate_cd = $xml.find("CATE_CD").eq(i).text();
                                cate_name = $xml.find("CATE_NAME").eq(i).text();
                            }
                        } else {
                            cate_cd = $xml.find("CATE_CD").eq(i).text();
                            cate_name = $xml.find("CATE_NAME").eq(i).text();
                        }

                        if (cate_cd && cate_name) {
                            str_op += "<option value=\"" + cate_cd + "\">" + cate_name + "</option>";
                        }
                    });
                    var str = "";
                    str += "<div id=\"category-controller\">";
                    str += "	<div class=\"box\">";
                    str += "		<div class=\"category-close\">X</div>";
                    str += "		<select name=\"cate[]\" multiple class=\"select-category\">";
                    str += str_op;
                    str += "		</select>";
                    str += "		<select name=\"cate[]\" multiple class=\"select-category\"></select>";
                    str += "		<select name=\"cate[]\" multiple class=\"select-category\"></select>";
                    str += "		<select name=\"cate[]\" multiple class=\"select-category\"></select>";
                    str += "		<button class=\"btn btn-warning\" onclick=\"javascript: attachecategory.addCategory();\">추 가</button>";
                    str += "	</div>";
                    str += "</div>";
                   
                    $("#category-controller").detach();
                    $(".forms").append(str);
                    $("#category-controller").css("top", offset.top - 237);
                    
                    $(".category-close").click(function () {
                        $("#category-controller").detach();
                    });

                    //event select box begin
                    $('[name="cate[]"]').change(function () {
                        var index = $('[name="cate[]"]').index($(this));
                        $.ajax({
                            type: "GET",
                            url: "/ws/common.asmx/GetChildCategory",
                            data: "lang_cd=" + lang_cd +"&category=" + $(this).val(),
                            success: function (data) {
                                $xml = $(data);
                                //초기화
                                $('[name="cate[]"]').each(function (idx) {
                                    if (idx > index) {
                                        $(this).empty();
                                    }
                                });

                                if($xml.find("ResultCd").text() != "00") return;
                                var cate_cd = "";
                                var cate_name = "";
                                $xml.find("Category").each(function (i) {
                                    cate_cd = $xml.find("CATE_CD").eq(i).text();
                                    cate_name = $xml.find("CATE_NAME").eq(i).text();
                                    $('[name="cate[]"]').eq(index + 1).get(0).options[i] = new Option(cate_name, cate_cd);
                                });

                                /*for (var i = 0; i < prefix.category.length; i++) {
                                    $('[name="cate[]"]').eq(index + 1).get(0).options[i] = new Option(prefix.category_name[i], prefix.category[i]);
                                }*/
                            },
                            error: function (error) { alert('에러'); }
                        });
                    });
					//event select box end

                },
                error: function (error) { alert('에러'); }
            });	
        });
	},
    getCategory: function () {
        var self = this;
        if (!self.params.prod_cd) return;
        var lang_cd = $(".add-cate").attr("data-langcd");
        $.ajax({
            type: "GET",
            url: "/ws/common.asmx/GetProdCategory",
            data: "lang_cd=" + lang_cd + "&prod_cd=" + this.params.prod_cd,
            success: function (data) {
                $xml = $(data);

                if ($xml.find("ResultCd").text() != "00") return;
                var cate_cd = "";
                var cate_name = "";
                var full_depth_name = "";
                var li = "";
                $xml.find("Category").each(function (i) {
                    cate_cd = $xml.find("CATE_CD").eq(i).text();
                    cate_name = $xml.find("CATE_NAME").eq(i).text();
                    full_depth_name = $xml.find("FULL_DEPTH_NAME").eq(i).text();
                    
                    li += '<li cate="' + cate_cd + '">' + full_depth_name+' <a href="javascript:void(0)" class="glyphicon glyphicon-remove" title="삭제">x</a></li>';
                });
               

                $("#" + self.params.tags + "_view").append(li);
                $.each(self.params.tags, function (index, value) {
                    $("#" + value + "_view li").click(function () {
                        $(this).remove();
                    });
                });

            },
            error: function (error) { alert('에러'); }
        });
    },
	
	addCategory : function(){ //카테고리 더하기
		var txt="";
		var cate = "";
		$('[name="cate[]"] option:selected').each(function(idx){
			txt += (txt) ? " &gt; "+$(this).text() : $(this).text(); 
			
			cate = $(this).val();
		});
		li = '<li cate="'+cate+'">'+txt+' <a href="javascript:void(0)" class="glyphicon glyphicon-remove" title="삭제">x</a></li>';

		$("#"+this.params.tag+"_view").append(li);
		$("#category-controller").detach();

		$("#"+this.params.tag+"_view li").click(function(){
			$(this).remove();
		});
	}

}