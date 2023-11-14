//折叠菜单效果
$(function () {
    var Accordion = function (el, multiple) {
        this.el = el || {};
        this.multiple = multiple || false;

        var links = this.el.find('.link');

        links.on('click', {el: this.el, multiple: this.multiple}, this.dropdown)
    }

    Accordion.prototype.dropdown = function (e) {
        var $el = e.data.el;
        $this = $(this),
            $next = $this.next();

        $next.slideToggle();
        $this.parent().toggleClass('open');

        if (!e.data.multiple) {
            $el.find('.submenu').not($next).slideUp().parent().removeClass('open');
        }
        ;
    }

    var accordion = new Accordion($('#accordion'), false);
});

//管理菜单切换
$(function () {
    // 首页分类切换
    $('.option_list li').click(function () {
        var clickCid = $(this).attr('data-cid')
        $('.option_list li').each(function () {
            $(this).removeClass('active')
        })
        $(this).addClass('active')

        if (clickCid != currentCid) {
            // 记录当前分类id
            currentCid = clickCid

            // 重置分页参数
            cur_page = 1
            total_page = 1
            updateNewsData()
        }
    })
})

function addNews() {
    var result = document.getElementById("result");
    var show ="<iframe src='add_news.jsp' frameborder='0' name='main_frame' class='main_frame' id='main_frame' style='width:100%; height: 100%;'></iframe>";
    result.innerHTML = show;
}

function deleteNews_list() {
    var result = document.getElementById("result");
    var show ="<iframe src='dnews_list.jsp' frameborder='0' name='main_frame' class='main_frame' id='main_frame' style='width:100%; height: 100%;'></iframe>";
    result.innerHTML = show;
}

function deleteNews_id() {
    var result = document.getElementById("result");
    var show ="<iframe src='dnews_id.jsp' frameborder='0' name='main_frame' class='main_frame' id='main_frame' style='width:100%; height: 100%;'></iframe>";
    result.innerHTML = show;
}