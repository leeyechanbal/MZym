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