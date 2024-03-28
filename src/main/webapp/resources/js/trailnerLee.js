
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

// $(function(){
//     $(".nav-item a").click(function(){
//         const type = $(this).text()
//         //console.log(type);

//         if(type == '게시글'){
//             const $paging = $('.paging-board');
//             $paging.css('content-visibility', 'visible');
//             // console.log($paging.next())
//             $paging.next().css('content-visibility', 'hidden');



//         } else {
//             const $paging = $('.paging-commnet');
//             $paging.css('content-visibility', 'visible');
//             // console.log($paging.prev())
//             $paging.prev().css('content-visibility', 'hidden');
//         }

//     })

//     $("#boardcontent tr").click(function(){
//         const boardNo = $(this).children(".table-number").text();
//         $("#deletModal").find(".board-data").val(boardNo);  
        
//         $(this).css('border', '3px solid #1abc9cc7');

//         $(this).siblings().css('border', '0');
//         // console.log($(this).siblings());
//         // console.log($(this).siblings('.show'));
       
//         $(this).siblings('.show').removeClass('show');

//     })

//     $("[data-target='#myModal']").click(function(){
//         // console.log(this);
//         // console.log($(this).parents('.collapseitem'));

//         const reportNo =  $(this).parents('.collapseitem').children('input[name=report]').val()
//         // console.log(reportNo);

//         const content =  $(this).parents('.collapseitem').children('textarea[name=content]').val() 
//         // console.log(content);

//         $("#myModal").find("input[name=reportNo]").val(reportNo);
//         $("#myModal").find("input[name=text]").val(content);    


//     })
    
//     // 이동용 모달 
//     $(function(){
//         $(".moving-category>li").click(function(e){
            
//             $(this).css('border', '1px solid #1abc9cc7').css('border-radius', '10px');
           
//             // 제이쿼리에서 선택된 요소를 제외한고 골라준다.
//             $(this).siblings().css('border', '0')
    
//             $("input[name=selectNo]").val($(this).val());
//         })
       
//     })

// })


