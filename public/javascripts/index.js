let indexVariable = {
    nav_html: '<ul class="sidebar-menu">'
};
(function(){
    // const wrap = document.getElementById('wrap');
    // let inLenght = wrap.children.length;
    // wrap.style.setProperty('--n',inLenght);
}());

$(function () {
    // 获取导航菜单
    // submitGet('/practise1/sys/menu/nav', function (data) {
    //     if (data.code !== 0) {
    //         menuTraversal([]);
    //     } else {
    //         menuTraversal(data.menuList);
    //     }
    // });
});

function menuTraversal (menuList) {
   var menuNav = document.getElementById('menu-nav');
   dynamicAddMenu(menuList, menuList[0]);
   $(menuNav).html(indexVariable.nav_html);
   // 添加动态效果
   $.sidebarMenu($('.sidebar-menu'));
}

// 动态遍历侧边栏
function dynamicAddMenu (menuList, menu) {
    if (menuList) {
        for (let num = 0; num < menuList.length; num++) {
            if (menuList[num].parentId == 0) {
                indexVariable.nav_html += `<li class="treeview">
                      <a href="#" id="${menuList[num].menuId}">
                        <i class="fa fa-dashboard"></i> <span>${menuList[num].name}</span> <i class="fa fa-angle-right pull-right"></i>
                      </a>`;
            } else {
                indexVariable.nav_html += `<li><a href="${menuList[num].url}" id="${menuList[num].menuId}" target="_blank"><i class="fa fa-circle-o"></i>${menuList[num].name}</a>`;
            }
            if (menuList[num].list && menuList[num].list.length >= 1) {
                indexVariable.nav_html += '<ul class="treeview-menu">';
            }
            dynamicAddMenu (menuList[num].list, menuList[num]);
        }
        indexVariable.nav_html += '</ul>';
    } else {
        indexVariable.nav_html += '</li>';
    }
}






