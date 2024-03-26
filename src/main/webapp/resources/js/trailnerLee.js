
$(function(){
    $('#accusation').click(function(){
        const $div = $(this).next();
        console.log($div);
        
        if($div.css('display') == 'none'){
            $div.slideDown(200);
            $('#accusation').css("background", 'rgba(26, 188, 156, 0.2)');
            
        } else {
            $div.slideUp(200);
            $('#accusation').css("background", 'white');
        }
    })
})

// 미리보기 스크립트문
function pictureFile(index){
    $(".picture"+index).click();
}

function imaging(index){
    const file = window.event.target.files[0];
    console.log(window.event.target.files[0] != null);
    console.log(file);

    if(file != null){
        const read = new FileReader();

        read.readAsDataURL(file);

        read.onload = function(e){
            console.log(".img"+index)
            $(".img"+index).css("background-image", 'url('+ e.target.result +')');
            $(".img"+index).text("");
        }
    } else {
        $(".img"+index).css("background-image", 'none');
    }
}


// report

$(function(){
    $(".nav-item a").click(function(){
        const type = $(this).text()
        //console.log(type);

        if(type == '게시글'){
            const $paging = $('.paging-board');
            $paging.css('content-visibility', 'visible');
            // console.log($paging.next())
            $paging.next().css('content-visibility', 'hidden');



        } else {
            const $paging = $('.paging-commnet');
            $paging.css('content-visibility', 'visible');
            // console.log($paging.prev())
            $paging.prev().css('content-visibility', 'hidden');
        }

    })

    $("#boardcontent tr").click(function(){
        const boardNo = $(this).children(".table-number").text();
        $("#deletModal").find(".board-data").val(boardNo);  
        
        $(this).css('border', '3px solid #1abc9cc7');

        $(this).siblings().css('border', '0');
        // console.log($(this).siblings());
        // console.log($(this).siblings('.show'));
       
        $(this).siblings('.show').removeClass('show');

    })

    // 키보드 값을 입력 받을떄 해당 위치의 collapse 등장
    $(function(){
        $(document).keypress(function(e){
            // console.log($("#boardcontent tr")); 
            // console.log(e.key); 
            // console.log(Number(e.key) * 2); 
            // console.log($("#boardcontent tr").eq(Number(e.key) * 2));
            const val = e.key;
            let $t = null;
            if(val != 0){
                $t = $("#boardcontent tr").eq(Number(val) * 2);   
            } else if (val == 0){
                $t = $("#boardcontent tr").eq(20);
            }

            $t.css('border', '3px solid #1abc9cc7');
                $t.addClass('show');

                $t.siblings().css('border', '0');
                $t.siblings('.show').removeClass('show');

        }) 
                
    })



    $(".type1").click(function(){
        const $form = $(this).parents('form');
        // console.log($form);
        const reportNo = $form.find('input[name=report]').val();
        // console.log(reportNo);
        const text = $form.find('textarea[name=content]').val();
        // console.log(text);
        const typeCheck = $form.find('input[name=typeCheck]').val();
        // console.log(typeCheck);

        const str = '<%=mzymPath%>/reportRequest.trainer?reportNo=' + reportNo + '&text='+ text +'&typeCheck=' + typeCheck +'&cate=' + <%=categoryNum%> + '&type=1';
        // console.log(str);
       location.href = str;
        // 화면이 안 넘어 갈떄는 sumbit이 두번 요청 되고 있는지 확인 button이 submit타입이라서 두번 요청 될 수 있음
    })

    $(".type2").click(function(){
        const $form = $(this).parents('form');
        // console.log($form);
        const reportNo = $form.find('input[name=report]').val();
        // console.log(reportNo);
        const text = $form.find('textarea[name=content]').val();
        // console.log(text);
        const typeCheck = $form.find('input[name=typeCheck]').val();
        // console.log(typeCheck);

        const str = '<%=mzymPath%>/reportRequest.trainer?reportNo=' + reportNo + '&text='+ text +'&typeCheck=' + typeCheck +'&cate=' + <%=categoryNum%> + '&type=2';
        // console.log(str);
       location.href = str;
    })
    

    $("[data-target='#myModal']").click(function(){
        // console.log(this);
        // console.log($(this).parents('.collapseitem'));

        const reportNo =  $(this).parents('.collapseitem').children('input[name=report]').val()
        // console.log(reportNo);

        const content =  $(this).parents('.collapseitem').children('textarea[name=content]').val() 
        // console.log(content);

        $("#myModal").find("input[name=reportNo]").val(reportNo);
        $("#myModal").find("input[name=text]").val(content);    


    })


})

// 이동용 모달 
$(function(){
    $(".moving-category>li").click(function(e){
        
        $(this).css('border', '1px solid #1abc9cc7').css('border-radius', '10px');
       
        // 제이쿼리에서 선택된 요소를 제외한고 골라준다.
        $(this).siblings().css('border', '0')

        $("input[name=selectNo]").val($(this).val());
    })
   
})
