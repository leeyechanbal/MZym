$(function(){
    $('#board').click(function(){
            const $div = $(this).next();

            if($div.css('display') == 'none'){
                $div.slideDown(200);
                $('#board').css('background', 'rgba(26, 188, 156, 0.2)');
            } else {
                $div.slideUp(200);
                $('#board').css('background', 'white');
            }

        })
    })

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

