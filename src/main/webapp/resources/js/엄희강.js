
    //사이드바 스크롤 이벤트
    $(document).ready(function(){
        var sidebar = $(".sidebar");
        var footerBottom = $(".sidebarEnd").offset().top + $(".sidebarEnd").outerHeight(); 
       
        
        $(window).scroll(function() {
            var position = $(window).scrollTop();
            var windowHeight = $(window).height();
            
            var mainContentOffset = $(".main_content").offset().top;
            var sidebarHeight = sidebar.outerHeight();
            var endOffset = footerBottom - sidebarHeight - 20; 
        
            if (position >= mainContentOffset && position + windowHeight < endOffset) {
                sidebar.stop().animate({"top": position + "px"}, 600);
            } else if (position + windowHeight >= endOffset) {
                sidebar.stop().animate({"top": endOffset - sidebarHeight + "px"}, 600);
            } else {
                sidebar.stop().animate({"top": mainContentOffset + "px"}, 600);
            }
        });
    });



    //사이드바 클릭 이벤트 
    function scrollToTop() {
        window.scrollTo(0, 0);
    }
    function scrollToBottom() {
        window.scrollTo(0,document.body.scrollHeight);

    }

    //메인 메뉴 호버 스크립트 
    function showTable() {
        var mune = document.getElementById("menu1");
        mune.style.display = "table"; 
      }
    
      function hideTable() {
        var mune = document.getElementById("menu1");
        mune.style.display = "none"; 
      }
      function showTable1() {
        var mune = document.getElementById("menu2");
        mune.style.display = "table"; 
      }
    
      function hideTable1() {
        var mune = document.getElementById("menu2");
        mune.style.display = "none"; 
      }

    