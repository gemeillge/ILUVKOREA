const state = { //뭔지 잘몰라도 이게 제일중요(?)
        page :1,
        perPage:10,
        search:0,
        keyword:"",
        order: "", //pager값을 얻기위해(?)
        orderMode: 0,			
    };

const header = []; 

//const primaryKey = "code";

    function makeItem(data_){
        const tr =$("<tr>");
        
        tr.attr("data-code",data_[key]); // data_.code => data_["code"] 가능 const key = "code"; => data_[key]
        
        const input = $("<input>");
        input.attr("type","checkbox");
        input.addClass("form-check-input item-check"); //2개의 클래스 form태그가없어서 
        input.val(data_[key]); //속성
        tr.append($("<td>").append(input) ); //위에서 만든 td를 append 이걸 또 tr에 append
        
        header.forEach(item => tr.append($("<td>").text(data_[item]).addClass(item)));
		//이거 한줄로 밑에게 된다고?
       // tr.append($("<td>").text(data_.code).addClass("code") );
       // tr.append($("<td>").text(data_.title).addClass("title") );
       // tr.append($("<td>").text(data_.startDate).addClass("startDate") );
       // tr.append($("<td>").text(data_.endDate).addClass("endDate") );
        
        const td = $("<td>");
        td.append($("<button>").addClass("delete btn btn-sm btn-danger mx-1").append($("<i>").addClass("bi bi-trash")));
        td.append($("<button>").addClass("update btn btn-sn btn-warning mx-2").append($("<i>").addClass("bi bi-check2-square")));
        
        
        tr.append(td);
        
        return tr;
    }
    function movePage(page){
        state.page = page;
        
        $.ajax(url,{
            method:"GET",
            contentType:"application/json", // 클라이언트 에서 서버로
            dataType: "JSON",				//서버에서 클라이언트로
            data:state, //JSON,stringify(state),
            success: (data_,status_) => {
                const list = data_.list;
                
                state.total = data_.pager.total;
                $("#total").text(state.total);
                
				$("th i").remove();
                if(data_.pager.orderMode != 0){
                    const th = $(`th[data-order='${data_.pager.order}']`);
                    const icon = $("<i>");
                    if(data_.pager.orderMode == 1)
                        icon.addClass("bi bi-caret-up");
                    else
                        icon.addClass("bi bi-caret-down");
                    
                    th.append(icon);
                }
                
                const tbody = $("<tbody>");
                
                for(let i=0; i < list.length;i++){
                    const tr= makeItem(list[i]);
                    
                    tbody.append(tr);
                    
                }				
                
                $("tbody").remove();
                $("table").append(tbody);
                
                $("#page-prev").data("page",data_.pager.prev);
                $("#page-next").data("page",data_.pager.next);
                $("#page-last").data("page",data_.pager.last);
                
                $(".page-list").remove();
                const pageList = data_.pager.list;
                for(let i=0;i < pageList.length; i++){
                    //<div class="page-item"> <p class="page-link">1</p></div>
                    const div = $("<div>").addClass("page-item");
                    div.addClass("page-list");
                    if(data_.pager.page == pageList[i]) //현재 페이지면 active속성으로 파란색으로
                        div.addClass("active");
                    
                    const p = $("<p>");
                    p.addClass("page-link");
                    p.text(pageList[i]);
                    p.attr("data-page",pageList[i]);

                    div.append(p);
                    
                    $("#page-next").parent().before(div);
                }
            },
            error: (jqxhr_,status_,error_) => {
                console.log(error_);
            }
        });
    }
    
    $(function(){
		$("th.order").each((index,item) => { //이짓을 한것은 그리드 컴포넌트 싱글페이지 SPO를 한거다. 
			header.push($(item).data("name"));
		});
	
        $(".order").click(function(){
            if(state.order == $(this).data("order"))
                state.orderMode = ++state.orderMode % 3;
            else{
                state.order = $(this).data("order");
                state.orderMode = 1;
            }
        //state.order = $(this).data("order");  뭐로 정렬할지 나온다
        //state.orderMode = ++state.orderMode % 3; state값은 잘 전달됬으니(?)
  
            movePage(1);  //1페이지로 이동해야한다(?)
            
        });
        
        $("#delete_list").click(function(){				
            const list= $(".item-check:checked").get();
    
            const selected = list.map(item=> item.value); //배열이라 map. 또다른 배열로 만든다
            $.ajax(url,{
                method:"DELETE",
                contentType:"application/json",
                dataType:"JSON",
                data:JSON.stringify(selected),
                success:(data_,status) => {
                    movePage(state.page);
                }
            });
            
        });
        //[] 속성선택자, 자손선택자, 태그선택자 등등
        $("thead input[type='checkbox']").on("change",function(){
            const checked = $(this).prop("checked");
            
            $(".item-check").prop("checked",checked);
        });
        
        $("#search_button").click(function(){
            const search = $("#search").val();
            
            if(search == 0){
                alert("검색항목을 먼저 선택해주세요");
                return;
            }
            
            const keyword = $("#keyword").val();
            
            if(keyword == ""){
                alert("검색어를 입력해 주세요");
                $("#keyword").focus();
                return;
            }
            
            
            state.search = search;
            state.keyword = keyword;
            
            movePage(1);
        });
        
        $("#perPage").on("change",function(){
            const perPage = $(this).val();
            
            state.perPage = perPage;
            movePage(1);
        });
                    
        $(".pagination").on("click",".page-link",function(){
            const page=$(this).data("page");
            movePage(page);
        });

        
        $("#updateModal .update").click(function(){
            let item_={};
			/*
                code:$("#updateModal .code").val(),
                title:$("#updateModal .title").val(),
                startDate:$("#updateModal .startDate").val(),
                endDate:$("#updateModal .endDate").val(),
            };*/
            
			header.forEach(value => item_[value] = $(`#updateModal .${value}`).val());

            $.ajax(url,{
                method:"PUT",
                data:JSON.stringify(item_),
                contentType:"application/json",
                dataType:"JSON",
                success:function(data_) {
					header.forEach(item => $(`tr[data-code='${data_[key]}'] .${item}`).text(data_[item]));
					//띄어쓰기 주의! 선택자를 2개써야하는데 띄어쓰기하면 DB에는들어가지만 html에는 이상하게 나온다
					/*
                    $("tr[data-code='" + data_code +"'].code").text(data_.code);
                    $("tr[data-code='" + data_code +"'].title").text(data_.title);
                    $("tr[data-code='" + data_code +"'].startDate").text(data_.startDate);
                    $("tr[data-code='" + data_code +"'].endDate").text(data_.endDate);
					*/
                }
            });
            $("#updateModal").modal("hide");
        });
        
        
        $("table").on("click",".update",function(){
			/*
            let item_={
                    code:$(this).parent().siblings(".code").text(),
                    title:$(this).parent().siblings(".title").text(),
                    startDate:$(this).parent().siblings(".startDate").text(),
                    endDate:$(this).parent().siblings(".endDate").text()
            };

            $("#updateModal .code").val(item_.code);
            $("#updateModal .title").val(item_.title);
            $("#updateModal .startDate").val(item_.startDate);
            $("#updateModal .endDate").val(item_.endDate);
            */

			header.forEach(item => { //parent(td)의 sibling(형제들)의 item(속성)값을 읽어서 updateModal에 value값으로 넣는다
				const value =$(this).parent().siblings(`.${item}`).text();
				$(`#updateModal .${item}`).val(value);
			});
			
            $("#updateModal").modal("show");
            
        });
    
    
    $("#addModal .add").click(function(){ //{}는 객체선언
        const item_ = {}; 

		/*{
            title : $("#addModal .title").val(),
            startDate: $("#addModal .startDate").val() ,
            endDate : $("#addModal .endDate").val()
        };*/
        header.forEach(value => {
			if(value != key)
				item_[value] = $(`#addModal .${value}`).val()
		});
			
        $.ajax("url",{
            method :"POST",
            data: JSON.stringify(item_),
            contentType :"application/json", // 클라이언트 에서 서버로
            dataType : "JSON",
            success:function (data_){
                const tr= makeItem(data_);
                
                $("tbody").append(tr);
                
                $("#total").text(++state.total);
            }
        });
        
        $("#addModal").modal("hide");
    });
    
    $("table").on("click","button.delete",(function(){//버튼이면서 delete를 가지고 있으면 .어쩌꼬로 적는다
        const code_ = $(this).parent().parent().data(key);
        $.ajax(url + "/" + code_,{
            method : "DELETE",
            contentType :"application/json", // 클라이언트 에서 서버로
            dataType : "JSON",
            success : (data_,status_) => {
                if(code_ === data_){ // == 는 같음(상식이죠?) === 같다(타입까지 일치한다)
                    $("tr[data-code='" + code_+"']").remove();
                    $("#total").text(--state.total);
                }
            }		
        });
    }));
    movePage(1);
});