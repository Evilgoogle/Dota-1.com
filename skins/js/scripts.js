function show_info(type ,info) {
    var disp = $('#disp');
    if(type == 'ok') {
        $('#disp_info').text(info);
        $('#disp_close').css('background-image','url(/skins/img/disp_ok.png)');
        disp.css('display','block');
    } else if(type == 'error') {
        $('#disp_info').text(info);
        $('#disp_close').css('background-image','url(/skins/img/disp_error.png)');
        disp.css('display','block');
    }
}
function cls() {
    $('#disp').css('display','none');
    $('#disp_info').text('');
}

function dota_dropdown(id) {
    if($('#drop_container'+id).hasClass('drop_container')) {
        $('#drop_container'+id).removeClass('drop_container');
        $('#drop_container'+id).addClass('drop_container_active');
    } else if($('#drop_container'+id).hasClass('drop_container_active')){
        $('#drop_container'+id).removeClass('drop_container_active');
        $('#drop_container'+id).addClass('drop_container');
    }
    if($('#dota_dropdown'+id).hasClass('dota_dropdown_off')) {
        $('#dota_dropdown'+id).removeClass('dota_dropdown_off');
        $('#dota_dropdown'+id).addClass('dota_dropdown_on');
    } else if($('#dota_dropdown'+id).hasClass('dota_dropdown_on')){
        $('#dota_dropdown'+id).removeClass('dota_dropdown_on');
        $('#dota_dropdown'+id).addClass('dota_dropdown_off');
    }
}

function users_dropdown(id) {
    if(id == 'off') {
        if($('#users_dropcontainer').css('height') == '0px') {
            $('#users_dropcontainer').css('height', '830px');
            $('#users').css('margin-top', '0px');
        } else if($('#users_dropcontainer').css('height') == '830px') {
            $('#users_dropcontainer').css('height', '0px');
            $('#users').css('margin-top', '-830px');
        }
    } else if(id == 'on') {
        if($('#users_dropcontainer').css('height') == '0px') {
            $('#users_dropcontainer').css('height', '830px');
            $('#users').css('margin-top', '0px');
        } else if($('#users_dropcontainer').css('height') == '830px') {
            $('#users_dropcontainer').css('height', '0px');
            $('#users').css('margin-top', '-830px');
        }
    }
}

view_system_active = 0;
view_system_click = 'list';
view_system_click_magazine = 'cells_magazine';
function view_system(view, data, module_id, module_name, template_id, cat, dota_cat, gal) {
    var data_list = $('[data-skin_list'+template_id+']');
    var data_cells = $('[data-skin_cells'+template_id+']');
    var data_grid = $('[data-skin_grid'+template_id+']');

    $('#table_default'+template_id).remove();
    if(gal !== undefined) {
        var gal_decode = JSON.parse(gal);
    } else {
        var gal_decode = cat;
    }

    if(view == 'list') {
        view_system_click = 'list';
        if(view_system_active == 0) {
            var enter = 'open'
        }
        view_system_active = 1;

        if(data_cells.length != 0) {
            data_cells.remove();
        }
        if(data_grid.length != 0) {
            data_grid.remove();
        }
        if (data_list.length == 0 || enter == 'open') {
            enter = 'close';
            for (var key in data) {
                var table_list = $('<div>', { class: 'table_list' }).appendTo($('#table_create' + template_id));
                table_list.attr('data-skin_list'+template_id, '');

                if(cat == 'admin' || cat == 'supermoderator') {
                    $('<input>', {type: 'checkbox', name: 'ids[]', value: '' + data[key].id + ''}).appendTo(table_list);
                }
                if(cat == 'admin' || cat == 'supermoderator' || cat == 'moderator') {
                    var a = $('<a>', {
                        href: '/' + module_name + '/edit?module_name='+module_name+'&id=' + data[key].id + '&module_id=' + module_id + '&template_id=' + template_id + '&template=table',
                        class: 'btn btn-primary'
                    }).appendTo(table_list);
                    var span = $('<span>', {class: 'glyphicon glyphicon-edit'}).appendTo(a);
                    span.attr('aria-hidden', 'true');
                }
                table_list.append('' +
                    '<div class="table_block_list">' +
                    '<div class="temp_table">' +
                    '<div class="tree1"></div>' +
                    '<div class="tree2"></div>' +
                    '<div class="img"></div>' +
                    '<div class="death_knight"></div>' +
                    '<div class="block">' +
                    '<div class="left">' +
                    '<img src="' + data[key].preview + '" alt="' + data[key].name + '">' +
                    '</div>' +
                    '<div class="rigth">' +
                    '<a class="header" href="/' + module_name + '/view?id=' + data[key].id + '&template=' + template_id + '">' + data[key].name + '</a>' +
                    '<div class="text">' + data[key].des + '</div>' +
                    '<div class="addition">' +
                    '<div class="block_date_view">'+
                    '<div class="block_date">' +
                    '<div class="date"></div>' +
                    '<div class="text1">' + data[key].date + '</div>' +
                    '</div>' +
                    '<div class="block_view">' +
                    '<div class="view"></div>' +
                    '<div class="text2">18</div>' +
                    '</div>' +
                    '</div>' +
                    '<a href="/' + module_name + '/view?id=' + data[key].id + '&template=' + template_id + '" class="button">Подробнее</a>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '');
            }
        }
    } else if(view == 'cells') {
        view_system_click = 'cells';
        if(view_system_active == 0) {
            var enter = 'open'
        }
        view_system_active = 1;

        if(data_list.length != 0) {
            data_list.remove();
        }
        if(data_grid.length != 0) {
            data_grid.remove();
        }
        if(data_cells.length == 0 || enter == 'open') {
            enter = 'close';
            for (var key in data) {
                var table_cells = $('<div>', { class: 'table_cells' }).appendTo($('#table_create' + template_id));
                table_cells.attr('data-skin_cells'+template_id, '');
                var table_block_cells = $('<div>', { class: 'table_block_cells' }).appendTo(table_cells);

                if(cat == 'admin' || cat == 'supermoderator') {
                    $('<input>', {type: 'checkbox', name: 'ids[]', value: '' + data[key].id + ''}).appendTo(table_block_cells);
                }
                if(cat == 'admin' || cat == 'supermoderator' || cat == 'moderator') {
                    var a = $('<a>', {
                        href: '/'+module_name+'/edit?module_name='+module_name+'&id='+data[key].id+'&module_id='+module_id+'&template_id='+template_id+'&template=table',
                        class: 'btn btn-primary'
                    }).appendTo(table_block_cells);
                    var span = $('<span>', {class: 'glyphicon glyphicon-edit'}).appendTo(a);
                    span.attr('aria-hidden', 'true');
                }
                table_block_cells.append('' +
                '<div class="temp_table">'+
                    '<div class="tree1"></div>'+
                    '<div class="tree2"></div>'+
                    '<div class="tree3"></div>'+
                    '<div class="img"></div>'+
                    '<div class="death_knight"></div>'+
                    '<div class="block">'+
                    '<div class="top">'+
                    '<img src="'+data[key].preview+'" alt="'+data[key].name+'">'+
                    '</div>'+
                    '<div class="bottom">'+
                    '<a class="header" href="/'+module_name+'/view?id='+data[key].id+'&template='+template_id+'">'+data[key].name+'</a>'+
                '<div class="text">'+data[key].des+'</div>'+
                '<div class="addition">'+
                    '<div class="block_date">'+
                    '<div class="date"></div>'+
                    '<div class="text1">'+data[key].date+'</div>'+
                    '</div>'+
                    '<div class="block_view">'+
                    '<div class="view"></div>'+
                    '<div class="text2">18</div>'+
                    '</div>'+
                    '</div>'+
                    '<a href="/'+module_name+'/view?id='+data[key].id+'&template='+template_id+'" class="button">Подробнее</a>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '');
            }
        }
    } else if(view == 'grid') {
        view_system_click = 'grid';
        if(view_system_active == 0) {
            var enter = 'open'
        }
        view_system_active = 1;

        if(data_list.length != 0) {
            data_list.remove();
        }
        if(data_cells.length != 0) {
            data_cells.remove();
        }
        if(data_grid.length == 0 || enter == 'open') {
            enter = 'close';
            var table_grid_in = $('<div>', { class: 'table_grid' }).appendTo('#table_create'+template_id);
            table_grid_in.attr('data-skin_grid'+template_id+'', '');
            var table_block_grid = $('<div>', { class: 'table_block_grid' }).appendTo(table_grid_in);
            if(cat !== undefined) {
                var top = $('<div>', { class: 'top' }).appendTo(table_block_grid);
                for (var cat_value in cat) {
                    var cats = $('<div>', { class: 'cats' }).appendTo(top);
                    $('<div>', { class: 'header', text: cat[cat_value].cat }).appendTo(cats);
                    var block = $('<div>', { class: 'block'}).appendTo(cats);
                    $('<div>', { class: 'diablo'}).appendTo(block);
                    var border = $('<div>', { class: 'border'}).appendTo(block);
                    if(dota_cat !== undefined) {
                        for(var dota_cat_value in dota_cat) {
                            if(cat[cat_value].id == dota_cat[dota_cat_value].cat) {
                                var grid = $('<a>', { class: 'grid', href: ''+module_name+'/view?id='+dota_cat[dota_cat_value].id+'&template='+template_id+''}).appendTo(border);
                                grid.css('margin', '0px 2px 2px 0px');
                               var img = $('<img>', { src: dota_cat[dota_cat_value].mini, alt: dota_cat[dota_cat_value].name}).appendTo(grid);
                               img.attr('data-toggle', 'tooltip');
                               img.attr('data-placement', 'left');
                               img.attr('title', dota_cat[dota_cat_value].name);
                            }
                        }
                    }
                }
                var bottom = $('<div>', { class: 'bottom' }).appendTo(table_block_grid);
                for(var data_value in data) {
                    bottom.append('' +
                        '<a href="/'+module_name+'/view?id='+data[data_value].id+'&template='+template_id+'" class="js_grid">'+
                        '<img src="'+data[data_value].mini+'" alt="'+data[data_value].name+'" data-toggle="tooltip" data-placement="left" title="'+data[data_value].name+'">'+
                     '');
                }
            }
        }
    } else if(view == 'list_magazine') {
        $('#magazine_default'+template_id).remove();
        view_system_click_magazine = 'list_magazine';
        if(view_system_active == 0) {
            var enter = 'open'
        }
        view_system_active = 1;

        if (data_cells.length != 0) {
            data_cells.remove();
        }
        if (data_list.length == 0 || enter == 'open') {
            enter = 'close';
            for (var key in data) {
                var table_list = $('<div>', { class: 'table_list' }).appendTo($('#magazine_create' + template_id));
                table_list.attr('data-skin_list'+template_id, '');

                if(dota_cat == 'admin' || dota_cat == 'supermoderator') {
                    $('<input>', {type: 'checkbox', name: 'ids[]', value: '' + data[key].id + ''}).appendTo(table_list);
                }
                if(dota_cat == 'admin' || dota_cat == 'supermoderator' || dota_cat == 'moderator') {
                    var a = $('<a>', {
                        href: '' + module_name + '/edit?module_name=' + module_name + '&id=' + data[key].id + '&module_id=' + module_id + '&template_id=' + template_id + '&template=magazine',
                        class: 'btn btn-primary'
                    }).appendTo(table_list);
                    var span = $('<span>', {class: 'glyphicon glyphicon-edit'}).appendTo(a);
                    span.attr('aria-hidden', 'true');
                }

                var table_block_list = $('<div>', { class: 'table_block_list' }).appendTo(table_list);
                var temp_table = $('<div>', { class: 'temp_table list_skin_tmp' }).appendTo(table_block_list);
                $('<div>', { class: 'tree1' }).appendTo(temp_table);
                $('<div>', { class: 'tree2' }).appendTo(temp_table);
                $('<div>', { class: 'img' }).appendTo(temp_table);
                $('<div>', { class: 'death_knight' }).appendTo(temp_table);
                var a1 = $('<a>', { href: '/'+module_name+'/shop?id='+data[key].id+'&template='+template_id+'', class: 'magazine_button' }).appendTo(temp_table);
                $('<span>', { text: 'Подробнее' }).appendTo(a1);
                var block = $('<div>', { class: 'block' }).appendTo(temp_table);
                var left_magazine = $('<div>', { class: 'left_magazine' }).appendTo(block);
                var top_magazine = $('<div>', { class: 'top_magazine' }).appendTo(left_magazine);
                var hidden_button = $('<div>', { class: 'hidden_button' }).appendTo(top_magazine);
                var button = $('<button>', { type : 'button', class: 'button', text: 'Быстрый', onclick: 'modal_magazine('+data[key].id+', \''+data[key].name+'\', '+data[key].price+', \''+JSON.stringify(data[key].des)+'\', \''+JSON.stringify(gal_decode)+'\');' }).appendTo(hidden_button);
                button.attr('data-toggle','modal');
                button.attr('data-target','#myModal');
                $('<span>', { text: 'Просмотр' }).appendTo(button);
                var preview_nav = $('<div>', { class: 'preview_nav' }).appendTo(top_magazine);
                var navigate = $('<div>', { class: 'navigate' }).appendTo(preview_nav);
                $('<div>', { class: 'pointer_top', onclick: 'nextSlide('+data[key].id+')' }).appendTo(navigate);
                var dota_mini_block = $('<div>', { id: 'dota_mini_block'+data[key].id+'', class: 'preview_block' }).appendTo(navigate);
                var dota_mini_slider = $('<ul>', { id: 'dota_mini_slider'+data[key].id+'' }).appendTo(dota_mini_block);
                for(var mini_gal in gal_decode) {
                    if(gal_decode[mini_gal].data_id == data[key].id) {
                        var li = $('<li>', { id: 'mini_bn'+gal_decode[mini_gal].id+'', class: 'bn', onclick: 'set_review('+gal_decode[mini_gal].id+','+data[key].id+')' }).appendTo(dota_mini_slider);
                        $('<img>', { src: ''+gal_decode[mini_gal].mini+'' }).appendTo(li);
                    }
                }
                $('<div>', { class: 'pointer_bottom', onclick: 'prevSlide('+data[key].id+')' }).appendTo(navigate);
                $('<div>', { class: 'clearfix' }).appendTo(top_magazine);
                var preview = $('<div>', { class: 'preview' }).appendTo(top_magazine);
                var gal_active = [];
                for(var mini_gal in gal_decode) {
                    if(gal_decode[mini_gal].data_id == data[key].id) {
                        $('<img>', { class: 'magazine_preview'+data[key].id+'', id: 'preview'+gal_decode[mini_gal].id+'', src: ''+gal_decode[mini_gal].preview+'', alt: 'dota'+gal_decode[mini_gal].id+'' }).appendTo(preview);
                        gal_active.unshift(gal_decode[mini_gal].id);
                    }
                }
                $('#preview'+gal_active[0]).css('display', 'block');
                var art1226 = $('<div>', { class: 'art1226', text: ''+data[key].id+'' }).appendTo(left_magazine);
                art1226.attr('data-toggle', 'tooltip');
                art1226.attr('data-placement', 'bottom');
                art1226.attr('title', 'Артикул');
                var rigth = $('<div>', { class: 'rigth' }).appendTo(block);
                $('<a>', { class: 'header', href: '/'+module_name+'/shop?id='+data[key].id+'&template='+template_id+'', text: ''+data[key].name+'' }).appendTo(rigth);
                var magazine_text = $('<div>', { class: 'magazine_text' }).appendTo(rigth);
                magazine_text.append(data[key].des);
                var magazine_block = $('<div>', { class: 'magazine_block' }).appendTo(rigth);
                var top_pic = $('<div>', { class: 'top_pic' }).appendTo(magazine_block);
                $('<div>', { class: 'pic_left' }).appendTo(top_pic);
                $('<div>', { class: 'pic_center' }).appendTo(top_pic);
                $('<div>', { class: 'pic_right' }).appendTo(top_pic);
                var basket_price = $('<div>', { class: 'basket_price' }).appendTo(magazine_block);
                var magazine_art = $('<div>', { class: 'magazine_art', text: ''+data[key].id+'' }).appendTo(basket_price);
                magazine_art.attr('data-toggle', 'tooltip');
                magazine_art.attr('data-placement', 'bottom');
                magazine_art.attr('title', 'tooltip');
                magazine_art.attr('data-original-title', 'Артикул');
                var price = $('<div>', { class: 'price' }).appendTo(basket_price);
                $('<div>', { class: 'left_t' }).appendTo(price);
                var center_t = $('<div>', { class: 'center_t', text: ''+data[key].price+'' }).appendTo(price);
                $('<span>', { class: 'currency', text: ' рб' }).appendTo(center_t);
                $('<div>', { class: 'right_t' }).appendTo(price);
                $('<button>', { type: 'button', class: 'basket' }).appendTo(basket_price);
            }
        }
    } else if(view == 'cells_magazine') {
        $('#magazine_default'+template_id).remove();
        view_system_click_magazine = 'cells_magazine';
        if(view_system_active == 0) {
            var enter = 'open'
        }
        view_system_active = 1;

        if (data_list.length != 0) {
            data_list.remove();
        }
        if (data_cells.length == 0 || enter == 'open') {
            enter = 'close';
            for (var key in data) {
                var table_cells = $('<div>', { class: 'table_cells' }).appendTo($('#magazine_create' + template_id));
                table_cells.attr('data-skin_cells'+template_id, '');
                var table_block_cells = $('<div>', { class: 'table_block_cells' }).appendTo(table_cells);

                if(dota_cat == 'admin' || dota_cat == 'supermoderator') {
                    $('<input>', {
                        type: 'checkbox',
                        name: 'ids[]',
                        value: '' + data[key].id + ''
                    }).appendTo(table_block_cells);
                }
                if(dota_cat == 'admin' || dota_cat == 'supermoderator' || dota_cat == 'moderator') {
                    var a = $('<a>', {
                        href: '' + module_name + '/edit?module_name=' + module_name + '&id=' + data[key].id + '&module_id=' + module_id + '&template_id=' + template_id + '&template=magazine',
                        class: 'btn btn-primary'
                    }).appendTo(table_block_cells);
                    var span = $('<span>', {class: 'glyphicon glyphicon-edit'}).appendTo(a);
                    span.attr('aria-hidden', 'true');
                }

                var temp_magazine = $('<div>', { class: 'temp_magazine' }).appendTo(table_block_cells);
                $('<div>', { class: 'tree1' }).appendTo(temp_magazine);
                $('<div>', { class: 'tree2_magazine' }).appendTo(temp_magazine);
                $('<div>', { class: 'tree3_magazine' }).appendTo(temp_magazine);
                $('<div>', { class: 'magazine_img' }).appendTo(temp_magazine);
                $('<div>', { class: 'img mod' }).appendTo(temp_magazine);
                $('<div>', { class: 'death_knight' }).appendTo(temp_magazine);
                var block = $('<div>', { class: 'block' }).appendTo(temp_magazine);
                var art = $('<div>', { class: 'art', text: 'Артикул: ' }).appendTo(block);
                $('<span>', { text: ''+data[key].id+'' }).appendTo(art);
                var top_magazine = $('<div>', { class: 'top_magazine' }).appendTo(block);
                var hidden_button = $('<div>', { class: 'hidden_button' }).appendTo(top_magazine);
                var button = $('<button>', { type : 'button', class: 'button', text: 'Быстрый', onclick: 'modal_magazine('+data[key].id+', \''+data[key].name+'\', '+data[key].price+', \''+JSON.stringify(data[key].des)+'\', \''+JSON.stringify(gal_decode)+'\');' }).appendTo(hidden_button);
                button.attr('data-toggle','modal');
                button.attr('data-target','#myModal');
                $('<span>', { text: 'Просмотр' }).appendTo(button);
                var preview_nav = $('<div>', { class: 'preview_nav' }).appendTo(top_magazine);
                var navigate = $('<div>', { class: 'navigate' }).appendTo(preview_nav);
                $('<div>', { class: 'pointer_top', onclick: 'nextSlide('+data[key].id+')' }).appendTo(navigate);
                var dota_mini_block = $('<div>', { id: 'dota_mini_block'+data[key].id+'', class: 'preview_block' }).appendTo(navigate);
                var dota_mini_slider = $('<ul>', { id: 'dota_mini_slider'+data[key].id+'' }).appendTo(dota_mini_block);
                for(var mini_gal in gal_decode) {
                    if(gal_decode[mini_gal].data_id == data[key].id) {
                        var li = $('<li>', { id: 'mini_bn'+gal_decode[mini_gal].id+'', class: 'bn', onclick: 'set_review('+gal_decode[mini_gal].id+','+data[key].id+')' }).appendTo(dota_mini_slider);
                        $('<img>', { src: ''+gal_decode[mini_gal].mini+'' }).appendTo(li);
                    }
                }
                $('<div>', { class: 'pointer_bottom', onclick: 'prevSlide('+data[key].id+')' }).appendTo(navigate);
                $('<div>', { class: 'clearfix' }).appendTo(top_magazine);
                var preview = $('<div>', { class: 'preview' }).appendTo(top_magazine);
                var gal_active = [];
                for(var mini_gal in gal_decode) {
                    if(gal_decode[mini_gal].data_id == data[key].id) {
                        $('<img>', { class: 'magazine_preview'+data[key].id+'', id: 'preview'+gal_decode[mini_gal].id+'', src: ''+gal_decode[mini_gal].preview+'', alt: 'dota'+gal_decode[mini_gal].id+'' }).appendTo(preview);
                        gal_active.unshift(gal_decode[mini_gal].id);
                    }
                }
                $('#preview'+gal_active[0]).css('display', 'block');
                var bottom = $('<div>', { class: 'bottom' }).appendTo(block);
                $('<a>', { class: 'header', href: '/'+module_name+'/shop?id='+data[key].id+'&template='+template_id+'', text: ''+data[key].name+'' }).appendTo(bottom);
                var top_pic = $('<div>', { class: 'top_pic' }).appendTo(bottom);
                $('<div>', { class: 'pic_left' }).appendTo(top_pic);
                $('<div>', { class: 'pic_center' }).appendTo(top_pic);
                $('<div>', { class: 'pic_right' }).appendTo(top_pic);
                var magazine_text = $('<div>', { class: 'text_magazine' }).appendTo(bottom);
                magazine_text.append(data[key].des);
                $('<div>', { class: 'bottom_pic' }).appendTo(bottom);
                $('<div>', { class: 'magazine_block' }).appendTo(bottom);
                var basket_price = $('<div>', { class: 'basket_price' }).appendTo(bottom);
                var price = $('<div>', { class: 'price' }).appendTo(basket_price);
                $('<div>', { class: 'left_t' }).appendTo(price);
                var center_t = $('<div>', { class: 'center_t', text: ''+data[key].price+'' }).appendTo(price);
                $('<span>', { class: 'currency', text: ' рб' }).appendTo(center_t);
                $('<div>', { class: 'right_t' }).appendTo(price);
                $('<button>', { type: 'button', class: 'basket' }).appendTo(basket_price);
                var a_button = $('<a>', { href: '/'+module_name+'/shop?id='+data[key].id+'&template='+template_id+'', class: 'magazine_button' }).appendTo(bottom);
                $('<span>', { text: 'Подробнее' }).appendTo(a_button);
            }
        }
    }
}
gal_cats = 0;
function categories(module_id, module_name, template_id, cat_id, template, role) {
    if(template == 'table') {
        if(cat_id == 0) {
            window.location.href="/"+module_name;
        } else {
            $.ajax({
                url: '/ajax/categories',
                type: "GET",
                cache: false,
                data: {template_id: template_id, id: cat_id},
                success: function (msg) {
                    var match = msg.match(/dovahkin(.*)go/i);
                    $('#button_list'+template_id).attr('onclick', 'view_system(\'list\', '+match[1]+', \''+module_id+'\', \''+module_name+'\', \''+template_id+'\', \''+role+'\')');
                    $('#button_cells'+template_id).attr('onclick', 'view_system(\'cells\', '+match[1]+', \''+module_id+'\', \''+module_name+'\', \''+template_id+'\', \''+role+'\')');
                    $('[data-skin_list'+template_id+']').remove();
                    $('[data-skin_cells'+template_id+']').remove();
                    if(view_system_click == 'list') {
                        $('#button_list'+template_id).trigger('click');
                    } else if(view_system_click == 'cells') {
                        $('#button_cells'+template_id).trigger('click');
                    } else if(view_system_click == 'grid') {
                        $('#button_grid'+template_id).trigger('click');
                    }
                }
            });
        }
    } else if(template == 'gal') {
        if(cat_id == 0) {
            window.location.href="/"+module_name;
        } else {
            var template_default = $('#gal_default'+template_id);
            template_default.slideUp({duratation: 400, done: function () {
                template_default.remove();
            }});

            var template = $('#gal_create' + template_id);
            template.slideUp(400);

            setTimeout(function() {
                $('[data-skin_gal'+template_id+']').remove();
                $.ajax({
                    url: '/ajax/categories',
                    type: "GET",
                    cache: false,
                    data: {template_id: template_id, id: cat_id},
                    success: function (msg) {
                        var match = msg.match(/dovahkin(.*)go/i);
                        var data = JSON.parse(match[1]);

                        for (var key in data) {
                            var gal_block = $('<div>', { class: 'gal_block' }).appendTo(template);
                            gal_block.attr('data-skin_gal', template_id);
                            if(role == 'admin' || role == 'supermoderator') {
                                $('<input>', { type: 'checkbox', name: 'ids[]', value: ''+data[key].id+'' }).appendTo(gal_block);
                            }
                            gal_block.append('' +
                                '<div class="temp_gal">'+
                                '<a class="a_image" href="'+data[key].img+'" alt="'+data[key].name+'" data-toggle="tooltip" data-placement="top" title="'+data[key].name+'" itemprop="contentUrl" data-fancybox="gallery'+template_id+'"'+
                                'data-caption=" <div>Название: <b>'+data[key].name+'</b> </div>'+
                                '<div>Добавил: <b>Dota</b></div>'+
                                '<div>Дата добавление: <b>28-04-2018</b></div>"'+
                                'data-options="{&quot;animationEffect&quot; : &quot;zoom&quot;, &quot;transitionEffect&quot; : &quot;tube&quot;}">'+
                                '<img src="'+data[key].preview+'" itemprop="thumbnail" alt="'+data[key].name+'">'+
                                '</a>'+
                                '<div class="box">'+
                                '<div class="info" data-toggle="tooltip" data-placement="bottom" title="Добавил: Dota">'+
                                '<span class="glyphicon glyphicon-user" aria-hidden="true"></span>'+
                                '</div>'+
                                '<div class="info" data-toggle="tooltip" data-placement="bottom" title="Дата добавление: 27-08-2018">'+
                                '<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>'+
                                '</div>'+
                                '<a data-fancybox="small-gallery'+template_id+'"'+
                                'data-options="{&quot;animationEffect&quot; : &quot;zoom&quot;, &quot;transitionEffect&quot; : &quot;tube&quot;}" href="'+data[key].img+'" alt="'+data[key].name+'" class="info">'+
                                '<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>'+
                                '</a href="'+data[key].img+'" alt="'+data[key].name+'">'+
                                '</div>'+
                                '</div>'+
                                '');
                        }
                        template.slideDown(400);
                    }
                });
            },700);
        }
    }
}

function del_categories() {
    $('.table_list_categories').remove();
    $('.table_cells_categories').remove();
}
//Preview Slider
slideNow = 1;
function nextSlide(id) {
    slideCount = $('#dota_mini_slider'+id).children().length;
    /*if (slideNow == slideCount || slideNow <= 0 || slideNow > slideCount) {
        $('#dota_mini_slider'+id).css('transform', 'translate(0, 0)');
        slideNow = 1;
        console.log('begin');
    } else {
        translateWidth = -$('#mini_bn'+id).height()+4 * (slideNow);
        $('#dota_mini_slider'+id).css({
            'transform': 'translate(0,'+translateWidth+'px)',
            '-webkit-transform': 'translate(0,'+translateWidth+'px)',
            '-ms-transform': 'translate(0,'+translateWidth+'px)',
        });
        slideNow++;
        console.log('next - '+slideNow);
    }*/
    if (slideNow == slideCount || slideNow <= 0 || slideNow > slideCount) {
        $('#dota_mini_slider'+id).css('transform', 'translate(0, 0)');
        slideNow = 1;
    } else {
        translateWidth = -$('#mini_bn'+id).height()+4 * (slideNow);
        $('#dota_mini_slider'+id).css({
            'transform': 'translate(0,'+translateWidth+'px)',
            '-webkit-transform': 'translate(0,'+translateWidth+'px)',
            '-ms-transform': 'translate(0,'+translateWidth+'px)',
        });
        slideNow++;
    }
}
function prevSlide(id) {
    slideCount = $('#dota_mini_slider'+id).children().length;
    /*if (slideNow == 1 || slideNow <= 0 || slideNow > slideCount) {
        translateWidth = -$('#mini_bn'+id).height()+4 * (slideCount - 1);
        $('#dota_mini_slider'+id).css({
            'transform': 'translate(0,'+translateWidth+'px)',
            '-webkit-transform': 'translate(0,'+translateWidth+'px)',
            '-ms-transform': 'translate(0,'+translateWidth+'px)',
        });
        slideNow = slideCount;
    } else {
        translateWidth = -$('#mini_bn'+id).height()+4 * (slideNow - 2);
        $('#dota_mini_slider'+id).css({
            'transform': 'translate(0,'+translateWidth+'px)',
            '-webkit-transform': 'translate(0,'+translateWidth+'px)',
            '-ms-transform': 'translate(0,'+translateWidth+'px)',
        });
        slideNow--;
        console.log('next - '+slideNow);
    }*/
    if (slideNow == 1 || slideNow <= 0 || slideNow > slideCount) {
        translateWidth = -$('#mini_bn'+id).height()+4 * (slideCount - 1);
        $('#dota_mini_slider'+id).css({
            'transform': 'translate(0,'+translateWidth + 'px)',
            '-webkit-transform': 'translate(0,'+translateWidth + 'px)',
            '-ms-transform': 'translate(0,'+translateWidth + 'px)',
        });
        slideNow = slideCount;
    } else {
        translateWidth = -$('#mini_bn'+id).height() * (slideNow - 2);
        $('#dota_mini_slider'+id).css({
            'transform': 'translate(0,'+translateWidth + 'px)',
            '-webkit-transform': 'translate(0,'+translateWidth + 'px)',
            '-ms-transform': 'translate(0,'+translateWidth + 'px)',
        });
        slideNow--;
    }
}

function nav_mobile() {
    var nav = $('#nav_mobile');
    if(nav.css('display') == 'none') {
        nav.slideDown(500);
    } else if(nav.css('display') == 'block') {
        nav.slideUp(300);
    }
}

/*Admin*/
function users_access() {
    $('#access').on('show.bs.modal', function () {
        var modal = $(this)
        modal.find('.modal-body').text('Вы собираетесь удалить подкатегорию');
        modal.find('#delete').attr('onclick', 'del_subcat_magazine_ajax('+id+')');
    });
    $('#access').modal('toggle');
}
//Module
function getModule(id, name) {
    $.ajax({
        url: '/ajax/getmodule',
        type: "GET",
        cache: false,
        data: {id: id},
        success: function (msg) {
            var match = msg.match(/dovahkin(.*)go/i);
            var data = JSON.parse(match[1]);
            for (var key in data) {
                $('#module_create' + id).append('' +
                    '<div id="openModule'+data[key].id+'" class="module mod_module">'+
                        '<div class="left">' +
                            '<div class="check_bn"><input type="checkbox" name="ids[]" value="'+data[key].id+'"></div>'+
                            '<button type="button" onclick="getModule('+data[key].id+',\''+data[key].name+'\')" class="module_button">'+name+' --> '+data[key].name+'</button>'+
                        '</div>' +
                        '<div class="rigth">' +
                            '<a href="/admin/module/edit?id='+data[key].id+'&parent='+id+'" class="btn btn-default">Изменить</a>'+
                        '</div>' +
                    '</div>'+
                    '<div id="module_create'+data[key].id+'"></div>'+
                '');
                openModule(data[key].id);
            }
        }
    });
}
function openModule(id) {
    var module = $('#openModule'+id);
    if(module.css('display') == 'none') {
        $('#openModule'+id).slideDown(500);
    } else if(module.css('display') == 'block'){
        $('#openModule'+id).slideUp(500);
    }
}

//Template admin/module/add
use = 0;
function create_template(template, data, cat, properties) {
    if(template == 'one') {
        use = use+1;
        $('#create_tempalte').append('' +
            '<div id="form_template'+use+'" class="form_data">'+
            '<div class="img"></div>'+
            '<div class="form_block_header">'+
            '<div class="left">Одниночный шаблон - '+use+'</div>'+
            '<div class="right">'+
            '<button type="button" class="btn btn-default" onclick="del_tempalte('+use+')">'+
            'Удалить'+
            '</button>'+
            '</div>'+
            '</div>'+
            '<div class="form-group">'+
            '<label class="data_hint">Контейнер</label>'+
            '<div class="input-group">'+
            '<div class="input-group-btn">'+
            '<div class="btn pseudo_left">'+
            '<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '<select name="data[insert]['+use+'][one][container]" class="form-control">'+
            '<option value="div">Div</option>'+
            '<option value="article">Article</option>'+
            '<option value="section">Section</option>'+
            '</select>'+
            '<div class="input-group-btn">'+
            '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это теги для SEO. Если вы хотите чтоб поисковик не обращял внимание на данный шаблон или у вас всего 1 шаблон, ставьте div. Если в данном шаблоне будет самодостаточная информация и вы хотите чтоб поисковик выделил его отдельно, вставльте article. Если у вас шаблонов несколько и они связаны с темой данного модуля то вставьте им section">'+
            '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '<div class="form-group">'+
            '<label for="exampleInputPassword1" class="data_hint">Itemscope itemtype</label>'+
            '<div class="input-group">'+
            '<div class="input-group-btn">'+
            '<div class="btn pseudo_left">'+
            '<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '<input type="text" name="data[insert]['+use+'][one][itemscope]" class="form-control">'+
            '<div class="input-group-btn">'+
            '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это главная микроразметка этого шаблона. Выберите нужную микроразметку из schema.org и вставьте в данное поле. Пример http://schema.org/Product">'+
            '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '<div class="form-group">'+
            '<label for="exampleInputPassword1" class="data_hint">Тег загаловка</label>'+
            '<div class="input-group">'+
            '<div class="input-group-btn">'+
            '<div class="btn pseudo_left">'+
            '<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '<select name="data[insert]['+use+'][one][tegh]" class="form-control">'+
            '<option value="h1">&lt;h1&gt;</option>'+
            '<option value="h2">&lt;h2&gt;</option>'+
            '<option value="h3">&lt;h3&gt;</option>'+
            '<option value="h4">&lt;h4&gt;</option>'+
            '<option value="h5">&lt;h5&gt;</option>'+
            '</select>'+
            '<div class="input-group-btn">'+
            '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это тег в которым будет загаловок шаблона. Это важный тег SEO, в нем будет находится ключевое слова дающий представление о теме данного шаблона. H1-h5 означает приориетет этого ключевого слова на странице. В странице h1 должен быть только один">'+
            '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '<div class="form-group">'+
            '<label for="exampleInputPassword1" class="data_hint">Загаловок</label>'+
            '<div class="input-group">'+
            '<div class="input-group-btn">'+
            '<div class="btn pseudo_left">'+
            '<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '<input type="text" name="data[insert]['+use+'][one][header]" class="form-control" value="">'+
            '<div class="input-group-btn">'+
            '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это загаловок шаблона">'+
            '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '<div class="form-group">'+
            '<label for="exampleInputPassword1" class="data_hint">Itemprop</label>'+
            '<div class="input-group">'+
            '<div class="input-group-btn">'+
            '<div class="btn pseudo_left">'+
            '<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '<input type="text" name="data[insert]['+use+'][one][itemprop]" class="form-control">'+
            '<div class="input-group-btn">'+
            '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это дочерная микроразметка для textarea. Выберите нужную микроразметку из schema.org и вставьте в данное поле. Пример ProductModel">'+
            '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '<div class="form-group">'+
            '<div class="form-group">'+
            '<label for="exampleInputPassword1" class="data_hint">Текстовое поле</label>'+
            '<textarea id="editor'+use+'" name="data[insert]['+use+'][one][text]" class="form-control"></textarea>'+
            '<script>CKEDITOR.replace(\'editor'+use+'\');</script>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '');
    } else if(template == 'table') {
        use = use+1;
        $('#create_tempalte').append(''+
            '<div id="form_template'+use+'" class="form_data">'+
            '<div class="img"></div>'+
            '<div class="form_block_header">'+
            '<div class="left">Табличный шаблон - '+use+'</div>'+
        '<div class="right">'+
           '<button type="button" class="btn btn-default" onclick="del_tempalte('+use+')">'+
            'Удалить'+
            '</button>'+
            '</div>'+
            '</div>'+
            '<div class="form-group">'+
            '<label for="exampleInputPassword1" class="data_hint">Контейнер</label>'+
            '<div class="input-group">'+
            '<div class="input-group-btn">'+
            '<div class="btn pseudo_left">'+
            '<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '<select name="data[insert]['+use+'][table][container]" class="form-control">'+
            '<option value="div">Div</option>'+
            '<option value="article">Article</option>'+
            '<option value="section">Section</option>'+
            '</select>'+
            '<div class="input-group-btn">'+
            '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это теги для SEO. Если вы хотите чтоб поисковик не обращял внимание на данный шаблон или у вас всего 1 шаблон, ставьте div. Если в данном шаблоне будет самодостаточная информация и вы хотите чтоб поисковик выделил его отдельно, вставльте article. Если у вас шаблонов несколько и они связаны с темой данного модуля то вставьте им section">'+
            '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '<div class="form-group">'+
            '<label for="exampleInputPassword1" class="data_hint">Itemscope itemtype</label>'+
        '<div class="input-group">'+
            '<div class="input-group-btn">'+
            '<div class="btn pseudo_left">'+
            '<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '<input type="text" name="data[insert]['+use+'][table][itemscope]" class="form-control">'+
            '<div class="input-group-btn">'+
            '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это главная микроразметка этого шаблона. Выберите нужную микроразметку из schema.org и вставьте в данное поле. Пример http://schema.org/Product">'+
            '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '<div class="form-group">'+
            '<label for="exampleInputPassword1" class="data_hint">Тег загаловка</label>'+
        '<div class="input-group">'+
            '<div class="input-group-btn">'+
            '<div class="btn pseudo_left">'+
           '<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '<select name="data[insert]['+use+'][table][tegh]" class="form-control">'+
            '<option value="h1">&lt;h1&gt;</option>'+
            '<option value="h2">&lt;h2&gt;</option>'+
            '<option value="h3">&lt;h3&gt;</option>'+
            '<option value="h4">&lt;h4&gt;</option>'+
            '<option value="h5">&lt;h5&gt;</option>'+
            '</select>'+
            '<div class="input-group-btn">'+
            '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это тег в которым будет загаловок шаблона. Это важный тег SEO, в нем будет находится ключевое слова дающий представление о теме данного шаблона. H1-h5 означает приориетет этого ключевого слова на странице. В странице h1 должен быть только один">'+
            '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>'+
           '<div class="form-group">'+
            '<label for="exampleInputPassword1" class="data_hint">Загаловок</label>'+
            '<div class="input-group">'+
            '<div class="input-group-btn">'+
            '<div class="btn pseudo_left">'+
            '<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '<input type="text" name="data[insert]['+use+'][table][header]" class="form-control">'+
            '<div class="input-group-btn">'+
            '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это загаловок шаблона">'+
            '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '<div class="form-group">'+
            '<label for="exampleInputPassword1" class="data_hint">Вид</label>'+
            '<div class="input-group">'+
            '<div class="input-group-btn">'+
            '<div class="btn pseudo_left">'+
            '<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '<select name="data[insert]['+use+'][table][view]" class="form-control">'+
            '<option value="list">Список</option>'+
            '<option value="cells">Ячейка</option>'+
            '<option value="grid">Дота</option>'+
            '</select>'+
            '<div class="input-group-btn">'+
            '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Данные в табличном шаблоне могут отображатся в трех видах. Здесь указывается вид который будет идти по умолчанию при загрузке страницы.">'+
            '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '<div class="panel panel-default">'+
            '<div class="panel-heading">'+
            '<div class="left">Подкатегорий</div>'+
            '<div class="right">'+
            '<button type="button" onclick="create_subcat('+use+', \'table\')" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="Добавляет подкатегорию в данный шаблон. Подкатегорию можно и не добавлять. Она нужна если потребуется сортировка данных">'+
            'Добавить'+
            '</button>'+
            '</div>'+
            '</div>'+
            '<div class="panel-body">'+
            '<div id="subcat'+use+'"></div>'+
            '</div>'+
            '</div>'+
            '</div>'+
        '')
    } else if(template == 'gal') {
        use = use+1;
        $('#create_tempalte').append(''+
            '<div id="form_template'+use+'" class="form_data">'+
                '<div class="img"></div>'+
                '<div class="form_block_header">'+
                '<div class="left">Галерейный шаблон - '+use+'</div>'+
            '<div class="right">'+
                '<button type="button" class="btn btn-default" onclick="del_tempalte('+use+')">'+
                'Удалить'+
                '</button>'+
                '</div>'+
                '</div>'+
                '<div class="form-group">'+
                '<label for="exampleInputPassword1" class="data_hint">Контейнер</label>'+
                '<div class="input-group">'+
                '<div class="input-group-btn">'+
                '<div class="btn pseudo_left">'+
                '<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>'+
                '</div>'+
                '</div>'+
                '<select name="data[insert]['+use+'][gal][container]" class="form-control">'+
                '<option value="div">Div</option>'+
                '<option value="article">Article</option>'+
                '<option value="section">Section</option>'+
                '</select>'+
                '<div class="input-group-btn">'+
                '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это теги для SEO. Если вы хотите чтоб поисковик не обращял внимание на данный шаблон или у вас всего 1 шаблон, ставьте div. Если в данном шаблоне будет самодостаточная информация и вы хотите чтоб поисковик выделил его отдельно, вставльте article. Если у вас шаблонов несколько и они связаны с темой данного модуля то вставьте им section">'+
                '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
                '</div>'+
                '</div>'+
                '</div>'+
                '</div>'+
                '<div class="form-group">'+
                '<label for="exampleInputPassword1" class="data_hint">Itemscope itemtype</label>'+
            '<div class="input-group">'+
                '<div class="input-group-btn">'+
                '<div class="btn pseudo_left">'+
                '<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>'+
                '</div>'+
                '</div>'+
                '<input type="text" name="data[insert]['+use+'][gal][itemscope]" class="form-control">'+
                '<div class="input-group-btn">'+
                '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это главная микроразметка этого шаблона. Выберите нужную микроразметку из schema.org и вставьте в данное поле. Пример http://schema.org/Product">'+
                '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
                '</div>'+
                '</div>'+
                '</div>'+
                '</div>'+
                '<div class="form-group">'+
                '<label for="exampleInputPassword1" class="data_hint">Тег загаловка</label>'+
            '<div class="input-group">'+
                '<div class="input-group-btn">'+
                '<div class="btn pseudo_left">'+
                '<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>'+
                '</div>'+
                '</div>'+
                '<select name="data[insert]['+use+'][gal][tegh]" class="form-control">'+
                '<option value="h1">&lt;h1&gt;</option>'+
                '<option value="h2">&lt;h2&gt;</option>'+
                '<option value="h3">&lt;h3&gt;</option>'+
                '<option value="h4">&lt;h4&gt;</option>'+
                '<option value="h5">&lt;h5&gt;</option>'+
                '</select>'+
                '<div class="input-group-btn">'+
                '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это тег в которым будет загаловок шаблона. Это важный тег SEO, в нем будет находится ключевое слова дающий представление о теме данного шаблона. H1-h5 означает приориетет этого ключевого слова на странице. В странице h1 должен быть только один">'+
                '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
                '</div>'+
                '</div>'+
                '</div>'+
                '</div>'+
                '<div class="form-group">'+
                '<label for="exampleInputPassword1" class="data_hint">Загаловок</label>'+
                '<div class="input-group">'+
                '<div class="input-group-btn">'+
                '<div class="btn pseudo_left">'+
                '<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>'+
                '</div>'+
                '</div>'+
                '<input type="text" name="data[insert]['+use+'][gal][header]" class="form-control">'+
                '<div class="input-group-btn">'+
                '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это загаловок шаблона">'+
                '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
                '</div>'+
                '</div>'+
                '</div>'+
                '</div>'+
                '<div class="panel panel-default">'+
                '<div class="panel-heading">'+
                '<div class="left">Подкатегорий</div>'+
                '<div class="right">'+
                '<button type="button" onclick="create_subcat('+use+', \'gal\')" class="btn btn-default" data-toggle="tooltip"data-placement="bottom" title="Добавляет подкатегорию в данный шаблон. Подкатегорию можно и не добавлять. Она нужна если потребуется сортировка данных">'+
                'Добавить'+
                '</button>'+
                '</div>'+
                '</div>'+
                '<div class="panel-body">'+
                    '<div id="subcat'+use+'"></div>'+
                '</div>'+
                '</div>'+
            '</div>'+
        '');
    } else if(template == 'carusel') {
        use = use+1;
        $('#create_tempalte').append(''+
            '<div id="form_template'+use+'" class="form_data">'+
            '<div class="img"></div>'+
            '<div class="form_block_header">'+
            '<div class="left">Карусельный шаблон - '+use+'</div>'+
        '<div class="right">'+
            '<button type="button" class="btn btn-default" onclick="del_tempalte('+use+')">'+
            'Удалить'+
            '</button>'+
            '</div>'+
            '</div>'+
            '<div class="form-group">'+
            '<label for="exampleInputPassword1" class="data_hint">Контейнер</label>'+
            '<div class="input-group">'+
            '<div class="input-group-btn">'+
            '<div class="btn pseudo_left">'+
            '<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '<select name="data[insert]['+use+'][carusel][container]" class="form-control">'+
            '<option value="div">Div</option>'+
            '<option value="article">Article</option>'+
            '<option value="section">Section</option>'+
            '</select>'+
            '<div class="input-group-btn">'+
            '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это теги для SEO. Если вы хотите чтоб поисковик не обращял внимание на данный шаблон или у вас всего 1 шаблон, ставьте div. Если в данном шаблоне будет самодостаточная информация и вы хотите чтоб поисковик выделил его отдельно, вставльте article. Если у вас шаблонов несколько и они связаны с темой данного модуля то вставьте им section">'+
            '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '<div class="form-group">'+
            '<label for="exampleInputPassword1" class="data_hint">Itemscope itemtype</label>'+
        '<div class="input-group">'+
            '<div class="input-group-btn">'+
            '<div class="btn pseudo_left">'+
            '<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '<input type="text" name="data[insert]['+use+'][carusel][itemscope]" class="form-control">'+
            '<div class="input-group-btn">'+
            '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это главная микроразметка этого шаблона. Выберите нужную микроразметку из schema.org и вставьте в данное поле. Пример http://schema.org/Product">'+
            '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '<div class="form-group">'+
            '<label for="exampleInputPassword1" class="data_hint">Тег загаловка</label>'+
        '<div class="input-group">'+
            '<div class="input-group-btn">'+
            '<div class="btn pseudo_left">'+
            '<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '<select name="data[insert]['+use+'][carusel][tegh]" class="form-control">'+
            '<option value="div">&lt;div&gt;</option>'+
            '<option value="h1">&lt;h1&gt;</option>'+
            '<option value="h2">&lt;h2&gt;</option>'+
            '<option value="h3">&lt;h3&gt;</option>'+
            '<option value="h4">&lt;h4&gt;</option>'+
            '<option value="h5">&lt;h5&gt;</option>'+
            '</select>'+
            '<div class="input-group-btn">'+
            '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это тег в которым будет загаловок шаблона. Это важный тег SEO, в нем будет находится ключевое слова дающий представление о теме данного шаблона. H1-h5 означает приориетет этого ключевого слова на странице. В странице h1 должен быть только один">'+
            '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '<div class="form-group">'+
            '<label for="exampleInputPassword1" class="data_hint">Загаловок</label>'+
            '<div class="input-group">'+
            '<div class="input-group-btn">'+
            '<div class="btn pseudo_left">'+
            '<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '<input type="text" name="data[insert]['+use+'][carusel][header]" class="form-control">'+
            '<div class="input-group-btn">'+
            '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это загаловок шаблона. Если вы хотите чтоб у каруселя не было загаловка (не отображался на странице), то оставьте это поле пустым. Такое доступно только для карусельного шаблона.">'+
            '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>'+
        '');
    } else if(template == 'magazine') {
        use = use+1;
        $('#create_tempalte').append(''+
            '<div id="form_template'+use+'" class="form_data">'+
            '<div class="img"></div>'+
            '<div class="form_block_header">'+
            '<div class="left">Интернет магазин - '+use+'</div>'+
        '<div class="right">'+
            '<button type="button" class="btn btn-default" onclick="del_tempalte('+use+')">'+
            'Удалить'+
            '</button>'+
            '</div>'+
            '</div>'+
            '<div class="form-group">'+
            '<label for="exampleInputPassword1" class="data_hint">Контейнер</label>'+
            '<div class="input-group">'+
            '<div class="input-group-btn">'+
            '<div class="btn pseudo_left">'+
            '<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '<select name="data[insert]['+use+'][magazine][container]" class="form-control">'+
            '<option value="div">Div</option>'+
            '<option value="article">Article</option>'+
            '<option value="section">Section</option>'+
            '</select>'+
            '<div class="input-group-btn">'+
            '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это теги для SEO. Если вы хотите чтоб поисковик не обращял внимание на данный шаблон или у вас всего 1 шаблон, ставьте div. Если в данном шаблоне будет самодостаточная информация и вы хотите чтоб поисковик выделил его отдельно, вставльте article. Если у вас шаблонов несколько и они связаны с темой данного модуля то вставьте им section">'+
            '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '<div class="form-group">'+
            '<label for="exampleInputPassword1" class="data_hint">Itemscope itemtype</label>'+
        '<div class="input-group">'+
            '<div class="input-group-btn">'+
            '<div class="btn pseudo_left">'+
            '<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '<input type="text" name="data[insert]['+use+'][magazine][itemscope]" class="form-control">'+
            '<div class="input-group-btn">'+
            '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это главная микроразметка этого шаблона. Выберите нужную микроразметку из schema.org и вставьте в данное поле. Пример http://schema.org/Product">'+
            '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '<div class="form-group">'+
            '<label for="exampleInputPassword1" class="data_hint">Тег загаловка</label>'+
        '<div class="input-group">'+
            '<div class="input-group-btn">'+
            '<div class="btn pseudo_left">'+
            '<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '<select name="data[insert]['+use+'][magazine][tegh]" class="form-control">'+
            '<option value="h1">&lt;h1&gt;</option>'+
            '<option value="h2">&lt;h2&gt;</option>'+
            '<option value="h3">&lt;h3&gt;</option>'+
            '<option value="h4">&lt;h4&gt;</option>'+
            '<option value="h5">&lt;h5&gt;</option>'+
            '</select>'+
            '<div class="input-group-btn">'+
            '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это тег в которым будет загаловок шаблона. Это важный тег SEO, в нем будет находится ключевое слова дающий представление о теме данного шаблона. H1-h5 означает приориетет этого ключевого слова на странице. В странице h1 должен быть только один">'+
            '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '<div class="form-group">'+
            '<label for="exampleInputPassword1" class="data_hint">Загаловок</label>'+
            '<div class="input-group">'+
            '<div class="input-group-btn">'+
            '<div class="btn pseudo_left">'+
            '<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '<input type="text" name="data[insert]['+use+'][magazine][header]" class="form-control">'+
            '<div class="input-group-btn">'+
            '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это загаловок шаблона">'+
            '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '<div class="form-group">'+
            '<label for="exampleInputPassword1" class="data_hint">Вид</label>'+
            '<div class="input-group">'+
            '<div class="input-group-btn">'+
            '<div class="btn pseudo_left">'+
            '<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '<select name="data[insert]['+use+'][magazine][view]" class="form-control">'+
            '<option value="list">Ячейка</option>'+
            '<option value="cells">Список</option>'+
            '</select>'+
            '<div class="input-group-btn">'+
            '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Данные в табличном шаблоне могут отображатся в трех видах. Здесь указывается вид который будет идти по умолчанию при загрузке страницы.">'+
            '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '<div class="panel panel-default">'+
            '<div class="panel-heading">'+
            '<div class="left">Категорий</div>'+
            '<div class="right">'+
            '<button type="button" class="btn btn-default" data-toggle="tooltip"data-placement="bottom" title="Категорий помагают удобно отсортировывать товары по свойствам. Обязательно добавляйте категорий чтоб создать удобства пользователям" onclick="create_subcat_magazine('+use+')">'+
            'Добавить'+
            '</button>'+
            '</div>'+
            '</div>'+
            '<div class="panel-body">'+
                '<div id="subcat_magazine'+use+'">'+
                '</div>'+
            '</div>'+
            '</div>'+
            '</div>'+
        '');
    } else if(template == 'set') {
        for (var key in data) {
            //Sets <SELECT>
            if(data[key].container == 'div') {
                var container = '' +
                    '<option selected value="div">Div</option>' +
                    '<option value="article">Article</option>' +
                    '<option value="section">Section</option>' +
                    '';
            } else if(data[key].container == 'article') {
                var container = '' +
                    '<option value="div">Div</option>' +
                    '<option selected value="article">Article</optionselected>' +
                    '<option value="section">Section</option>' +
                    '';
            } else if(data[key].container == 'section') {
                var container = '' +
                    '<option value="div">Div</option>' +
                    '<option value="article">Article</option>' +
                    '<option selected value="section">Section</option>' +
                    '';
            }
            /**/
            if(data[key].template != 'carusel') {
                if(data[key].tegh == 'h1') {
                    var tegh = '' +
                        '<option selected value="h1">&lt;h1&gt;</option>'+
                        '<option value="h2">&lt;h2&gt;</option>'+
                        '<option value="h3">&lt;h3&gt;</option>'+
                        '<option value="h4">&lt;h4&gt;</option>'+
                        '<option value="h5">&lt;h5&gt;</option>'+
                        '';
                } else if(data[key].tegh == 'h2') {
                    var tegh = '' +
                        '<option value="h1">&lt;h1&gt;</option>'+
                        '<option selected value="h2">&lt;h2&gt;</option>'+
                        '<option value="h3">&lt;h3&gt;</option>'+
                        '<option value="h4">&lt;h4&gt;</option>'+
                        '<option value="h5">&lt;h5&gt;</option>'+
                        '';
                } else if(data[key].tegh == 'h3') {
                    var tegh = '' +
                        '<option value="h1">&lt;h1&gt;</option>'+
                        '<option value="h2">&lt;h2&gt;</option>'+
                        '<option selected value="h3">&lt;h3&gt;</option>'+
                        '<option value="h4">&lt;h4&gt;</option>'+
                        '<option value="h5">&lt;h5&gt;</option>'+
                        '';
                } else if(data[key].tegh == 'h4') {
                    var tegh = '' +
                        '<option value="h1">&lt;h1&gt;</option>'+
                        '<option value="h2">&lt;h2&gt;</option>'+
                        '<option value="h3">&lt;h3&gt;</option>'+
                        '<option selected value="h4">&lt;h4&gt;</option>'+
                        '<option value="h5">&lt;h5&gt;</option>'+
                        '';
                } else if(data[key].tegh == 'h5') {
                    var tegh = '' +
                        '<option value="h1">&lt;h1&gt;</option>'+
                        '<option value="h2">&lt;h2&gt;</option>'+
                        '<option value="h3">&lt;h3&gt;</option>'+
                        '<option value="h4">&lt;h4&gt;</option>'+
                        '<option selected value="h5">&lt;h5&gt;</option>'+
                        '';
                }
            } else if(data[key].template == 'carusel') {
                if(data[key].tegh == 'h1') {
                    var tegh = '' +
                        '<option selected value="h1">&lt;h1&gt;</option>'+
                        '<option value="h2">&lt;h2&gt;</option>'+
                        '<option value="h3">&lt;h3&gt;</option>'+
                        '<option value="h4">&lt;h4&gt;</option>'+
                        '<option value="h5">&lt;h5&gt;</option>'+
                        '<option value="div">&lt;div&gt;</option>'+
                        '';
                } else if(data[key].tegh == 'h2') {
                    var tegh = '' +
                        '<option value="h1">&lt;h1&gt;</option>'+
                        '<option selected value="h2">&lt;h2&gt;</option>'+
                        '<option value="h3">&lt;h3&gt;</option>'+
                        '<option value="h4">&lt;h4&gt;</option>'+
                        '<option value="h5">&lt;h5&gt;</option>'+
                        '<option value="div">&lt;div&gt;</option>'+
                        '';
                } else if(data[key].tegh == 'h3') {
                    var tegh = '' +
                        '<option value="h1">&lt;h1&gt;</option>'+
                        '<option value="h2">&lt;h2&gt;</option>'+
                        '<option selected value="h3">&lt;h3&gt;</option>'+
                        '<option value="h4">&lt;h4&gt;</option>'+
                        '<option value="h5">&lt;h5&gt;</option>'+
                        '<option value="div">&lt;div&gt;</option>'+
                        '';
                } else if(data[key].tegh == 'h4') {
                    var tegh = '' +
                        '<option value="h1">&lt;h1&gt;</option>'+
                        '<option value="h2">&lt;h2&gt;</option>'+
                        '<option value="h3">&lt;h3&gt;</option>'+
                        '<option selected value="h4">&lt;h4&gt;</option>'+
                        '<option value="h5">&lt;h5&gt;</option>'+
                        '<option value="div">&lt;div&gt;</option>'+
                        '';
                } else if(data[key].tegh == 'h5') {
                    var tegh = '' +
                        '<option value="h1">&lt;h1&gt;</option>'+
                        '<option value="h2">&lt;h2&gt;</option>'+
                        '<option value="h3">&lt;h3&gt;</option>'+
                        '<option value="h4">&lt;h4&gt;</option>'+
                        '<option selected value="h5">&lt;h5&gt;</option>'+
                        '<option value="div">&lt;div&gt;</option>'+
                        '';
                } else if(data[key].tegh == 'div') {
                    var tegh = '' +
                        '<option value="h1">&lt;h1&gt;</option>'+
                        '<option value="h2">&lt;h2&gt;</option>'+
                        '<option value="h3">&lt;h3&gt;</option>'+
                        '<option value="h4">&lt;h4&gt;</option>'+
                        '<option value="h5">&lt;h5&gt;</option>'+
                        '<option selected value="div">&lt;div&gt;</option>'+
                        '';
                }
            }
            /**/
            if(data[key].template != 'magazine') {
                if (data[key].view == 'list') {
                    var skin = '' +
                        '<option selected value="list">Список</option>' +
                        '<option value="cells">Ячейка</option>' +
                        '<option value="grid">Дота</option>' +
                        '';
                } else if (data[key].view == 'cells') {
                    var skin = '' +
                        '<option value="list">Список</option>' +
                        '<option selected value="cells">Ячейка</option>' +
                        '<option value="grid">Дота</option>' +
                        '';
                } else if (data[key].view == 'grid') {
                    var skin = '' +
                        '<option value="list">Список</option>' +
                        '<option value="cells">Ячейка</option>' +
                        '<option selected value="grid">Дота</option>' +
                        '';
                }
            } else {
                if (data[key].view == 'list') {
                    var skin = '' +
                        '<option selected value="list">Список</option>' +
                        '<option value="cells">Ячейка</option>' +
                        '';
                } else if (data[key].view == 'cells') {
                    var skin = '' +
                        '<option value="list">Список</option>' +
                        '<option selected value="cells">Ячейка</option>' +
                        '';
                } else if (data[key].view == 'grid') {
                    var skin = '' +
                        '<option value="list">Список</option>' +
                        '<option value="cells">Ячейка</option>' +
                        '';
                }
            }
            //
            if(data[key].template == 'one') {
                $('#create_tempalte').append('' +
                    '<div id="form_template'+data[key].template_id+'" class="form_data">'+
                    '<div class="img"></div>'+
                    '<div class="form_block_header mod_header">'+
                    '<div class="left"><span class="pic"></span><span class="text">Одиночный шаблон- '+data[key].template_id+'</span></div>'+
                    '<div class="right">'+
                    '<button type="button" class="btn btn-default" onclick="del_tempalte('+data[key].template_id+', \'set\')" data-whatever="template">'+
                    'Удалить'+
                    '</button>'+
                    '</div>'+
                    '</div>'+
                    '<div class="form-group">'+
                    '<label class="data_hint">Контейнер</label>'+
                    '<div class="input-group">'+
                    '<div class="input-group-btn">'+
                    '<div class="btn pseudo_left">'+
                    '<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '<select name="data[edit]['+data[key].template_id+'][one][container]" class="form-control">'+
                    container+''+
                    '</select>'+
                    '<div class="input-group-btn">'+
                    '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это теги для SEO. Если вы хотите чтоб поисковик не обращял внимание на данный шаблон или у вас всего 1 шаблон, ставьте div. Если в данном шаблоне будет самодостаточная информация и вы хотите чтоб поисковик выделил его отдельно, вставльте article. Если у вас шаблонов несколько и они связаны с темой данного модуля то вставьте им section">'+
                    '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '<div class="form-group">'+
                    '<label for="exampleInputPassword1" class="data_hint">Itemscope itemtype</label>'+
                    '<div class="input-group">'+
                    '<div class="input-group-btn">'+
                    '<div class="btn pseudo_left">'+
                    '<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '<input type="text" name="data[edit]['+data[key].template_id+'][one][itemscope]" class="form-control" value="'+data[key].itemscope+'">'+
                    '<div class="input-group-btn">'+
                    '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это главная микроразметка этого шаблона. Выберите нужную микроразметку из schema.org и вставьте в данное поле. Пример http://schema.org/Product">'+
                    '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '<div class="form-group">'+
                    '<label for="exampleInputPassword1" class="data_hint">Тег загаловка</label>'+
                    '<div class="input-group">'+
                    '<div class="input-group-btn">'+
                    '<div class="btn pseudo_left">'+
                    '<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '<select name="data[edit]['+data[key].template_id+'][one][tegh]" class="form-control">'+
                    tegh+''+
                    '</select>'+
                    '<div class="input-group-btn">'+
                    '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это тег в которым будет загаловок шаблона. Это важный тег SEO, в нем будет находится ключевое слова дающий представление о теме данного шаблона. H1-h5 означает приориетет этого ключевого слова на странице. В странице h1 должен быть только один">'+
                    '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '<div class="form-group">'+
                    '<label for="exampleInputPassword1" class="data_hint">Загаловок</label>'+
                    '<div class="input-group">'+
                    '<div class="input-group-btn">'+
                    '<div class="btn pseudo_left">'+
                    '<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '<input type="text" name="data[edit]['+data[key].template_id+'][one][header]" class="form-control" value="'+data[key].header+'">'+
                    '<div class="input-group-btn">'+
                    '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это загаловок шаблона">'+
                    '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '<div class="form-group">'+
                    '<label for="exampleInputPassword1" class="data_hint">Itemprop</label>'+
                    '<div class="input-group">'+
                    '<div class="input-group-btn">'+
                    '<div class="btn pseudo_left">'+
                    '<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '<input type="text" name="data[edit]['+data[key].template_id+'][one][itemprop]" class="form-control" value="'+data[key].itemprop+'">'+
                    '<div class="input-group-btn">'+
                    '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это дочерная микроразметка для textarea. Выберите нужную микроразметку из schema.org и вставьте в данное поле. Пример ProductModel">'+
                    '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '<div class="form-group">'+
                    '<div class="form-group">'+
                    '<label for="exampleInputPassword1" class="data_hint">Текстовое поле</label>'+
                    '<textarea id="editor'+data[key].template_id+'" name="data[edit]['+data[key].template_id+'][one][text]" class="form-control">'+data[key].text+'</textarea>'+
                    '<script>CKEDITOR.replace(\'editor'+data[key].template_id+'\');</script>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '');
            } else if(data[key].template == 'table') {
                $('#create_tempalte').append(''+
                    '<div id="form_template'+data[key].template_id+'" class="form_data">'+
                    '<div class="img"></div>'+
                    '<div class="form_block_header mod_header">'+
                    '<div class="left"><span class="pic"></span><span class="text">Табличный шаблон - '+data[key].template_id+'</span></div>'+
                    '<div class="right">'+
                    '<button type="button" class="btn btn-default" onclick="del_tempalte('+data[key].template_id+', \'set\')">'+
                    'Удалить'+
                    '</button>'+
                    '</div>'+
                    '</div>'+
                    '<div class="form-group">'+
                    '<label for="exampleInputPassword1" class="data_hint">Контейнер</label>'+
                    '<div class="input-group">'+
                    '<div class="input-group-btn">'+
                    '<div class="btn pseudo_left">'+
                    '<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '<select name="data[edit]['+data[key].template_id+'][table][container]" class="form-control">'+
                    container+''+
                    '</select>'+
                    '<div class="input-group-btn">'+
                    '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это теги для SEO. Если вы хотите чтоб поисковик не обращял внимание на данный шаблон или у вас всего 1 шаблон, ставьте div. Если в данном шаблоне будет самодостаточная информация и вы хотите чтоб поисковик выделил его отдельно, вставльте article. Если у вас шаблонов несколько и они связаны с темой данного модуля то вставьте им section">'+
                    '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '<div class="form-group">'+
                    '<label for="exampleInputPassword1" class="data_hint">Itemscope itemtype</label>'+
                    '<div class="input-group">'+
                    '<div class="input-group-btn">'+
                    '<div class="btn pseudo_left">'+
                    '<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '<input type="text" name="data[edit]['+data[key].template_id+'][table][itemscope]" class="form-control" value="'+data[key].itemscope+'">'+
                    '<div class="input-group-btn">'+
                    '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это главная микроразметка этого шаблона. Выберите нужную микроразметку из schema.org и вставьте в данное поле. Пример http://schema.org/Product">'+
                    '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '<div class="form-group">'+
                    '<label for="exampleInputPassword1" class="data_hint">Тег загаловка</label>'+
                    '<div class="input-group">'+
                    '<div class="input-group-btn">'+
                    '<div class="btn pseudo_left">'+
                    '<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '<select name="data[edit]['+data[key].template_id+'][table][tegh]" class="form-control">'+
                    tegh+''+
                    '</select>'+
                    '<div class="input-group-btn">'+
                    '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это тег в которым будет загаловок шаблона. Это важный тег SEO, в нем будет находится ключевое слова дающий представление о теме данного шаблона. H1-h5 означает приориетет этого ключевого слова на странице. В странице h1 должен быть только один">'+
                    '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '<div class="form-group">'+
                    '<label for="exampleInputPassword1" class="data_hint">Загаловок</label>'+
                    '<div class="input-group">'+
                    '<div class="input-group-btn">'+
                    '<div class="btn pseudo_left">'+
                    '<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '<input type="text" name="data[edit]['+data[key].template_id+'][table][header]" class="form-control" value="'+data[key].header+'">'+
                    '<div class="input-group-btn">'+
                    '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это загаловок шаблона">'+
                    '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '<div class="form-group">'+
                    '<label for="exampleInputPassword1" class="data_hint">Вид</label>'+
                    '<div class="input-group">'+
                    '<div class="input-group-btn">'+
                    '<div class="btn pseudo_left">'+
                    '<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '<select name="data[edit]['+data[key].template_id+'][table][view]" class="form-control">'+
                    skin+''+
                    '</select>'+
                    '<div class="input-group-btn">'+
                    '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Данные в табличном шаблоне могут отображатся в трех видах. Здесь указывается вид который будет идти по умолчанию при загрузке страницы.">'+
                    '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '<div class="panel panel-default">'+
                    '<div class="panel-heading">'+
                    '<div class="left">Подкатегорий</div>'+
                    '<div class="right">'+
                    '<button type="button" onclick="create_subcat('+data[key].template_id+', \'table\', \'edit\')" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="Добавляет подкатегорию в данный шаблон. Подкатегорию можно и не добавлять. Она нужна если потребуется сортировка данных">'+
                    'Добавить'+
                    '</button>'+
                    '</div>'+
                    '</div>'+
                    '<div class="panel-body">'+
                    '<div id="subcat'+data[key].template_id+'"></div>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '');
                for (var cat_key in cat) {
                    if(data[key].template_id == cat[cat_key].template_id) {
                        create_subcat(data[key].template_id, 'table', 'set', cat[cat_key]);
                    }
                }
            } else if(data[key].template == 'gal') {
                $('#create_tempalte').append(''+
                    '<div id="form_template'+data[key].template_id+'" class="form_data">'+
                    '<div class="img"></div>'+
                    '<div class="form_block_header mod_header">'+
                    '<div class="left"><span class="pic"></span><span class="text">Галерейный шаблон - '+data[key].template_id+'</span></div>'+
                    '<div class="right">'+
                    '<button type="button" class="btn btn-default" onclick="del_tempalte('+data[key].template_id+', \'set\')">'+
                    'Удалить'+
                    '</button>'+
                    '</div>'+
                    '</div>'+
                    '<div class="form-group">'+
                    '<label for="exampleInputPassword1" class="data_hint">Контейнер</label>'+
                    '<div class="input-group">'+
                    '<div class="input-group-btn">'+
                    '<div class="btn pseudo_left">'+
                    '<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '<select name="data[edit]['+data[key].template_id+'][gal][container]" class="form-control">'+
                    container+''+
                    '</select>'+
                    '<div class="input-group-btn">'+
                    '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это теги для SEO. Если вы хотите чтоб поисковик не обращял внимание на данный шаблон или у вас всего 1 шаблон, ставьте div. Если в данном шаблоне будет самодостаточная информация и вы хотите чтоб поисковик выделил его отдельно, вставльте article. Если у вас шаблонов несколько и они связаны с темой данного модуля то вставьте им section">'+
                    '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '<div class="form-group">'+
                    '<label for="exampleInputPassword1" class="data_hint">Itemscope itemtype</label>'+
                    '<div class="input-group">'+
                    '<div class="input-group-btn">'+
                    '<div class="btn pseudo_left">'+
                    '<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '<input type="text" name="data[edit]['+data[key].template_id+'][gal][itemscope]" class="form-control" value="'+data[key].itemscope+'">'+
                    '<div class="input-group-btn">'+
                    '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это главная микроразметка этого шаблона. Выберите нужную микроразметку из schema.org и вставьте в данное поле. Пример http://schema.org/Product">'+
                    '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '<div class="form-group">'+
                    '<label for="exampleInputPassword1" class="data_hint">Тег загаловка</label>'+
                    '<div class="input-group">'+
                    '<div class="input-group-btn">'+
                    '<div class="btn pseudo_left">'+
                    '<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '<select name="data[edit]['+data[key].template_id+'][gal][tegh]" class="form-control">'+
                    tegh+''+
                    '</select>'+
                    '<div class="input-group-btn">'+
                    '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это тег в которым будет загаловок шаблона. Это важный тег SEO, в нем будет находится ключевое слова дающий представление о теме данного шаблона. H1-h5 означает приориетет этого ключевого слова на странице. В странице h1 должен быть только один">'+
                    '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '<div class="form-group">'+
                    '<label for="exampleInputPassword1" class="data_hint">Загаловок</label>'+
                    '<div class="input-group">'+
                    '<div class="input-group-btn">'+
                    '<div class="btn pseudo_left">'+
                    '<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '<input type="text" name="data[edit]['+data[key].template_id+'][gal][header]" class="form-control" value="'+data[key].header+'">'+
                    '<div class="input-group-btn">'+
                    '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это загаловок шаблона">'+
                    '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '<div class="panel panel-default">'+
                    '<div class="panel-heading">'+
                    '<div class="left">Подкатегорий</div>'+
                    '<div class="right">'+
                    '<button type="button" onclick="create_subcat('+data[key].template_id+', \'gal\', \'edit\')" class="btn btn-default" data-toggle="tooltip"data-placement="bottom" title="Добавляет подкатегорию в данный шаблон. Подкатегорию можно и не добавлять. Она нужна если потребуется сортировка данных">'+
                    'Добавить'+
                    '</button>'+
                    '</div>'+
                    '</div>'+
                    '<div class="panel-body">'+
                    '<div id="subcat'+data[key].template_id+'"></div>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '');
                for (var cat_key in cat) {
                    if(data[key].template_id == cat[cat_key].template_id) {
                        create_subcat(data[key].template_id, 'gal', 'set', cat[cat_key]);
                    }
                }
            } else if(data[key].template == 'carusel') {
                $('#create_tempalte').append(''+
                    '<div id="form_template'+data[key].template_id+'" class="form_data">'+
                    '<div class="img"></div>'+
                    '<div class="form_block_header mod_header">'+
                    '<div class="left"><span class="pic"></span><span class="text">Карусельный шаблон - '+data[key].template_id+'</span></div>'+
                    '<div class="right">'+
                    '<button type="button" class="btn btn-default" onclick="del_tempalte('+data[key].template_id+', \'set\')">'+
                    'Удалить'+
                    '</button>'+
                    '</div>'+
                    '</div>'+
                    '<div class="form-group">'+
                    '<label for="exampleInputPassword1" class="data_hint">Контейнер</label>'+
                    '<div class="input-group">'+
                    '<div class="input-group-btn">'+
                    '<div class="btn pseudo_left">'+
                    '<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '<select name="data[edit]['+data[key].template_id+'][carusel][container]" class="form-control">'+
                    container+''+
                    '</select>'+
                    '<div class="input-group-btn">'+
                    '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это теги для SEO. Если вы хотите чтоб поисковик не обращял внимание на данный шаблон или у вас всего 1 шаблон, ставьте div. Если в данном шаблоне будет самодостаточная информация и вы хотите чтоб поисковик выделил его отдельно, вставльте article. Если у вас шаблонов несколько и они связаны с темой данного модуля то вставьте им section">'+
                    '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '<div class="form-group">'+
                    '<label for="exampleInputPassword1" class="data_hint">Itemscope itemtype</label>'+
                    '<div class="input-group">'+
                    '<div class="input-group-btn">'+
                    '<div class="btn pseudo_left">'+
                    '<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '<input type="text" name="data[edit]['+data[key].template_id+'][carusel][itemscope]" class="form-control" value="'+data[key].itemscope+'">'+
                    '<div class="input-group-btn">'+
                    '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это главная микроразметка этого шаблона. Выберите нужную микроразметку из schema.org и вставьте в данное поле. Пример http://schema.org/Product">'+
                    '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '<div class="form-group">'+
                    '<label for="exampleInputPassword1" class="data_hint">Тег загаловка</label>'+
                    '<div class="input-group">'+
                    '<div class="input-group-btn">'+
                    '<div class="btn pseudo_left">'+
                    '<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '<select name="data[edit]['+data[key].template_id+'][carusel][tegh]" class="form-control">'+
                    tegh+''+
                    '</select>'+
                    '<div class="input-group-btn">'+
                    '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это тег в которым будет загаловок шаблона. Это важный тег SEO, в нем будет находится ключевое слова дающий представление о теме данного шаблона. H1-h5 означает приориетет этого ключевого слова на странице. В странице h1 должен быть только один">'+
                    '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '<div class="form-group">'+
                    '<label for="exampleInputPassword1" class="data_hint">Загаловок</label>'+
                    '<div class="input-group">'+
                    '<div class="input-group-btn">'+
                    '<div class="btn pseudo_left">'+
                    '<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '<input type="text" name="data[edit]['+data[key].template_id+'][carusel][header]" class="form-control" value="'+data[key].header+'">'+
                    '<div class="input-group-btn">'+
                    '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это загаловок шаблона. Если вы хотите чтоб у каруселя не было загаловка (не отображался на странице), то оставьте это поле пустым. Такое доступно только для карусельного шаблона.">'+
                    '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '');
            } else if(data[key].template == 'magazine') {
                $('#create_tempalte').append(''+
                    '<div id="form_template'+data[key].template_id+'" class="form_data">'+
                    '<div class="img"></div>'+
                    '<div class="form_block_header mod_header">'+
                    '<div class="left"><span class="pic"></span><span class="text">Интернет магазин - '+data[key].template_id+'</span></div>'+
                    '<div class="right">'+
                    '<button type="button" class="btn btn-default" onclick="del_tempalte('+data[key].template_id+', \'set\')">'+
                    'Удалить'+
                    '</button>'+
                    '</div>'+
                    '</div>'+
                    '<div class="form-group">'+
                    '<label for="exampleInputPassword1" class="data_hint">Контейнер</label>'+
                    '<div class="input-group">'+
                    '<div class="input-group-btn">'+
                    '<div class="btn pseudo_left">'+
                    '<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '<select name="data[edit]['+data[key].template_id+'][magazine][container]" class="form-control">'+
                    container+''+
                    '</select>'+
                    '<div class="input-group-btn">'+
                    '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это теги для SEO. Если вы хотите чтоб поисковик не обращял внимание на данный шаблон или у вас всего 1 шаблон, ставьте div. Если в данном шаблоне будет самодостаточная информация и вы хотите чтоб поисковик выделил его отдельно, вставльте article. Если у вас шаблонов несколько и они связаны с темой данного модуля то вставьте им section">'+
                    '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '<div class="form-group">'+
                    '<label for="exampleInputPassword1" class="data_hint">Itemscope itemtype</label>'+
                    '<div class="input-group">'+
                    '<div class="input-group-btn">'+
                    '<div class="btn pseudo_left">'+
                    '<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '<input type="text" name="data[edit]['+data[key].template_id+'][magazine][itemscope]" class="form-control" value="'+data[key].itemscope+'">'+
                    '<div class="input-group-btn">'+
                    '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это главная микроразметка этого шаблона. Выберите нужную микроразметку из schema.org и вставьте в данное поле. Пример http://schema.org/Product">'+
                    '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '<div class="form-group">'+
                    '<label for="exampleInputPassword1" class="data_hint">Тег загаловка</label>'+
                    '<div class="input-group">'+
                    '<div class="input-group-btn">'+
                    '<div class="btn pseudo_left">'+
                    '<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '<select name="data[edit]['+data[key].template_id+'][magazine][tegh]" class="form-control">'+
                    tegh+''+
                    '</select>'+
                    '<div class="input-group-btn">'+
                    '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это тег в которым будет загаловок шаблона. Это важный тег SEO, в нем будет находится ключевое слова дающий представление о теме данного шаблона. H1-h5 означает приориетет этого ключевого слова на странице. В странице h1 должен быть только один">'+
                    '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '<div class="form-group">'+
                    '<label for="exampleInputPassword1" class="data_hint">Загаловок</label>'+
                    '<div class="input-group">'+
                    '<div class="input-group-btn">'+
                    '<div class="btn pseudo_left">'+
                    '<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '<input type="text" name="data[edit]['+data[key].template_id+'][magazine][header]" class="form-control" value="'+data[key].header+'">'+
                    '<div class="input-group-btn">'+
                    '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это загаловок шаблона">'+
                    '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '<div class="form-group">'+
                    '<label for="exampleInputPassword1" class="data_hint">Вид</label>'+
                    '<div class="input-group">'+
                    '<div class="input-group-btn">'+
                    '<div class="btn pseudo_left">'+
                    '<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '<select name="data[edit]['+data[key].template_id+'][magazine][view]" class="form-control">'+
                    skin+''+
                    '</select>'+
                    '<div class="input-group-btn">'+
                    '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Данные в табличном шаблоне могут отображатся в трех видах. Здесь указывается вид который будет идти по умолчанию при загрузке страницы.">'+
                    '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '<div class="panel panel-default">'+
                    '<div class="panel-heading">'+
                    '<div class="left">Категорий</div>'+
                    '<div class="right">'+
                    '<button type="button" class="btn btn-default" data-toggle="tooltip"data-placement="bottom" title="Категорий помагают удобно отсортировывать товары по свойствам. Обязательно добавляйте категорий чтоб создать удобства пользователям" onclick="create_subcat_magazine('+data[key].template_id+', \'edit\')">'+
                    'Добавить'+
                    '</button>'+
                    '</div>'+
                    '</div>'+
                    '<div class="panel-body">'+
                    '<div id="subcat_magazine'+data[key].template_id+'">'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '</div>'+
                    '');
                for (var cat_key in cat) {
                    if(data[key].template_id == cat[cat_key].template_id) {
                        create_subcat_magazine(data[key].template_id, 'set', cat[cat_key]);
                        for (var properties_key in properties) {
                            if(cat[cat_key].id == properties[properties_key].cat_id) {
                                create_subcat_magazine_properties(properties[properties_key].id, cat[cat_key].id, 'set', properties[properties_key], data[key].template_id);
                            }
                        }
                    }
                }
            }
        }
    }
}
function del_tempalte(id, set) {
    if(set === undefined) {
        $('#form_template'+id).remove();
        $('#delete').modal('hide');
    } else if(set == 'set') {
        $('#delete').on('show.bs.modal', function () {
            var modal = $(this)
            modal.find('.modal-body').text('Вы собираетесь удалить существующий шаблон. При удалений удалятся данные у этого шаблона');
            modal.find('#delete').attr('onclick', 'del_template_ajax('+id+')');
        });
        $('#delete').modal('toggle');
    }
}
function del_template_ajax(id) {
    console.log(id);
    $.ajax({
        url: '/ajax/del_template',
        type: "POST",
        cache: false,
        data: {id: id}
    });
    window.location.reload();
}

//Subcats template admin/module/add
subcat_table = 0;
subcat_gal = 0;
function create_subcat(id, template, set, cat) {
    if (set === undefined) {
        if(template == 'table') {
            subcat_table = subcat_table+1;
            $('#subcat'+id).append('' +
                '<div id="subcat_table'+subcat_table+'" class="input-group">'+
                '<input type="text" class="form-control" name="data[insert]['+id+']['+template+'][subcat]['+subcat_table+']">'+
                '<div class="input-group-btn">'+
                '<button class="btn btn-default" type="button" onclick="del_subcat('+subcat_table+', \'table\')">'+
                '<span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span>'+
                '</button>'+
                '</div>'+
                '</div>'+
                '');
        } else if(template == 'gal') {
            subcat_gal = subcat_gal+1;
            $('#subcat'+id).append('' +
                '<div id="subcat_gal'+subcat_gal+'" class="input-group">'+
                '<input type="text" class="form-control" name="data[insert]['+id+']['+template+'][subcat]['+subcat_gal+']">'+
                '<div class="input-group-btn">'+
                '<button class="btn btn-default" type="button" onclick="del_subcat('+subcat_gal+', \'gal\')">'+
                '<span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span>'+
                '</button>'+
                '</div>'+
                '</div>'+
                '');
        }
    } else if(set == 'set') {
        if(template == 'table') {
            $('#subcat'+id).append('' +
                '<div id="subcat_table'+cat.id+'" class="input-group">'+
                '<input type="text" class="form-control" name="data[edit]['+id+']['+template+'][subcat]['+cat.id+']" value="'+cat.cat+'">'+
                '<div class="input-group-btn">'+
                '<button class="btn btn-default" type="button" onclick="del_subcat('+cat.id+', \'table\', \'set\')">'+
                '<span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span>'+
                '</button>'+
                '</div>'+
                '</div>'+
                '');
        } else if(template == 'gal') {
            $('#subcat'+id).append('' +
                '<div id="subcat_gal'+cat.id+'" class="input-group">'+
                '<input type="text" class="form-control" name="data[edit]['+id+']['+template+'][subcat]['+cat.id+']" value="'+cat.cat+'">'+
                '<div class="input-group-btn">'+
                '<button class="btn btn-default" type="button" onclick="del_subcat('+cat.id+', \'gal\', \'set\')">'+
                '<span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span>'+
                '</button>'+
                '</div>'+
                '</div>'+
                '');
        }
    } else if(set == 'edit') {
        if(template == 'table') {
            subcat_table = subcat_table+1;
            $('#subcat'+id).append('' +
                '<div id="subcat_table'+subcat_table+'" class="input-group">'+
                '<input type="text" class="form-control" name="data[edit_insert]['+id+']['+template+'][subcat]['+subcat_table+']">'+
                '<div class="input-group-btn">'+
                '<button class="btn btn-default" type="button" onclick="del_subcat('+subcat_table+', \'table\')">'+
                '<span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span>'+
                '</button>'+
                '</div>'+
                '</div>'+
                '');
        } else if(template == 'gal') {
            subcat_gal = subcat_gal+1;
            $('#subcat'+id).append('' +
                '<div id="subcat_gal'+subcat_gal+'" class="input-group">'+
                '<input type="text" class="form-control" name="data[edit_insert]['+id+']['+template+'][subcat]['+subcat_gal+']">'+
                '<div class="input-group-btn">'+
                '<button class="btn btn-default" type="button" onclick="del_subcat('+subcat_gal+', \'gal\')">'+
                '<span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span>'+
                '</button>'+
                '</div>'+
                '</div>'+
                '');
        }
    }
}
function del_subcat(id, template, set) {
    if(set === undefined) {
        if(template == 'table') {
            $('#subcat_table'+id).remove();
        } else if(template == 'gal') {
            $('#subcat_gal'+id).remove();
        }
        $('#delete').modal('hide');
    } else if(set == 'set'){
        $('#delete').on('show.bs.modal', function () {
            var modal = $(this)
            modal.find('.modal-body').text('Вы собираетесь удалить подкатегорию. При удалений данные этой подкатегорий перейдут на обшую категорию');
            modal.find('#delete').attr('onclick', 'del_subcat_ajax('+id+')');
        });
        $('#delete').modal('toggle');
    }
}
function del_subcat_ajax(id, template) {
    $.ajax({
        url: '/ajax/del_subcat',
        type: "POST",
        cache: false,
        data: {id: id}
    });
    window.location.reload();
}

//Subcats_magazine template admin/module/add
subcat_magazine = 0;
subcat_magazine_properties = 0;
function create_subcat_magazine(id, set, cat) {
    if (set === undefined) {
        subcat_magazine = subcat_magazine+1;
        $('#subcat_magazine'+id).append('' +
            '<div id="subcat_magazine_input'+subcat_magazine+'" class="input-group">'+
            '<div class="input-group-btn">'+
            '<button class="btn btn-default" type="button" data-toggle="tooltip" data-placement="top" title="Создайте свойства по которым будет идти сортировка на странице. Пример: Категория - Тип процессора. Далле идут свойства которых можно выбирать - Corei7, Corei5, Corei3, AMD и т.д" onclick="create_subcat_magazine_properties('+subcat_magazine+', '+id+')">'+
            '<span class="glyphicon glyphicon-check" aria-hidden="true"></span>'+
            '</button>'+
            '</div>'+
            '<input type="text" class="form-control" name="data[insert]['+id+'][magazine][subcat]['+subcat_magazine+']">'+
            '<div class="input-group-btn">'+
            '<button class="btn btn-default" type="button" type="button" data-toggle="tooltip" data-placement="top" title="Удалить категорию" onclick="del_subcat_magazine('+subcat_magazine+')">'+
            '<span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span>'+
            '</button>'+
            '</div>'+
            '</div>'+
            '<div id="subcat_magazine_properties'+subcat_magazine+'"></div>'+
            '');
    } else if(set == 'set') {
        $('#subcat_magazine'+id).append('' +
            '<div id="subcat_magazine_input'+cat.id+'" class="input-group">'+
            '<div class="input-group-btn">'+
            '<button class="btn btn-default" type="button" data-toggle="tooltip" data-placement="top" title="Создайте свойства по которым будет идти сортировка на странице. Пример: Категория - Тип процессора. Далее идут свойства которых можно выбирать - Corei7, Corei5, Corei3, AMD и т.д" onclick="create_subcat_magazine_properties('+cat.id+', '+id+', \'edit\')">'+
            '<span class="glyphicon glyphicon-check" aria-hidden="true"></span>'+
            '</button>'+
            '</div>'+
            '<input type="text" class="form-control" name="data[edit]['+id+'][magazine][subcat]['+cat.id+']" value="'+cat.cat+'">'+
            '<div class="input-group-btn">'+
            '<button class="btn btn-default" type="button" type="button" data-toggle="tooltip" data-placement="top" title="Удалить категорию" onclick="del_subcat_magazine('+cat.id+', \'set\')">'+
            '<span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span>'+
            '</button>'+
            '</div>'+
            '</div>'+
            '<div id="subcat_magazine_properties'+cat.id+'"></div>'+
            '');
    } else if(set == 'edit') {
        subcat_magazine = subcat_magazine+1;
        $('#subcat_magazine'+id).append('' +
            '<div id="subcat_magazine_input'+subcat_magazine+'" class="input-group">'+
            '<div class="input-group-btn">'+
            '<button class="btn btn-default" type="button" data-toggle="tooltip" data-placement="top" title="Создайте свойства по которым будет идти сортировка на странице. Пример: Категория - Тип процессора. Далле идут свойства которых можно выбирать - Corei7, Corei5, Corei3, AMD и т.д" onclick="create_subcat_magazine_properties('+subcat_magazine+', '+id+',\'edit\')">'+
            '<span class="glyphicon glyphicon-check" aria-hidden="true"></span>'+
            '</button>'+
            '</div>'+
            '<input type="text" class="form-control" name="data[edit_insert]['+id+'][magazine][subcat]['+subcat_magazine+']">'+
            '<div class="input-group-btn">'+
            '<button class="btn btn-default" type="button" type="button" data-toggle="tooltip" data-placement="top" title="Удалить категорию" onclick="del_subcat_magazine('+subcat_magazine+')">'+
            '<span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span>'+
            '</button>'+
            '</div>'+
            '</div>'+
            '<div id="subcat_magazine_properties'+subcat_magazine+'"></div>'+
            '');
    }
}
function del_subcat_magazine(id, set) {
    if(set === undefined) {
        $('#subcat_magazine_input'+id).remove();
        $('#subcat_magazine_properties'+id).remove();
        $('#delete').modal('hide');
    } else if(set == 'set'){
        $('#delete').on('show.bs.modal', function () {
            var modal = $(this)
            modal.find('.modal-body').text('Вы собираетесь удалить подкатегорию');
            modal.find('#delete').attr('onclick', 'del_subcat_magazine_ajax('+id+')');
        });
        $('#delete').modal('toggle');
    }
}
function del_subcat_magazine_ajax(id) {
    $.ajax({
        url: '/ajax/del_subcat_magazine',
        type: "POST",
        cache: false,
        data: {id: id}
    });
    window.location.reload();
}

function create_subcat_magazine_properties(id, prev_id, set, properties, tempalte_id) {
    if (set === undefined) {
        subcat_magazine_properties = subcat_magazine_properties+1;
        $('#subcat_magazine_properties'+id).append('' +
            '<div id="magazine_properties'+subcat_magazine_properties+'" class="properties">'+
            '<div class="input-group">'+
            '<input type="text" class="form-control" placeholder="Количество ядер, Память ОЗУ, Цвет одежды, Бренд, Форм-фактор и тому подобные вещи" name="data[insert]['+prev_id+'][magazine][properties]['+id+']['+subcat_magazine_properties+']">'+
            '<div class="input-group-btn">'+
            '<button class="btn btn-default" type="button" type="button" data-toggle="tooltip" data-placement="top" title="Удалить свойства" onclick="del_subcat_magazine_properties('+subcat_magazine_properties+')">'+
            '<span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span>'+
            '</button>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '');
    } else if(set == 'set'){
        $('#subcat_magazine_properties'+prev_id).append('' +
            '<div id="magazine_properties'+id+'" class="properties">'+
            '<div class="input-group">'+
            '<input type="text" class="form-control" placeholder="Количество ядер, Память ОЗУ, Цвет одежды, Бренд, Форм-фактор и тому подобные вещи" name="data[edit]['+tempalte_id+'][magazine][properties]['+prev_id+']['+id+']" value="'+properties.properties+'">'+
            '<div class="input-group-btn">'+
            '<button class="btn btn-default" type="button" type="button" data-toggle="tooltip" data-placement="top" title="Удалить свойства" onclick="del_subcat_magazine_properties('+id+', \'set\')">'+
            '<span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span>'+
            '</button>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '');
    } else if(set == 'edit') {
        subcat_magazine_properties = subcat_magazine_properties+1;
        $('#subcat_magazine_properties'+id).append('' +
            '<div id="magazine_properties'+subcat_magazine_properties+'" class="properties">'+
            '<div class="input-group">'+
            '<input type="text" class="form-control" placeholder="Количество ядер, Память ОЗУ, Цвет одежды, Бренд, Форм-фактор и тому подобные вещи" name="data[edit_insert]['+prev_id+'][magazine][properties]['+id+']['+subcat_magazine_properties+']">'+
            '<div class="input-group-btn">'+
            '<button class="btn btn-default" type="button" type="button" data-toggle="tooltip" data-placement="top" title="Удалить свойства" onclick="del_subcat_magazine_properties('+subcat_magazine_properties+')">'+
            '<span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span>'+
            '</button>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '');
    }
}
function del_subcat_magazine_properties(id, set) {
    if(set === undefined) {
        $('#magazine_properties'+id).remove();
        $('#delete').modal('hide');
    } else if(set == 'set'){
        $('#delete').on('show.bs.modal', function () {
            var modal = $(this)
            modal.find('.modal-body').text('Вы собираетесь удалить свойства подкатегорий');
            modal.find('#delete').attr('onclick', 'del_properties_ajax('+id+')');
        });
        $('#delete').modal('toggle');
    }
}
function del_properties_ajax(id) {
    $.ajax({
        url: '/ajax/del_subcat_properties',
        type: "POST",
        cache: false,
        data: {id: id}
    });
    window.location.reload();
}

//Magazine
pics = 0;
function magazine_pics(set, gallery) {
    if(set === undefined) {
        pics = pics+1;
        $('#magazine_pics').append('' +
            '<div id="pics'+pics+'" class="magazine_pics">'+
            '<button class="btn btn-default" type="button" onclick="magazine_pics_del('+pics+')">Удалить</button>'+
            '<div class="form-group">'+
            '<label for="exampleInputPassword1" class="hint">Мини Картина</label>'+
            '<div class="input-group">'+
            '<div class="input-group-btn">'+
            '<div class="btn pseudo_left">'+
            '<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '<!-->'+
            '<div class="form-control">'+
            '<button type="button" class="btn btn-default" onclick="crop_open(\'magazine_mini\','+pics+',\'Мини\', \'magazine\', \'mini\');">Выбрать</button>'+
            '</div>'+
            '<!-->'+
            '<div class="input-group-btn">'+
            '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это картина отобразаится в панеле быстрого доступа товара">'+
            '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '<button type="button" class="spoiler" onclick="spoiler(\''+pics+'\', \'magazine\', \'mini\')">Показать картину</button>'+
            '<div id="insert_mini'+pics+'" class="cropend"></div>'+
            '</div>'+
            '<!-- ------------------------------------ -->'+
            '<div class="form-group">'+
            '<label for="exampleInputPassword1" class="hint">Превью Картина</label>'+
            '<div class="input-group">'+
            '<div class="input-group-btn">'+
            '<div class="btn pseudo_left">'+
            '<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '<!-->'+
            '<div class="form-control">'+
            '<button type="button" class="btn btn-default" onclick="crop_open(\'magazine\','+pics+',\'Мини\', \'magazine\', \'preview\');">Выбрать</button>'+
            '</div>'+
            '<!-->'+
            '<div class="input-group-btn">'+
            '<div id="form_seo" class="btn pseudo" data-toggle="tooltip" data-placement="bottom" title="Это картина будет представлять товар. Отсюда берется полная картина товара">'+
            '<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '<button type="button" class="spoiler" onclick="spoiler(\''+pics+'\', \'magazine\', \'preview\')">Показать картину</button>'+
            '<div id="insert_preview'+pics+'" class="cropend"></div>'+
            '</div>'+
            '');
    } else if(set == 'set'){
        for (var key in gallery) {
            $('#magazine_pics').append('' +
                '<div id="pics' + gallery[key].id + '" class="magazine_pics mod_magazine_pics">' +
                '<button class="btn btn-primary" type="button" onclick="magazine_pics_del(' + gallery[key].id + ', \'set\')">Удалить картину - № '+ gallery[key].id+'</button>' +
                '<!-- ------------------------------------ -->' +
                '<div class="form-group">' +
                '<label for="exampleInputPassword1" class="hint">Мини Картина</label>' +
                '<button type="button" class="spoiler" onclick="spoiler(\'' + gallery[key].id + '\', \'magazine\', \'edit_mini\')">Показать картину</button>' +
                '<div id="insert_edit_mini' + gallery[key].id + '" class="cropend"></div>' +
                '</div>' +
                '<!-- ------------------------------------ -->' +
                '<div class="form-group">' +
                '<label for="exampleInputPassword1" class="hint">Превью Картина</label>' +
                '<button type="button" class="spoiler" onclick="spoiler(\'' + gallery[key].id + '\', \'magazine\', \'edit_preview\')">Показать картину</button>' +
                '<div id="insert_edit_preview' + gallery[key].id + '" class="cropend"></div>' +
                '</div>' +
            '');
        }
    }
}
function magazine_pics_del(id, set) {
    if(set === undefined) {
        $('#pics'+id).remove();
    } else if(set == 'set') {
        $('#delete').on('show.bs.modal', function () {
            var modal = $(this)
            modal.find('.modal-body').text('Вы собираетесь удалить картину. При удалений удалится мини, превью и полная катина');
            modal.find('#delete_button').attr('onclick', 'magazine_pics_ajax('+id+')');
        });
        $('#delete').modal('toggle');
    }
}
function magazine_pics_ajax(id) {
    $.ajax({
        url: '/ajax/del_img',
        type: "POST",
        cache: false,
        data: {id: id}
    });
    window.location.reload();
}
function set_review(img_id, data_id) {
    $('.magazine_preview'+data_id).css("display","none");
    $('#preview'+img_id).css("display","block");
}
function create_magazine_panel(template_id, header, module_id, module_name, gal_json) {
    var panel = $('#panel_create');
    $.ajax({
        url: '/ajax/magazine_properties',
        type: "POST",
        cache: false,
        data: {activate: 'ok'},
        success: function (msg) {
            var matches = msg.match(/dovahkin(.*)go/i);
            var magazine_properties = JSON.parse(matches[1]);
            $.ajax({
                url: '/ajax/magazine_cat',
                type: "POST",
                cache: false,
                data: {template_id: template_id},
                success: function (msg) {
                    var match = msg.match(/dovahkin(.*)go/i);
                    var data = JSON.parse(match[1]);
                    if(data !== null) {
                        var panel_create = $('<div>', { class: 'panel_create' }).appendTo('#panel_create');
                        var header_magazine = $('<div>', { class: 'panel_header_magazine' }).appendTo(panel_create);
                        $('<div>', { class: 'top_create' }).appendTo(header_magazine);
                        var center_create = $('<div>', { class: 'center_create' }).appendTo(header_magazine);
                        $('<span>', { text: header }).appendTo(center_create);
                        $('<div>', { class: 'bottom_create' }).appendTo(header_magazine);
                        var create_block = $('<div>', { id: 'create_block'+template_id+'', class: 'create_block' }).appendTo(panel_create);
                        for (var key in data) {
                            $('<div>', { class: 'cat_header', text: data[key].cat }).appendTo(create_block);
                            var panel_block_magazine = $('<div>', { id: 'panel_magazine_block'+data[key].id+'' }).appendTo(create_block);
                            for (var prop in magazine_properties) {
                                if (data[key].id == magazine_properties[prop].cat_id) {
                                    var cat_block = $('<div>', { class: 'cat_block' }).appendTo(panel_block_magazine);
                                    var input = $('<input>', { type: 'checkbox', onchange: 'click_get('+template_id+','+data[key].id+', '+magazine_properties[prop].id+', \''+magazine_properties[prop].properties+'\', '+match[1]+', '+matches[1]+', '+module_id+', \''+module_name+'\', \''+gal_json+'\')'}).appendTo(cat_block);
                                    input.attr('data-prop', magazine_properties[prop].id);
                                    $('<p>', { class: 'text', text: magazine_properties[prop].properties }).appendTo(cat_block);
                                }
                            }
                        }
                        var create_block = $('<div>', { class: 'line' }).appendTo(panel_create);
                    }
                }
            });
        }
    });
}
function shop_prop (id) {
    $('#init_panel').empty();
    var panel = $('#panel_create');
    $.ajax({
        url: '/ajax/magazine_filter',
        type: "POST",
        cache: false,
        data: {data_id: id},
        success: function (msg) {
            var matches = msg.match(/dovahkin(.*)go/i);
            var prop = JSON.parse(matches[1]);

            var panel_create = $('<div>', { class: 'panel_create' }).appendTo(panel);
            var header_magazine = $('<div>', { class: 'panel_header_magazine' }).appendTo(panel_create);
            $('<div>', { class: 'top_create' }).appendTo(header_magazine);
            var center_create = $('<div>', { class: 'center_create' }).appendTo(header_magazine);
            $('<span>', { text: 'Свойства' }).appendTo(center_create);
            $('<div>', { class: 'bottom_create' }).appendTo(header_magazine);
            for(var key in prop) {
                var shop_proporties = $('<div>', { class: 'shop_proporties' }).appendTo(panel_create);
                $('<div>', { class: 'prop_left' }).appendTo(shop_proporties);
                $('<div>', { class: 'prop_right', text: ''+prop[key].properties+'' }).appendTo(shop_proporties);
            }
            $('<div>', { class: 'death_knight' }).appendTo(panel_create);
            var shop_prop_price = $('<div>', { class: 'shop_prop_price' }).appendTo(panel_create);
            $('<div>', { class: 'left_t' }).appendTo(shop_prop_price);
            var currency = $('<div>', { class: 'center_t', text: '200' }).appendTo(shop_prop_price);
            $('<span>', { class: 'currency', text: 'рб' }).appendTo(currency);
            $('<div>', { class: 'right_t' }).appendTo(shop_prop_price);
            var button = $('<button>', { type: 'button', class: 'shop_basket_button' }).appendTo(panel_create);
            $('<span>', { text: 'В Корзину' }).appendTo(button);
        }
    });
}
function modal_magazine(data_id, name ,price, des, gallery, buy) {

    $('.modal-body_magazine').empty();
    var modal = $('.modal-body_magazine');

    modal.html('' +
        '<div class="modal_main_header">' +
            '<div class="bn_left"></div>' +
            '<div class="bn_center">'+name+'</div>' +
            '<div class="bn_right"></div>' +
            '<div class="bn_modile"><span>'+name+'</span></div>' +
        '</div>');
    var gal = JSON.parse(gallery);

    $.ajax({
        url: '/ajax/magazine_filter',
        type: "POST",
        cache: false,
        data: {data_id: data_id},
        success: function (msg) {
            var matches = msg.match(/dovahkin(.*)go/i);
            var prop = JSON.parse(matches[1]);

            var left = $('<div>', {class: 'left_magazine'}).appendTo(modal);
            var slide_carusel = $('<div>', {class: 'slide_carusel modal_slide_carusel'}).appendTo(left);
            var carousel = $('<div>', {id: 'carousel-example-generic', class: 'carousel modal_carousel'}).appendTo(slide_carusel);
            carousel.attr('data-ride','carousel');
            var carousel_indicators = $('<ol>', {class: 'carousel-indicators modal_carousel-indicators'}).appendTo(carousel);
            for(var indicators in gal) {
                if(gal[indicators].data_id == data_id) {
                    var info = $('<div>', {class: 'info'}).appendTo(carousel_indicators);
                    info.attr('data-target', '#carousel-example-generic');
                    info.attr('data-slide-to', '' + gal[indicators].id + '');
                    var span_ident = $('<span>', {class: 'glyphicon glyphicon-tint'}).appendTo(info);
                    span_ident.attr('aria-hidden', 'true');
                }
            }
            var carousel_inner = $('<div>', {class: 'carousel-inner', role: 'listbox'}).appendTo(carousel);
            for(var gal_item in gal) {
                if(gal[gal_item].data_id == data_id) {
                    var item = $('<div>', {class: 'item jQueryZoomerModal'}).appendTo(carousel_inner);
                    $('<img>', {src: '' + gal[gal_item].img + ''}).appendTo(item);
                }
            }
            if(item.length == 1) {
                item[0].className += ' active';
            } else {
                item[Math.floor(Math.random() * 2)].className += ' active';
            }
            carousel.append('' +
                '<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">'+
                '<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>'+
                '<span class="sr-only">Previous</span>'+
                '</a>'+
                '<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">'+
                '<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>'+
                '<span class="sr-only">Next</span>'+
                '</a>'+
            '');
            var shop_text = $('<div>', {class: 'shop_text'}).appendTo(left);
            shop_text.html(des);
            var right = $('<div>', {class: 'right_magazine'}).appendTo(modal);
            var panel_header_magazine = $('<div>', {class: 'panel_header_magazine'}).appendTo(right);
            $('<div>', {class: 'top_create'}).appendTo(panel_header_magazine);
            var center_create = $('<div>', {class: 'center_create'}).appendTo(panel_header_magazine);
            $('<span>', {text: 'Свойства'}).appendTo(center_create);
            $('<div>', {class: 'bottom_create'}).appendTo(panel_header_magazine);
            for (var prop_key in prop) {
                var shop_proporties = $('<div>', {class: 'shop_proporties mod_modal'}).appendTo(right);
                $('<div>', {class: 'prop_left'}).appendTo(shop_proporties);
                $('<div>', {class: 'prop_right', text: ''+prop[prop_key].properties+''}).appendTo(shop_proporties);
            }
            $('<div>', { class: 'death_knight' }).appendTo(right);
            var shop_prop_price = $('<div>', { class: 'shop_prop_price' }).appendTo(right);
            $('<div>', { class: 'left_t' }).appendTo(shop_prop_price);
            var center_t = $('<div>', { class: 'center_t', text: ''+price+'' }).appendTo(shop_prop_price);
            $('<span>', { class: 'currency', text: 'рб' }).appendTo(center_t);
            $('<div>', { class: 'right_t' }).appendTo(shop_prop_price);
            var button = $('<button>', { type: 'button', class: 'shop_basket_button', onclick: 'add_buy('+data_id+', '+buy+')' }).appendTo(right);
            $('<span>', { text: 'В Корзину' }).appendTo(button);

            //Zoomer
            $('.jQueryZoomerModal').zoom();
            $('#modal_magazine').modal('toggle');
        }
    });
}
function goods_quantity_top(id) {
    var quantity = $('#goods_quantity'+id);
    var num = quantity.text();
    var sum = quantity.text(Number(num)+1);
    $('#goods_quantity_set'+id).val(sum.text());
}
function goods_quantity_bottom(id) {
    var quantity = $('#goods_quantity'+id);
    var num = quantity.text();
    if(quantity.text() != 1) {
        var sum = quantity.text(Number(num)-1);
        $('#goods_quantity_set'+id).val(sum.text());
    }
}

function add_buy(id, user_id) {
    $.ajax({
        url: '/ajax/buy',
        type: "POST",
        cache: false,
        data: {order_id: id, user_id: user_id},
        success: function (msg) {
            cls();
            setTimeout(function () {
                show_info('ok', 'Товар в корзину был успешно добавлен');
            },100)
        }
    });
}
function ordering_show(show) {
    var pickup = $('#pickup');
    var courier = $('#courier');
    if(show == 'pickup') {
        courier.slideUp({duratation: 400, done: function () {
            courier.css('display', 'none');
            pickup.css('display', 'block');
        }});
        setTimeout(function() {
            pickup.slideDown(400);
        },300);
    } else if(show == 'courier') {
        pickup.slideUp({duratation: 400, done: function () {
                pickup.css('display', 'none');
                courier.css('display', 'block');
            }});
        setTimeout(function() {
            courier.slideDown(600);
        },300);
    }
}
function payment_show(show) {
    var cash = $('#cash');
    var cart = $('#cart');
    var web_money = $('#web_money');
    if(show == 'cash') {
        cart.empty();
        web_money.empty();
        cash.slideDown(400);
    } else if(show == 'cart') {
        cash.slideUp({duratation: 400, done: function () {
                cash.css('display', 'none');
        }});
        cart.empty();
        web_money.empty();
        cart.append('<input type="hidden" name="transfer" value="cart">');
    } else if(show == 'web_money') {
        cash.slideUp({duratation: 400, done: function () {
                cash.css('display', 'none');
        }});
        cart.empty();
        web_money.empty();
        web_money.append('<input type="hidden" name="transfer" value="web">');
    }
}
function ordering_goods(get_id, get_sum) {
    var id = JSON.parse(get_id);
    var sum = JSON.parse(get_sum);
    $('#init_panel').empty();
    var panel = $('#panel_create');

    var panel_create = $('<div>', { class: 'panel_create' }).appendTo(panel);
    var header_magazine = $('<div>', { class: 'panel_header_magazine' }).appendTo(panel_create);
    $('<div>', { class: 'top_create' }).appendTo(header_magazine);
    var center_create = $('<div>', { class: 'center_create' }).appendTo(header_magazine);
    $('<span>', { text: 'Товары' }).appendTo(center_create);
    $('<div>', { class: 'bottom_create' }).appendTo(header_magazine);
    for(var id_key in id) {
        var ordering_panel = $('<div>', { class: 'ordering_panel' }).appendTo(panel_create);
        var order_top = $('<div>', { class: 'order_top' }).appendTo(ordering_panel);
        var left = $('<div>', { class: 'left' }).appendTo(order_top);
        $('<img>', { src: id[id_key].mini, alt: id[id_key].name }).appendTo(left);
        $('<div>', { class: 'right', text: id[id_key].name }).appendTo(order_top);
        var order_bottom = $('<div>', { class: 'order_bottom' }).appendTo(ordering_panel);
        $('<div>', { class: 'left', text: id[id_key].quantity+' шт' }).appendTo(order_bottom);
        $('<div>', { class: 'right', text: id[id_key].price+ ' рб' }).appendTo(order_bottom);
    }
    $('<div>', { class: 'death_knight' }).appendTo(panel_create);
    var shop_prop_price = $('<div>', { class: 'shop_prop_price' }).appendTo(panel_create);
    $('<div>', { class: 'left_t' }).appendTo(shop_prop_price);
    var currency = $('<div>', { class: 'center_t', text: sum }).appendTo(shop_prop_price);
    $('<span>', { class: 'currency', text: ' рб' }).appendTo(currency);
    $('<div>', { class: 'right_t' }).appendTo(shop_prop_price);
}
function delete_good(id, data_id, user_id) {
    $.ajax({
        url: '/ajax/buy',
        type: "POST",
        cache: false,
        data: {order_del_id: data_id, user_del_id: user_id},
        success: function (msg) {
            $('[data-good'+id+']').remove();
        }
    });
}
function switch_pay(id, switch_good) {
    if(switch_good == 'cash') {
        $.ajax({
            url: '/ajax/pay_switch',
            type: "POST",
            cache: false,
            data: {id: id, pay_switch: 'cash'},
            success: function (msg) {
                var match = msg.match(/dovahkin(.*)go/i);
                cls();
                setTimeout(function () {
                    show_info('ok', 'Теперь мы ждем от вас оплаты наличными');
                },100);
            }
        });
    } else if(switch_good == 'transfer') {
        $.ajax({
            url: '/ajax/pay_switch',
            type: "POST",
            cache: false,
            data: {id: id, pay_switch: 'transfer'},
            success: function (msg) {
                var match = msg.match(/dovahkin(.*)go/i);
                cls();
                setTimeout(function () {
                    show_info('ok', 'Теперь мы ждем от вас оплаты переводом');
                },100);
            }
        });
    }
}

prev_prop = [];
function click_get(template_id, cat_id, prop_id, prop_text, full_cat, full_properties, module_id, module_name, gal_json) {
    var full_cat_in = JSON.stringify(full_cat);
    var full_properties_in = JSON.stringify(full_properties);
    var create_block = $('#create_block'+template_id);
    var cat_block_get = $('#panel_magazine_block'+cat_id);
    create_block.slideUp(700);

    setTimeout(function () {
        for (var full_cat_key in full_cat) {
            $('#panel_magazine_block' + full_cat[full_cat_key].id).empty();
        }
        $.ajax({
            url: '/ajax/magazine_filter',
            type: "POST",
            cache: false,
            data: {prop_id: prop_id},
            success: function (msg) {
                var match = msg.match(/dovahkin(.*)go/i);
                var data = JSON.parse(match[1]);

                //site
                if(data !== null) {
                    var shift_ids = [];
                    for (var id_shift in data) {
                        shift_ids.unshift(data[id_shift].data_id);
                    }
                    var ids = shift_ids.join();
                    $('[data-skin_list' + template_id + ']').remove();
                    $('[data-skin_cells' + template_id + ']').remove();
                    $.ajax({
                        url: '/ajax/magazine_filter',
                        type: "POST",
                        cache: false,
                        data: {ids: ids},
                        success: function (msg) {
                            var match = msg.match(/dovahkin(.*)go/i);
                            var data = JSON.parse(match[1]);

                            var gal_decode = JSON.parse(gal_json);
                            $('#magazine_default' + template_id).remove();
                            $('#button_magazine_list' + template_id).attr('onclick', 'view_system(\'list_magazine\', ' + match[1] + ', \'' + module_id + '\', \'' + module_name + '\', \'' + template_id + '\', \'\', \'\', \''+gal_json+'\')');
                            $('#button_magazine_cells' + template_id).attr('onclick', 'view_system(\'cells_magazine\', ' + match[1] + ', \'' + module_id + '\', \'' + module_name + '\', \'' + template_id + '\', \'\', \'\', \''+gal_json+'\')');

                            if (view_system_click_magazine == 'list_magazine') {
                                for (var key in data) {
                                    var table_list = $('<div>', {class: 'table_list'}).appendTo($('#magazine_create' + template_id));
                                    table_list.attr('data-skin_list' + template_id, '');
                                    $('<input>', {
                                        type: 'checkbox',
                                        name: 'ids[]',
                                        value: '' + data[key].id + ''
                                    }).appendTo(table_list);
                                    var a = $('<a>', {
                                        href: '' + module_name + '/edit&id=' + data[key].id + '&module_id=' + module_id + '&template_id=' + template_id + '&template=magazine',
                                        class: 'btn btn-primary'
                                    }).appendTo(table_list);
                                    var span = $('<span>', {class: 'glyphicon glyphicon-edit'}).appendTo(a);
                                    span.attr('aria-hidden', 'true');
                                    var table_block_list = $('<div>', {class: 'table_block_list'}).appendTo(table_list);
                                    var temp_table = $('<div>', {class: 'temp_table list_skin_tmp'}).appendTo(table_block_list);
                                    $('<div>', {class: 'tree1'}).appendTo(temp_table);
                                    $('<div>', {class: 'tree2'}).appendTo(temp_table);
                                    $('<div>', {class: 'img'}).appendTo(temp_table);
                                    $('<div>', {class: 'death_knight'}).appendTo(temp_table);
                                    var a1 = $('<a>', {href: '/'+module_name+'/shop&id='+data[key].id+'&template='+template_id+'', class: 'magazine_button'}).appendTo(temp_table);
                                    $('<span>', {text: 'Подробнее'}).appendTo(a1);
                                    var block = $('<div>', {class: 'block'}).appendTo(temp_table);
                                    var left_magazine = $('<div>', {class: 'left_magazine'}).appendTo(block);
                                    var top_magazine = $('<div>', {class: 'top_magazine'}).appendTo(left_magazine);
                                    var hidden_button = $('<div>', {class: 'hidden_button'}).appendTo(top_magazine);
                                    var button = $('<button>', {
                                        type: 'button',
                                        class: 'button',
                                        text: 'Быстрый',
                                        onclick: 'modal_magazine('+data[key].id+', \''+data[key].name+'\', '+data[key].price+', \''+JSON.stringify(data[key].des)+'\', \''+JSON.stringify(gal_decode)+'\');'
                                    }).appendTo(hidden_button);
                                    button.attr('data-toggle', 'modal');
                                    button.attr('data-target', '#myModal');
                                    $('<span>', {text: 'Просмотр'}).appendTo(button);
                                    var preview_nav = $('<div>', {class: 'preview_nav'}).appendTo(top_magazine);
                                    var navigate = $('<div>', {class: 'navigate'}).appendTo(preview_nav);
                                    $('<div>', {
                                        class: 'pointer_top',
                                        onclick: 'nextSlide(' + data[key].id + ')'
                                    }).appendTo(navigate);
                                    var dota_mini_block = $('<div>', {
                                        id: 'dota_mini_block' + data[key].id + '',
                                        class: 'preview_block'
                                    }).appendTo(navigate);
                                    var dota_mini_slider = $('<ul>', {id: 'dota_mini_slider' + data[key].id + ''}).appendTo(dota_mini_block);
                                    for (var mini_gal in gal_decode) {
                                        if (gal_decode[mini_gal].data_id == data[key].id) {
                                            var li = $('<li>', {
                                                id: 'mini_bn' + gal_decode[mini_gal].id + '',
                                                class: 'bn',
                                                onclick: 'set_review(' + gal_decode[mini_gal].id + ',' + data[key].id + ')'
                                            }).appendTo(dota_mini_slider);
                                            $('<img>', {src: '' + gal_decode[mini_gal].mini + ''}).appendTo(li);
                                        }
                                    }
                                    $('<div>', {
                                        class: 'pointer_bottom',
                                        onclick: 'prevSlide(' + data[key].id + ')'
                                    }).appendTo(navigate);
                                    $('<div>', {class: 'clearfix'}).appendTo(top_magazine);
                                    var preview = $('<div>', {class: 'preview'}).appendTo(top_magazine);
                                    for (var mini_gal in gal_decode) {
                                        if (gal_decode[mini_gal].data_id == data[key].id) {
                                            $('<img>', {
                                                class: 'magazine_preview' + data[key].id + '',
                                                id: 'preview' + gal_decode[mini_gal].id + '',
                                                src: '' + gal_decode[mini_gal].preview + '',
                                                alt: 'dota' + gal_decode[mini_gal].id + ''
                                            }).appendTo(preview);
                                        }
                                    }
                                    //init_preview
                                    var gal_ids = [];
                                    for (var gal_key in gal_decode) {
                                        if(data[key].id == gal_decode[gal_key].data_id) {
                                            gal_ids.unshift(gal_decode[gal_key].id);
                                        }
                                    }
                                    $('#preview'+gal_ids[0]).css('display', 'block');
                                    //
                                    var rigth = $('<div>', {class: 'rigth'}).appendTo(block);
                                    $('<a>', {
                                        class: 'header',
                                        href: '/' + module_name + '/shop&id=' + data[key].id + '&template=' + template_id + '',
                                        text: '' + data[key].name + ''
                                    }).appendTo(rigth);
                                    var magazine_text = $('<div>', {class: 'magazine_text'}).appendTo(rigth);
                                    magazine_text.append(data[key].des);
                                    var magazine_block = $('<div>', {class: 'magazine_block'}).appendTo(rigth);
                                    var top_pic = $('<div>', {class: 'top_pic'}).appendTo(magazine_block);
                                    $('<div>', {class: 'pic_left'}).appendTo(top_pic);
                                    $('<div>', {class: 'pic_center'}).appendTo(top_pic);
                                    $('<div>', {class: 'pic_right'}).appendTo(top_pic);
                                    var basket_price = $('<div>', {class: 'basket_price'}).appendTo(magazine_block);
                                    var magazine_art = $('<div>', {
                                        class: 'magazine_art',
                                        text: '' + data[key].id + ''
                                    }).appendTo(basket_price);
                                    magazine_art.attr('data-toggle', 'tooltip');
                                    magazine_art.attr('data-placement', 'bottom');
                                    magazine_art.attr('title', 'tooltip');
                                    magazine_art.attr('data-original-title', 'Артикул');
                                    var price = $('<div>', {class: 'price'}).appendTo(basket_price);
                                    $('<div>', {class: 'left_t'}).appendTo(price);
                                    var center_t = $('<div>', {
                                        class: 'center_t',
                                        text: '' + data[key].price + ''
                                    }).appendTo(price);
                                    $('<span>', {class: 'currency', text: ' рб'}).appendTo(center_t);
                                    $('<div>', {class: 'right_t'}).appendTo(price);
                                    $('<button>', {type: 'button', class: 'basket'}).appendTo(basket_price);
                                }
                            } else if (view_system_click_magazine == 'cells_magazine') {
                                for (var key in data) {
                                    var table_cells = $('<div>', {class: 'table_cells'}).appendTo($('#magazine_create' + template_id));
                                    table_cells.attr('data-skin_cells' + template_id, '');
                                    var table_block_cells = $('<div>', {class: 'table_block_cells'}).appendTo(table_cells);
                                    $('<input>', {
                                        type: 'checkbox',
                                        name: 'ids[]',
                                        value: '' + data[key].id + ''
                                    }).appendTo(table_block_cells);
                                    var a = $('<a>', {
                                        href: '' + module_name + '/edit&id=' + data[key].id + '&module_id=' + module_id + '&template_id=' + template_id + '&template=magazine',
                                        class: 'btn btn-primary'
                                    }).appendTo(table_block_cells);
                                    var span = $('<span>', {class: 'glyphicon glyphicon-edit'}).appendTo(a);
                                    span.attr('aria-hidden', 'true');
                                    var temp_magazine = $('<div>', {class: 'temp_magazine'}).appendTo(table_block_cells);
                                    $('<div>', {class: 'tree1'}).appendTo(temp_magazine);
                                    $('<div>', {class: 'tree2_magazine'}).appendTo(temp_magazine);
                                    $('<div>', {class: 'tree3_magazine'}).appendTo(temp_magazine);
                                    $('<div>', {class: 'magazine_img'}).appendTo(temp_magazine);
                                    $('<div>', {class: 'img mod'}).appendTo(temp_magazine);
                                    $('<div>', {class: 'death_knight'}).appendTo(temp_magazine);
                                    var block = $('<div>', {class: 'block'}).appendTo(temp_magazine);
                                    var art = $('<div>', {class: 'art', text: 'Артикул: '}).appendTo(block);
                                    $('<span>', {text: '' + data[key].id + ''}).appendTo(art);
                                    var top_magazine = $('<div>', {class: 'top_magazine'}).appendTo(block);
                                    var hidden_button = $('<div>', {class: 'hidden_button'}).appendTo(top_magazine);
                                    var button = $('<button>', {
                                        type: 'button',
                                        class: 'button',
                                        text: 'Быстрый',
                                        onclick: 'modal_magazine('+data[key].id+', \''+data[key].name+'\', '+data[key].price+', \''+JSON.stringify(data[key].des)+'\', \''+JSON.stringify(gal_decode)+'\');'
                                    }).appendTo(hidden_button);
                                    button.attr('data-toggle', 'modal');
                                    button.attr('data-target', '#myModal');
                                    $('<span>', {text: 'Просмотр'}).appendTo(button);
                                    var preview_nav = $('<div>', {class: 'preview_nav'}).appendTo(top_magazine);
                                    var navigate = $('<div>', {class: 'navigate'}).appendTo(preview_nav);
                                    $('<div>', {
                                        class: 'pointer_top',
                                        onclick: 'nextSlide(' + data[key].id + ')'
                                    }).appendTo(navigate);
                                    var dota_mini_block = $('<div>', {
                                        id: 'dota_mini_block' + data[key].id + '',
                                        class: 'preview_block'
                                    }).appendTo(navigate);
                                    var dota_mini_slider = $('<ul>', {id: 'dota_mini_slider' + data[key].id + ''}).appendTo(dota_mini_block);
                                    for (var mini_gal in gal_decode) {
                                        if (gal_decode[mini_gal].data_id == data[key].id) {
                                            var li = $('<li>', {
                                                id: 'mini_bn' + gal_decode[mini_gal].id + '',
                                                class: 'bn',
                                                onclick: 'set_review(' + gal_decode[mini_gal].id + ',' + data[key].id + ')'
                                            }).appendTo(dota_mini_slider);
                                            $('<img>', {src: '' + gal_decode[mini_gal].mini + ''}).appendTo(li);
                                        }
                                    }
                                    $('<div>', {
                                        class: 'pointer_bottom',
                                        onclick: 'prevSlide(' + data[key].id + ')'
                                    }).appendTo(navigate);
                                    $('<div>', {class: 'clearfix'}).appendTo(top_magazine);
                                    var preview = $('<div>', {class: 'preview'}).appendTo(top_magazine);
                                    for (var mini_gal in gal_decode) {
                                        if (gal_decode[mini_gal].data_id == data[key].id) {
                                            $('<img>', {
                                                class: 'magazine_preview' + data[key].id + '',
                                                id: 'preview' + gal_decode[mini_gal].id + '',
                                                src: '' + gal_decode[mini_gal].preview + '',
                                                alt: 'dota' + gal_decode[mini_gal].id + ''
                                            }).appendTo(preview);
                                        }
                                    }
                                    //init_preview
                                    var gal_ids = [];
                                    for (var gal_key in gal_decode) {
                                        if(data[key].id == gal_decode[gal_key].data_id) {
                                            gal_ids.unshift(gal_decode[gal_key].id);
                                        }
                                    }
                                    $('#preview'+gal_ids[0]).css('display', 'block');
                                    //
                                    var bottom = $('<div>', {class: 'bottom'}).appendTo(block);
                                    $('<a>', {
                                        class: 'header',
                                        href: '/' + module_name + '/shop&id=' + data[key].id + '&template=' + template_id + '',
                                        text: '' + data[key].name + ''
                                    }).appendTo(bottom);
                                    var top_pic = $('<div>', {class: 'top_pic'}).appendTo(bottom);
                                    $('<div>', {class: 'pic_left'}).appendTo(top_pic);
                                    $('<div>', {class: 'pic_center'}).appendTo(top_pic);
                                    $('<div>', {class: 'pic_right'}).appendTo(top_pic);
                                    var magazine_text = $('<div>', {class: 'text_magazine'}).appendTo(bottom);
                                    magazine_text.append(data[key].des);
                                    $('<div>', {class: 'bottom_pic'}).appendTo(bottom);
                                    $('<div>', {class: 'magazine_block'}).appendTo(bottom);
                                    var basket_price = $('<div>', {class: 'basket_price'}).appendTo(bottom);
                                    var price = $('<div>', {class: 'price'}).appendTo(basket_price);
                                    $('<div>', {class: 'left_t'}).appendTo(price);
                                    var center_t = $('<div>', {
                                        class: 'center_t',
                                        text: '' + data[key].price + ''
                                    }).appendTo(price);
                                    $('<span>', {class: 'currency', text: ' рб'}).appendTo(center_t);
                                    $('<div>', {class: 'right_t'}).appendTo(price);
                                    $('<button>', {type: 'button', class: 'basket'}).appendTo(basket_price);
                                    var a_button = $('<a>', {href: '/'+module_name+'/shop&id='+data[key].id+'&template='+template_id+'', class: 'magazine_button'}).appendTo(bottom);
                                    $('<span>', {text: 'Подробнее'}).appendTo(a_button);
                                }
                            }
                        }
                    });
                } else {
                   $('[data-skin_list' + template_id + ']').remove();
                   $('[data-skin_cells' + template_id + ']').remove();
                   $('#magazine_default' + template_id).remove();
                }

                //nagivate
                if (data === null) {
                    for (var full_cat_key in full_cat) {
                        var panel_magazine_block = $('#panel_magazine_block' + full_cat[full_cat_key].id);
                        var cat_block = $('<div>', {class: 'cat_block'}).appendTo(panel_magazine_block);
                        $('<p>', {
                            class: 'text',
                            text: 'Пусто'
                        }).appendTo(cat_block);
                    }
                    cat_block_get.empty();
                    var cat_block = $('<div>', {class: 'cat_block'}).appendTo(cat_block_get);
                    var input = $('<input>', {
                        type: 'checkbox',
                        checked: 'checked',
                        onchange: 'click_out(' + template_id + ', ' + cat_id + ', ' + full_cat_in + ',' + full_properties_in + ', ' + module_id + ', \'' + module_name + '\', \'' + gal_json + '\')'
                    }).appendTo(cat_block);
                    input.attr('data-filter' + template_id + '', prop_id);
                    $('<p>', {class: 'text', text: prop_text}).appendTo(cat_block);

                    create_block.slideDown(500);
                } else {
                    for (var data_key in data) {
                        $.ajax({
                            url: '/ajax/magazine_filter',
                            type: "POST",
                            cache: false,
                            data: {data_id: data[data_key].data_id},
                            success: function (msg) {
                                var matches = msg.match(/dovahkin(.*)go/i);
                                var prop = JSON.parse(matches[1]);
                                for (var full_cat_key in full_cat) {
                                    var panel_magazine_block = $('#panel_magazine_block' + full_cat[full_cat_key].id);
                                    for (var prop_key in prop) {
                                        if (full_cat[full_cat_key].id == prop[prop_key].cat_id) {
                                            if (jQuery.inArray(Number(prop[prop_key].prop_id), prev_prop) == -1) {
                                                prev_prop.unshift(Number(prop[prop_key].prop_id));
                                                var cat_block = $('<div>', {class: 'cat_block'}).appendTo(panel_magazine_block);
                                                var input = $('<input>', {
                                                    type: 'checkbox',
                                                    onchange: 'click_get(' + template_id + ', ' + full_cat[full_cat_key].id + ', '+prop[prop_key].prop_id + ', \'' + prop[prop_key].properties + '\', ' + full_cat_in + ', ' + full_properties_in + ', '+module_id+', \''+module_name+'\', \''+gal_json+'\')'
                                                }).appendTo(cat_block);
                                                input.attr('data-prop', prop[prop_key].prop_id);
                                                $('<p>', {
                                                    class: 'text',
                                                    text: prop[prop_key].properties
                                                }).appendTo(cat_block);
                                            }
                                        }
                                    }
                                }

                                cat_block_get.empty();
                                var cat_block = $('<div>', {class: 'cat_block'}).appendTo(cat_block_get);
                                var input = $('<input>', {
                                    type: 'checkbox',
                                    checked: 'checked',
                                    onchange: 'click_out(' + template_id + ', ' + cat_id + ', ' + full_cat_in + ',' + full_properties_in + ', '+module_id+', \''+module_name+'\', \''+gal_json+'\')'
                                }).appendTo(cat_block);
                                input.attr('data-filter' + template_id + '', prop_id);
                                $('<p>', {class: 'text', text: prop_text}).appendTo(cat_block);

                                create_block.slideDown(500);
                            }
                        });
                    }
                }
                prev_prop = [];
            }

        });
    },850);
}
function click_out(template_id, cat_id, full_cat, full_properties, module_id, module_name, gal_json) {
    var full_cat_in = JSON.stringify(full_cat);
    var full_properties_in = JSON.stringify(full_properties);
    var create_block = $('#create_block'+template_id);
    var gal_decode = JSON.parse(gal_json);
    create_block.slideUp(700);

    setTimeout(function() {
        create_block.empty();
        for(var cat in full_cat) {
            $('<div>', { class: 'cat_header', text: full_cat[cat].cat }).appendTo(create_block);
            var panel_magazine_block = $('<div>', {id: 'panel_magazine_block'+ full_cat[cat].id }).appendTo(create_block);
            for(var prop in full_properties) {
                if(full_cat[cat].id == full_properties[prop].cat_id) {
                    var cat_block = $('<div>', {class: 'cat_block'}).appendTo(panel_magazine_block);
                    var input = $('<input>', {
                        type: 'checkbox',
                        onchange: 'click_get(' + template_id + ', ' + full_cat[cat].id + ', ' + full_properties[prop].id + ', \'' + full_properties[prop].properties + '\', ' + full_cat_in + ', ' + full_properties_in + ', '+module_id+', \''+module_name+'\', \''+gal_json+'\')'
                    }).appendTo(cat_block);
                    input.attr('data-prop', full_properties[prop].prop_id);
                    $('<p>', {
                        class: 'text',
                        text: full_properties[prop].properties
                    }).appendTo(cat_block);
                }
            }
        }
        $.ajax({
            url: '/ajax/magazine_filter',
            type: "POST",
            cache: false,
            data: {template_id: template_id},
            success: function (msg) {
                var match = msg.match(/dovahkin(.*)go/i);
                var data = JSON.parse(match[1]);

                var data_list = $('[data-skin_list'+template_id+']');
                var data_cells = $('[data-skin_cells'+template_id+']');

                $('#button_magazine_list' + template_id).attr('onclick', 'view_system(\'list_magazine\', ' + match[1] + ', \'' + module_id + '\', \'' + module_name + '\', \'' + template_id + '\', \'\', \'\', \''+gal_json+'\')');
                $('#button_magazine_cells' + template_id).attr('onclick', 'view_system(\'cells_magazine\', ' + match[1] + ', \'' + module_id + '\', \'' + module_name + '\', \'' + template_id + '\', \'\', \'\', \''+gal_json+'\')');

                if(view_system_click_magazine == 'list_magazine') {
                    data_cells.remove();
                    data_list.remove();
                    for (var key in data) {
                            var table_list = $('<div>', {class: 'table_list'}).appendTo($('#magazine_create' + template_id));
                            table_list.attr('data-skin_list' + template_id, '');
                            $('<input>', {
                                type: 'checkbox',
                                name: 'ids[]',
                                value: '' + data[key].id + ''
                            }).appendTo(table_list);
                            var a = $('<a>', {
                                href: '' + module_name + '/edit&id=' + data[key].id + '&module_id=' + module_id + '&template_id=' + template_id + '&template=magazine',
                                class: 'btn btn-primary'
                            }).appendTo(table_list);
                            var span = $('<span>', {class: 'glyphicon glyphicon-edit'}).appendTo(a);
                            span.attr('aria-hidden', 'true');
                            var table_block_list = $('<div>', {class: 'table_block_list'}).appendTo(table_list);
                            var temp_table = $('<div>', {class: 'temp_table list_skin_tmp'}).appendTo(table_block_list);
                            $('<div>', {class: 'tree1'}).appendTo(temp_table);
                            $('<div>', {class: 'tree2'}).appendTo(temp_table);
                            $('<div>', {class: 'img'}).appendTo(temp_table);
                            $('<div>', {class: 'death_knight'}).appendTo(temp_table);
                            var a1 = $('<a>', {href: '/'+module_name+'/shop&id='+data[key].id+'&template='+template_id+'', class: 'magazine_button'}).appendTo(temp_table);
                            $('<span>', {text: 'Подробнее'}).appendTo(a1);
                            var block = $('<div>', {class: 'block'}).appendTo(temp_table);
                            var left_magazine = $('<div>', {class: 'left_magazine'}).appendTo(block);
                            var top_magazine = $('<div>', {class: 'top_magazine'}).appendTo(left_magazine);
                            var hidden_button = $('<div>', {class: 'hidden_button'}).appendTo(top_magazine);
                            var button = $('<button>', {
                                type: 'button',
                                class: 'button',
                                text: 'Быстрый',
                                onclick: 'modal_magazine('+data[key].id+', \''+data[key].name+'\', '+data[key].price+', \''+JSON.stringify(data[key].des)+'\', \''+JSON.stringify(gal_decode)+'\');'
                            }).appendTo(hidden_button);
                            button.attr('data-toggle', 'modal');
                            button.attr('data-target', '#myModal');
                            $('<span>', {text: 'Просмотр'}).appendTo(button);
                            var preview_nav = $('<div>', {class: 'preview_nav'}).appendTo(top_magazine);
                            var navigate = $('<div>', {class: 'navigate'}).appendTo(preview_nav);
                            $('<div>', {
                                class: 'pointer_top',
                                onclick: 'nextSlide(' + data[key].id + ')'
                            }).appendTo(navigate);
                            var dota_mini_block = $('<div>', {
                                id: 'dota_mini_block' + data[key].id + '',
                                class: 'preview_block'
                            }).appendTo(navigate);
                            var dota_mini_slider = $('<ul>', {id: 'dota_mini_slider' + data[key].id + ''}).appendTo(dota_mini_block);
                            for (var mini_gal in gal_decode) {
                                if (gal_decode[mini_gal].data_id == data[key].id) {
                                    var li = $('<li>', {
                                        id: 'mini_bn' + gal_decode[mini_gal].id + '',
                                        class: 'bn',
                                        onclick: 'set_review(' + gal_decode[mini_gal].id + ',' + data[key].id + ')'
                                    }).appendTo(dota_mini_slider);
                                    $('<img>', {src: '' + gal_decode[mini_gal].mini + ''}).appendTo(li);
                                }
                            }
                            $('<div>', {
                                class: 'pointer_bottom',
                                onclick: 'prevSlide(' + data[key].id + ')'
                            }).appendTo(navigate);
                            $('<div>', {class: 'clearfix'}).appendTo(top_magazine);
                            var preview = $('<div>', {class: 'preview'}).appendTo(top_magazine);
                            for (var mini_gal in gal_decode) {
                                if (gal_decode[mini_gal].data_id == data[key].id) {
                                    $('<img>', {
                                        class: 'magazine_preview' + data[key].id + '',
                                        id: 'preview' + gal_decode[mini_gal].id + '',
                                        src: '' + gal_decode[mini_gal].preview + '',
                                        alt: 'dota' + gal_decode[mini_gal].id + ''
                                    }).appendTo(preview);
                                }
                            }
                            //init_preview
                            var gal_ids = [];
                            for (var gal_key in gal_decode) {
                                if(data[key].id == gal_decode[gal_key].data_id) {
                                    gal_ids.unshift(gal_decode[gal_key].id);
                                }
                            }
                            $('#preview'+gal_ids[0]).css('display', 'block');
                            //
                            var rigth = $('<div>', {class: 'rigth'}).appendTo(block);
                            $('<a>', {
                                class: 'header',
                                href: '/' + module_name + '/shop&id=' + data[key].id + '&template=' + template_id + '',
                                text: '' + data[key].name + ''
                            }).appendTo(rigth);
                            var magazine_text = $('<div>', {class: 'magazine_text'}).appendTo(rigth);
                            magazine_text.append(data[key].des);
                            var magazine_block = $('<div>', {class: 'magazine_block'}).appendTo(rigth);
                            var top_pic = $('<div>', {class: 'top_pic'}).appendTo(magazine_block);
                            $('<div>', {class: 'pic_left'}).appendTo(top_pic);
                            $('<div>', {class: 'pic_center'}).appendTo(top_pic);
                            $('<div>', {class: 'pic_right'}).appendTo(top_pic);
                            var basket_price = $('<div>', {class: 'basket_price'}).appendTo(magazine_block);
                            var magazine_art = $('<div>', {
                                class: 'magazine_art',
                                text: '' + data[key].id + ''
                            }).appendTo(basket_price);
                            magazine_art.attr('data-toggle', 'tooltip');
                            magazine_art.attr('data-placement', 'bottom');
                            magazine_art.attr('title', 'tooltip');
                            magazine_art.attr('data-original-title', 'Артикул');
                            var price = $('<div>', {class: 'price'}).appendTo(basket_price);
                            $('<div>', {class: 'left_t'}).appendTo(price);
                            var center_t = $('<div>', {
                                class: 'center_t',
                                text: '' + data[key].price + ''
                            }).appendTo(price);
                            $('<span>', {class: 'currency', text: ' рб'}).appendTo(center_t);
                            $('<div>', {class: 'right_t'}).appendTo(price);
                            $('<button>', {type: 'button', class: 'basket'}).appendTo(basket_price);
                        }
                } else if(view_system_click_magazine == 'cells_magazine') {
                    data_cells.remove();
                    data_list.remove();
                    for (var key in data) {
                            var table_cells = $('<div>', { class: 'table_cells' }).appendTo($('#magazine_create' + template_id));
                            table_cells.attr('data-skin_cells'+template_id, '');
                            var table_block_cells = $('<div>', { class: 'table_block_cells' }).appendTo(table_cells);
                            $('<input>', { type: 'checkbox', name: 'ids[]', value: ''+data[key].id+'' }).appendTo(table_block_cells);
                            var a = $('<a>', { href: ''+module_name+'/edit&id='+data[key].id+'&module_id='+module_id+'&template_id='+template_id+'&template=magazine', class: 'btn btn-primary' }).appendTo(table_block_cells);
                            var span = $('<span>', { class: 'glyphicon glyphicon-edit' }).appendTo(a);
                            span.attr('aria-hidden', 'true');
                            var temp_magazine = $('<div>', { class: 'temp_magazine' }).appendTo(table_block_cells);
                            $('<div>', { class: 'tree1' }).appendTo(temp_magazine);
                            $('<div>', { class: 'tree2_magazine' }).appendTo(temp_magazine);
                            $('<div>', { class: 'tree3_magazine' }).appendTo(temp_magazine);
                            $('<div>', { class: 'magazine_img' }).appendTo(temp_magazine);
                            $('<div>', { class: 'img mod' }).appendTo(temp_magazine);
                            $('<div>', { class: 'death_knight' }).appendTo(temp_magazine);
                            var block = $('<div>', { class: 'block' }).appendTo(temp_magazine);
                            var art = $('<div>', { class: 'art', text: 'Артикул: ' }).appendTo(block);
                            $('<span>', { text: ''+data[key].id+'' }).appendTo(art);
                            var top_magazine = $('<div>', { class: 'top_magazine' }).appendTo(block);
                            var hidden_button = $('<div>', { class: 'hidden_button' }).appendTo(top_magazine);
                            var button = $('<button>', { type : 'button', class: 'button', text: 'Быстрый', onclick: 'modal_magazine('+data[key].id+', \''+data[key].name+'\', '+data[key].price+', \''+JSON.stringify(data[key].des)+'\', \''+JSON.stringify(gal_decode)+'\');' }).appendTo(hidden_button);
                            button.attr('data-toggle','modal');
                            button.attr('data-target','#myModal');
                            $('<span>', { text: 'Просмотр' }).appendTo(button);
                            var preview_nav = $('<div>', { class: 'preview_nav' }).appendTo(top_magazine);
                            var navigate = $('<div>', { class: 'navigate' }).appendTo(preview_nav);
                            $('<div>', { class: 'pointer_top', onclick: 'nextSlide('+data[key].id+')' }).appendTo(navigate);
                            var dota_mini_block = $('<div>', { id: 'dota_mini_block'+data[key].id+'', class: 'preview_block' }).appendTo(navigate);
                            var dota_mini_slider = $('<ul>', { id: 'dota_mini_slider'+data[key].id+'' }).appendTo(dota_mini_block);
                            for(var mini_gal in gal_decode) {
                                if(gal_decode[mini_gal].data_id == data[key].id) {
                                    var li = $('<li>', { id: 'mini_bn'+gal_decode[mini_gal].id+'', class: 'bn', onclick: 'set_review('+gal_decode[mini_gal].id+','+data[key].id+')' }).appendTo(dota_mini_slider);
                                    $('<img>', { src: ''+gal_decode[mini_gal].mini+'' }).appendTo(li);
                                }
                            }
                            $('<div>', { class: 'pointer_bottom', onclick: 'prevSlide('+data[key].id+')' }).appendTo(navigate);
                            $('<div>', { class: 'clearfix' }).appendTo(top_magazine);
                            var preview = $('<div>', { class: 'preview' }).appendTo(top_magazine);
                            for(var mini_gal in gal_decode) {
                                if(gal_decode[mini_gal].data_id == data[key].id) {
                                    $('<img>', { class: 'magazine_preview'+data[key].id+'', id: 'preview'+gal_decode[mini_gal].id+'', src: ''+gal_decode[mini_gal].preview+'', alt: 'dota'+gal_decode[mini_gal].id+'' }).appendTo(preview);
                                }
                            }
                            //init_preview
                            var gal_ids = [];
                            for (var gal_key in gal_decode) {
                                if(data[key].id == gal_decode[gal_key].data_id) {
                                    gal_ids.unshift(gal_decode[gal_key].id);
                                }
                            }
                            $('#preview'+gal_ids[0]).css('display', 'block');
                            //
                            var bottom = $('<div>', { class: 'bottom' }).appendTo(block);
                            $('<a>', { class: 'header', href: '/'+module_name+'/shop&id='+data[key].id+'&template='+template_id+'', text: ''+data[key].name+'' }).appendTo(bottom);
                            var top_pic = $('<div>', { class: 'top_pic' }).appendTo(bottom);
                            $('<div>', {class: 'pic_left'}).appendTo(top_pic);
                            $('<div>', {class: 'pic_center'}).appendTo(top_pic);
                            $('<div>', {class: 'pic_right'}).appendTo(top_pic);
                            var magazine_text = $('<div>', { class: 'text_magazine' }).appendTo(bottom);
                            magazine_text.append(data[key].des);
                            $('<div>', { class: 'bottom_pic' }).appendTo(bottom);
                            $('<div>', { class: 'magazine_block' }).appendTo(bottom);
                            var basket_price = $('<div>', { class: 'basket_price' }).appendTo(bottom);
                            var price = $('<div>', { class: 'price' }).appendTo(basket_price);
                            $('<div>', { class: 'left_t' }).appendTo(price);
                            var center_t = $('<div>', { class: 'center_t', text: ''+data[key].price+'' }).appendTo(price);
                            $('<span>', { class: 'currency', text: ' рб' }).appendTo(center_t);
                            $('<div>', { class: 'right_t' }).appendTo(price);
                            $('<button>', { type: 'button', class: 'basket' }).appendTo(basket_price);
                            var a_button = $('<a>', { href: '/'+module_name+'/shop&id='+data[key].id+'&template='+template_id+'', class: 'magazine_button' }).appendTo(bottom);
                            $('<span>', { text: 'Подробнее' }).appendTo(a_button);
                        }
                }
            }
        });
        create_block.slideDown(500);
    },850);
}
function checkOut(id, cat_id, prop_text) {
    var prop = $('#prop'+id);
    if(prop.attr('checked')) {
        $('#prop_block'+id).append('<input type="hidden" name="properties[del]['+cat_id+']['+prop_text+'][]" value="'+id+'">');
    }
}

//Crop Img
canvas = '';
ratio_w = 64;
ratio_h = 64;
function open_img(evt) {
    var file = evt.target.files;
    var f = file[0];
    if (!f.type.match('image.*')) {
        var crop_img = $('#crop_img');
        crop_img.empty();
        crop_img.html('Можно загружать только картину!');
        $('#insert_img').addClass('disabled');
    } else {
        $('#insert_img').removeClass('disabled');
        var reader = new FileReader();
        reader.onload = (function(theFile) {
            return function(e) {
                // OpenImg
                document.getElementById('crop_img').innerHTML = ['<img id="image" src="', e.target.result, '" />'].join('');
                // Cropper
                image = document.getElementById('image');
                if(image != null) {
                    image.addEventListener('crop', function () {
                        canvas = this.cropper.getCroppedCanvas();
                    });
                    var cropper = new Cropper(image, {
                        aspectRatio: ratio_w / ratio_h,
                        viewMode: 2,
                        guides: false,
                        background : false,
                        autoCropArea: 0.6
                    });
                }
                //
            };
        })(f);
        reader.readAsDataURL(f);
    }
}
function crop_open(ratio, id, text, magazine, form) {
    if(ratio == 'mini') {
        ratio_w = 64;
        ratio_h = 64;
    } else if(ratio == 'preview') {
        ratio_w = 179;
        ratio_h = 186;
    } else if(ratio == 'gal') {
        ratio_w = 283;
        ratio_h = 203;
    } else if(ratio == 'carusel') {
        ratio_w = 704;
        ratio_h = 433;
    } else if(ratio == 'magazine_mini') {
        ratio_w = 70;
        ratio_h = 54;
    } else if(ratio == 'magazine') {
        ratio_w = 209;
        ratio_h = 224;
    } else if(ratio == 'avatar') {
        ratio_w = 101;
        ratio_h = 120;
    }
    if(magazine === undefined) {
        $('#crop').on('show.bs.modal', function () {
            var modal = $(this)
            modal.find('.modal-title').text('Выберите изображение и обрежьте его для ' + text + ' картины');
            modal.find('#insert_img').attr('onclick', 'crop_img(\''+ratio+'\', \'' + id + '\')');
        });
        $('#crop').modal('toggle');
    } else if(magazine == 'magazine') {
        $('#crop').on('show.bs.modal', function () {
            var modal = $(this)
            modal.find('.modal-title').text('Выберите изображение и обрежьте его для ' + text + ' картины');
            modal.find('#insert_img').attr('onclick', 'crop_img(\''+ratio+'\', \'' + id + '\', \'magazine\',\''+form+'\')');
        });
        $('#crop').modal('toggle');
    }
}
function crop_img(ratio, id, magazine, form) {
    $('#crop_img').empty();
    $('#upload').prop('value', null);
    if(magazine === undefined) {
        // Удаление преведующего изображение
        var isset = $('.cropend_' + id);
        if (isset.length != 0) {
            isset.remove()
        }
        // Показ
        canvas.toBlob(function (blob) {
            var newImg = document.createElement('img'), url = URL.createObjectURL(blob);

            newImg.setAttribute('class', 'cropend_' + id)
            newImg.onload = function () {
                // no longer need to read the blob so it's revoked
                URL.revokeObjectURL(url);
            };

            newImg.src = url;
            $('#insert_' + id).append(newImg);

        }, 'image/jpeg', 1);
    } else if (magazine == 'magazine') {
        // Удаление преведующего изображение
        var isset = $('.cropend_'+form+'' + id);
        if (isset.length != 0) {
            isset.remove()
        }
        // Показ
        canvas.toBlob(function (blob) {
            var newImg = document.createElement('img'), url = URL.createObjectURL(blob);

            newImg.setAttribute('class', 'cropend_'+form+'' + id);
            newImg.onload = function () {
                // no longer need to read the blob so it's revoked
                URL.revokeObjectURL(url);
            };

            newImg.src = url;

            if (magazine === undefined) {
                $('#insert_' + id).append(newImg);
            } else if (magazine == 'magazine') {
                $('#insert_' + form + '' + id).append(newImg);
            }
        }, 'image/jpeg', 1);
    }

    //Подготовка на отправку в сервер
    var dataURL = canvas.toDataURL();
    if(magazine === undefined) {
        $('#insert_' + id).append('<input type="hidden" class="cropend_' + id + '" name="img[' + id + ']" value="' + dataURL + '">');
        if(ratio == 'gal') {
            $('#insert_' + id).append('<input type="hidden" class="cropend_' + id + '" name="img[full]" value="' + image.getAttribute('src') + '">');
        }
    } else if(magazine == 'magazine') {
        $('#insert_'+form+'' + id).append('<input type="hidden" class="cropend_' + id + '" name="img[pic][' + id + ']['+form+']" value="' + dataURL + '">');
        if(ratio == 'magazine') {
            $('#insert_'+form+'' + id).append('<input type="hidden" class="cropend_' + id + '" name="img[pic]['+id+'][full]" value="' + image.getAttribute('src') + '">');
        }
    }
}
function spoiler(id, magazine, form, has_edit) {
    if(magazine === undefined) {
        var insert = $('#insert_' + id);
        if (insert.css('display') == 'none') {
            insert.slideDown(500);
        } else if (insert.css('display') == 'block') {
            insert.slideUp(300);
        }
    } else if(magazine == 'magazine') {
        var insert = $('#insert_' + form + '' + id);
        if (insert.css('display') == 'none') {
            insert.slideDown(500);
        } else if (insert.css('display') == 'block') {
            insert.slideUp(300);
        }
    }
}
function magazine_gallery(band) {
    if(band !== undefined) {
            for (var key in band) {
                $('#insert_edit_mini' + band[key].id).append('<img src="' + band[key].mini + '" alt="' + band[key].id + '" class="form_pic_view">');
                $('#insert_edit_preview' + band[key].id).append('<img src="' + band[key].preview + '" alt="' + band[key].id + '" class="form_pic_view">');
            }
    }
}

//Validation form
function isValidForm_registration(switching) {
    var login = $('#data_login');
    var pass = $('#data_pass');
    var pass_ex = $('#data_pass_ex');
    var name = $('#data_name');
    var email = $('#data_email');
    var err_login = $('#err_login');
    var err_pass = $('#err_pass');
    var err_pass_ex = $('#err_pass_ex');
    var err_name = $('#err_name');
    var err_email = $('#err_email');
    var error_login = 1;
    var error_pass = 1;
    var error_pass_ex = 1;
    var error_name = 1;
    var error_email = 1;

    if(switching == 'add') {
        //Validate Login
        if(login.val() == '') {
            err_login.css('color', '#ad1616');
            err_login.find('span').removeClass();
            err_login.find('span').addClass('glyphicon glyphicon-remove');

            err_login.attr('data-toggle', 'tooltip');
            err_login.attr('data-placement', 'bottom');
            err_login.attr('title', '');
            err_login.attr('data-original-title', 'Это поле не может быть пустым');
            err_login.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else if(login.val().length < 2) {
            err_login.css('color', '#ad1616');
            err_login.find('span').removeClass();
            err_login.find('span').addClass('glyphicon glyphicon-remove');

            err_login.attr('data-toggle', 'tooltip');
            err_login.attr('data-placement', 'bottom');
            err_login.attr('title', '');
            err_login.attr('data-original-title', 'Слишком короткий логин. Минимальная длина 2');
            err_login.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else if(login.val().length > 20) {
            err_login.css('color', '#ad1616');
            err_login.find('span').removeClass();
            err_login.find('span').addClass('glyphicon glyphicon-remove');

            err_login.attr('data-toggle', 'tooltip');
            err_login.attr('data-placement', 'bottom');
            err_login.attr('title', '');
            err_login.attr('data-original-title', 'Слишком длинный  логин. Максимальная длина 20');
            err_login.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else if(login.val().search( /^[\d\w\-\_]*$/i ) == -1) {
            err_login.css('color', '#ad1616');
            err_login.find('span').removeClass();
            err_login.find('span').addClass('glyphicon glyphicon-remove');

            err_login.attr('data-toggle', 'tooltip');
            err_login.attr('data-placement', 'bottom');
            err_login.attr('title', '');
            err_login.attr('data-original-title', 'Логину нельзя вставить другие символы, кроме указанных');
            err_login.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else {
            err_login.css('color', '#2c5070');
            err_login.find('span').removeClass();
            err_login.find('span').addClass('glyphicon glyphicon-eye-open');

            err_login.removeAttr('data-toggle');
            err_login.removeAttr('data-placement');
            err_login.removeAttr('title');
            err_login.removeAttr('data-original-title');
            error_login = 0;
        }

        //Validate Pass
        if(pass.val() == '') {
            err_pass.css('color', '#ad1616');
            err_pass.find('span').removeClass();
            err_pass.find('span').addClass('glyphicon glyphicon-remove');

            err_pass.attr('data-toggle', 'tooltip');
            err_pass.attr('data-placement', 'bottom');
            err_pass.attr('title', '');
            err_pass.attr('data-original-title', 'Пароль не может быть пустым');
            err_pass.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else if(pass.val().length < 4) {
            err_pass.css('color', '#ad1616');
            err_pass.find('span').removeClass();
            err_pass.find('span').addClass('glyphicon glyphicon-remove');

            err_pass.attr('data-toggle', 'tooltip');
            err_pass.attr('data-placement', 'bottom');
            err_pass.attr('title', '');
            err_pass.attr('data-original-title', 'Слишком короткий пароль. Минимальная длина 4');
            err_pass.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else if(pass.val() != pass_ex.val()) {
            err_pass.css('color', '#ad1616');
            err_pass.find('span').removeClass();
            err_pass.find('span').addClass('glyphicon glyphicon-remove');

            err_pass.attr('data-toggle', 'tooltip');
            err_pass.attr('data-placement', 'bottom');
            err_pass.attr('title', '');
            err_pass.attr('data-original-title', 'Пароли не совпадают');
            err_pass.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else {
            err_pass.css('color', '#2c5070');
            err_pass.find('span').removeClass();
            err_pass.find('span').addClass('glyphicon glyphicon-eye-open');

            err_pass.removeAttr('data-toggle');
            err_pass.removeAttr('data-placement');
            err_pass.removeAttr('title');
            err_pass.removeAttr('data-original-title');
            error_pass = 0;
        }

        //Validate Pass_ex
        if(pass_ex.val() == '') {
            err_pass_ex.css('color', '#ad1616');
            err_pass_ex.find('span').removeClass();
            err_pass_ex.find('span').addClass('glyphicon glyphicon-remove');

            err_pass_ex.attr('data-toggle', 'tooltip');
            err_pass_ex.attr('data-placement', 'bottom');
            err_pass_ex.attr('title', '');
            err_pass_ex.attr('data-original-title', 'Повторите пароль');
            err_pass_ex.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else if(pass.val() != pass_ex.val()) {
            err_pass_ex.css('color', '#ad1616');
            err_pass_ex.find('span').removeClass();
            err_pass_ex.find('span').addClass('glyphicon glyphicon-remove');

            err_pass_ex.attr('data-toggle', 'tooltip');
            err_pass_ex.attr('data-placement', 'bottom');
            err_pass_ex.attr('title', '');
            err_pass_ex.attr('data-original-title', 'Пароли не совпадают');
            err_pass_ex.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else {
            err_pass_ex.css('color', '#2c5070');
            err_pass_ex.find('span').removeClass();
            err_pass_ex.find('span').addClass('glyphicon glyphicon-eye-open');

            err_pass_ex.removeAttr('data-toggle');
            err_pass_ex.removeAttr('data-placement');
            err_pass_ex.removeAttr('title');
            err_pass_ex.removeAttr('data-original-title');
            error_pass_ex = 0;
        }

        //Validate Name
        if(name.val() == '') {
            err_name.css('color', '#ad1616');
            err_name.find('span').removeClass();
            err_name.find('span').addClass('glyphicon glyphicon-remove');

            err_name.attr('data-toggle', 'tooltip');
            err_name.attr('data-placement', 'bottom');
            err_name.attr('title', '');
            err_name.attr('data-original-title', 'Это поле не может быть пустым');
            err_name.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else if(name.val().length < 2) {
            err_name.css('color', '#ad1616');
            err_name.find('span').removeClass();
            err_name.find('span').addClass('glyphicon glyphicon-remove');

            err_name.attr('data-toggle', 'tooltip');
            err_name.attr('data-placement', 'bottom');
            err_name.attr('title', '');
            err_name.attr('data-original-title', 'Слишком короткая имя. Минимальная длина 2');
            err_name.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else if(name.val().length > 20) {
            err_name.css('color', '#ad1616');
            err_name.find('span').removeClass();
            err_name.find('span').addClass('glyphicon glyphicon-remove');

            err_name.attr('data-toggle', 'tooltip');
            err_name.attr('data-placement', 'bottom');
            err_name.attr('title', '');
            err_name.attr('data-original-title', 'Слишком длинная имя. Максимальная длина 20');
            err_name.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else if(name.val().search( /^[a-zа-я\s\-\_]*$/i ) == -1) {
            err_name.css('color', '#ad1616');
            err_name.find('span').removeClass();
            err_name.find('span').addClass('glyphicon glyphicon-remove');

            err_name.attr('data-toggle', 'tooltip');
            err_name.attr('data-placement', 'bottom');
            err_name.attr('title', '');
            err_name.attr('data-original-title', 'Имя не может содержать другие символы, кроме указанных');
            err_name.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else {
            err_name.css('color', '#2c5070');
            err_name.find('span').removeClass();
            err_name.find('span').addClass('glyphicon glyphicon-eye-open');

            err_name.removeAttr('data-toggle');
            err_name.removeAttr('data-placement');
            err_name.removeAttr('title');
            err_name.removeAttr('data-original-title');
            error_name = 0;
        }

        //Validate Email
        if(email.val() == '') {
            err_email.css('color', '#ad1616');
            err_email.find('span').removeClass();
            err_email.find('span').addClass('glyphicon glyphicon-remove');

            err_email.attr('data-toggle', 'tooltip');
            err_email.attr('data-placement', 'bottom');
            err_email.attr('title', '');
            err_email.attr('data-original-title', 'Это поле не может быть пустым');
            err_email.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else if(email.val().search( /^[a-z0-9\-]*@[a-z0-9\-]*\.\w{2,4}$/i ) == -1) {
            err_email.css('color', '#ad1616');
            err_email.find('span').removeClass();
            err_email.find('span').addClass('glyphicon glyphicon-remove');

            err_email.attr('data-toggle', 'tooltip');
            err_email.attr('data-placement', 'bottom');
            err_email.attr('title', '');
            err_email.attr('data-original-title', 'Почта введена не правильно');
            err_email.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else {
            err_email.css('color', '#2c5070');
            err_email.find('span').removeClass();
            err_email.find('span').addClass('glyphicon glyphicon-eye-open');

            err_email.removeAttr('data-toggle');
            err_email.removeAttr('data-placement');
            err_email.removeAttr('title');
            err_email.removeAttr('data-original-title');
            error_email = 0;
        }

        //Test
        if(error_login == 1 || error_pass == 1 || error_pass_ex == 1 || error_name == 1 || error_email == 1) {
            return false;
        }

    } else if(switching == 'edit') {
        var error_pass = 0;
        var error_pass_ex = 0;

        //Validate Pass
        if(pass.val() != '') {
            console.log('ff');
            if (pass.val().length < 4) {
                err_pass.css('color', '#ad1616');
                err_pass.find('span').removeClass();
                err_pass.find('span').addClass('glyphicon glyphicon-remove');

                err_pass.attr('data-toggle', 'tooltip');
                err_pass.attr('data-placement', 'bottom');
                err_pass.attr('title', '');
                err_pass.attr('data-original-title', 'Слишком короткий пароль. Минимальная длина 4');
                err_pass.tooltip({
                    template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
                });
                error_pass = 1;
            } else if (pass.val() != pass_ex.val()) {
                err_pass.css('color', '#ad1616');
                err_pass.find('span').removeClass();
                err_pass.find('span').addClass('glyphicon glyphicon-remove');

                err_pass.attr('data-toggle', 'tooltip');
                err_pass.attr('data-placement', 'bottom');
                err_pass.attr('title', '');
                err_pass.attr('data-original-title', 'Пароли не совпадают');
                err_pass.tooltip({
                    template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
                });
                error_pass = 1;
            } else {
                err_pass.css('color', '#2c5070');
                err_pass.find('span').removeClass();
                err_pass.find('span').addClass('glyphicon glyphicon-eye-open');

                err_pass.removeAttr('data-toggle');
                err_pass.removeAttr('data-placement');
                err_pass.removeAttr('title');
                err_pass.removeAttr('data-original-title');
            }

            //Validate Pass_ex
            if (pass.val() != pass_ex.val()) {
                err_pass_ex.css('color', '#ad1616');
                err_pass_ex.find('span').removeClass();
                err_pass_ex.find('span').addClass('glyphicon glyphicon-remove');

                err_pass_ex.attr('data-toggle', 'tooltip');
                err_pass_ex.attr('data-placement', 'bottom');
                err_pass_ex.attr('title', '');
                err_pass_ex.attr('data-original-title', 'Пароли не совпадают');
                err_pass_ex.tooltip({
                    template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
                });
                error_pass_ex = 1;
            } else {
                err_pass_ex.css('color', '#2c5070');
                err_pass_ex.find('span').removeClass();
                err_pass_ex.find('span').addClass('glyphicon glyphicon-eye-open');

                err_pass_ex.removeAttr('data-toggle');
                err_pass_ex.removeAttr('data-placement');
                err_pass_ex.removeAttr('title');
                err_pass_ex.removeAttr('data-original-title');
            }
        }

        //Validate Name
        if(name.val() == '') {
            err_name.css('color', '#ad1616');
            err_name.find('span').removeClass();
            err_name.find('span').addClass('glyphicon glyphicon-remove');

            err_name.attr('data-toggle', 'tooltip');
            err_name.attr('data-placement', 'bottom');
            err_name.attr('title', '');
            err_name.attr('data-original-title', 'Это поле не может быть пустым');
            err_name.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else if(name.val().length < 2) {
            err_name.css('color', '#ad1616');
            err_name.find('span').removeClass();
            err_name.find('span').addClass('glyphicon glyphicon-remove');

            err_name.attr('data-toggle', 'tooltip');
            err_name.attr('data-placement', 'bottom');
            err_name.attr('title', '');
            err_name.attr('data-original-title', 'Слишком короткая имя. Минимальная длина 2');
            err_name.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else if(name.val().length > 20) {
            err_name.css('color', '#ad1616');
            err_name.find('span').removeClass();
            err_name.find('span').addClass('glyphicon glyphicon-remove');

            err_name.attr('data-toggle', 'tooltip');
            err_name.attr('data-placement', 'bottom');
            err_name.attr('title', '');
            err_name.attr('data-original-title', 'Слишком длинная имя. Максимальная длина 20');
            err_name.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else if(name.val().search( /^[a-zа-я\s\-\_]*$/i ) == -1) {
            err_name.css('color', '#ad1616');
            err_name.find('span').removeClass();
            err_name.find('span').addClass('glyphicon glyphicon-remove');

            err_name.attr('data-toggle', 'tooltip');
            err_name.attr('data-placement', 'bottom');
            err_name.attr('title', '');
            err_name.attr('data-original-title', 'Имя не может содержать другие символы, кроме указанных');
            err_name.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else {
            err_name.css('color', '#2c5070');
            err_name.find('span').removeClass();
            err_name.find('span').addClass('glyphicon glyphicon-eye-open');

            err_name.removeAttr('data-toggle');
            err_name.removeAttr('data-placement');
            err_name.removeAttr('title');
            err_name.removeAttr('data-original-title');
            error_name = 0;
        }

        //Validate Email
        if(email.val() == '') {
            err_email.css('color', '#ad1616');
            err_email.find('span').removeClass();
            err_email.find('span').addClass('glyphicon glyphicon-remove');

            err_email.attr('data-toggle', 'tooltip');
            err_email.attr('data-placement', 'bottom');
            err_email.attr('title', '');
            err_email.attr('data-original-title', 'Это поле не может быть пустым');
            err_email.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else if(email.val().search( /^\w+@\w+\.\w{2,4}$/i ) == -1) {
            err_email.css('color', '#ad1616');
            err_email.find('span').removeClass();
            err_email.find('span').addClass('glyphicon glyphicon-remove');

            err_email.attr('data-toggle', 'tooltip');
            err_email.attr('data-placement', 'bottom');
            err_email.attr('title', '');
            err_email.attr('data-original-title', 'Почта введена не правильно');
            err_email.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else {
            err_email.css('color', '#2c5070');
            err_email.find('span').removeClass();
            err_email.find('span').addClass('glyphicon glyphicon-eye-open');

            err_email.removeAttr('data-toggle');
            err_email.removeAttr('data-placement');
            err_email.removeAttr('title');
            err_email.removeAttr('data-original-title');
            error_email = 0;
        }

        //Test
        if(error_pass == 1 || error_pass_ex == 1 || error_name == 1 || error_email == 1) {
            return false;
        }
    }
}
function isValidForm_module(switching) {
    var login = $('#data_login');
    var pass = $('#data_pass');
    var pass_ex = $('#data_pass_ex');
    var name = $('#data_name');
    var email = $('#data_email');
    var err_login = $('#err_login');
    var err_pass = $('#err_pass');
    var err_pass_ex = $('#err_pass_ex');
    var err_name = $('#err_name');
    var err_email = $('#err_email');
    var error_login = 1;
    var error_pass = 1;
    var error_pass_ex = 1;
    var error_name = 1;
    var error_email = 1;

    if(switching == 'add') {
        //Validate Login
        if(login.val() == '') {
            err_login.css('color', '#ad1616');
            err_login.find('span').removeClass();
            err_login.find('span').addClass('glyphicon glyphicon-remove');

            err_login.attr('data-toggle', 'tooltip');
            err_login.attr('data-placement', 'bottom');
            err_login.attr('title', '');
            err_login.attr('data-original-title', 'Это поле не может быть пустым');
            err_login.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else if(login.val().length < 2) {
            err_login.css('color', '#ad1616');
            err_login.find('span').removeClass();
            err_login.find('span').addClass('glyphicon glyphicon-remove');

            err_login.attr('data-toggle', 'tooltip');
            err_login.attr('data-placement', 'bottom');
            err_login.attr('title', '');
            err_login.attr('data-original-title', 'Слишком короткий логин. Минимальная длина 2');
            err_login.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else if(login.val().length > 20) {
            err_login.css('color', '#ad1616');
            err_login.find('span').removeClass();
            err_login.find('span').addClass('glyphicon glyphicon-remove');

            err_login.attr('data-toggle', 'tooltip');
            err_login.attr('data-placement', 'bottom');
            err_login.attr('title', '');
            err_login.attr('data-original-title', 'Слишком длинный  логин. Максимальная длина 20');
            err_login.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else if(login.val().search( /^[\d\w\-\_]*$/i ) == -1) {
            err_login.css('color', '#ad1616');
            err_login.find('span').removeClass();
            err_login.find('span').addClass('glyphicon glyphicon-remove');

            err_login.attr('data-toggle', 'tooltip');
            err_login.attr('data-placement', 'bottom');
            err_login.attr('title', '');
            err_login.attr('data-original-title', 'Логину нельзя вставить другие символы, кроме указанных');
            err_login.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else {
            err_login.css('color', '#2c5070');
            err_login.find('span').removeClass();
            err_login.find('span').addClass('glyphicon glyphicon-eye-open');

            err_login.removeAttr('data-toggle');
            err_login.removeAttr('data-placement');
            err_login.removeAttr('title');
            err_login.removeAttr('data-original-title');
            error_login = 0;
        }

        //Validate Pass
        if(pass.val() == '') {
            err_pass.css('color', '#ad1616');
            err_pass.find('span').removeClass();
            err_pass.find('span').addClass('glyphicon glyphicon-remove');

            err_pass.attr('data-toggle', 'tooltip');
            err_pass.attr('data-placement', 'bottom');
            err_pass.attr('title', '');
            err_pass.attr('data-original-title', 'Пароль не может быть пустым');
            err_pass.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else if(pass.val().length < 4) {
            err_pass.css('color', '#ad1616');
            err_pass.find('span').removeClass();
            err_pass.find('span').addClass('glyphicon glyphicon-remove');

            err_pass.attr('data-toggle', 'tooltip');
            err_pass.attr('data-placement', 'bottom');
            err_pass.attr('title', '');
            err_pass.attr('data-original-title', 'Слишком короткий пароль. Минимальная длина 4');
            err_pass.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else if(pass.val() != pass_ex.val()) {
            err_pass.css('color', '#ad1616');
            err_pass.find('span').removeClass();
            err_pass.find('span').addClass('glyphicon glyphicon-remove');

            err_pass.attr('data-toggle', 'tooltip');
            err_pass.attr('data-placement', 'bottom');
            err_pass.attr('title', '');
            err_pass.attr('data-original-title', 'Пароли не совпадают');
            err_pass.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else {
            err_pass.css('color', '#2c5070');
            err_pass.find('span').removeClass();
            err_pass.find('span').addClass('glyphicon glyphicon-eye-open');

            err_pass.removeAttr('data-toggle');
            err_pass.removeAttr('data-placement');
            err_pass.removeAttr('title');
            err_pass.removeAttr('data-original-title');
            error_pass = 0;
        }

        //Validate Pass_ex
        if(pass_ex.val() == '') {
            err_pass_ex.css('color', '#ad1616');
            err_pass_ex.find('span').removeClass();
            err_pass_ex.find('span').addClass('glyphicon glyphicon-remove');

            err_pass_ex.attr('data-toggle', 'tooltip');
            err_pass_ex.attr('data-placement', 'bottom');
            err_pass_ex.attr('title', '');
            err_pass_ex.attr('data-original-title', 'Повторите пароль');
            err_pass_ex.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else if(pass.val() != pass_ex.val()) {
            err_pass_ex.css('color', '#ad1616');
            err_pass_ex.find('span').removeClass();
            err_pass_ex.find('span').addClass('glyphicon glyphicon-remove');

            err_pass_ex.attr('data-toggle', 'tooltip');
            err_pass_ex.attr('data-placement', 'bottom');
            err_pass_ex.attr('title', '');
            err_pass_ex.attr('data-original-title', 'Пароли не совпадают');
            err_pass_ex.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else {
            err_pass_ex.css('color', '#2c5070');
            err_pass_ex.find('span').removeClass();
            err_pass_ex.find('span').addClass('glyphicon glyphicon-eye-open');

            err_pass_ex.removeAttr('data-toggle');
            err_pass_ex.removeAttr('data-placement');
            err_pass_ex.removeAttr('title');
            err_pass_ex.removeAttr('data-original-title');
            error_pass_ex = 0;
        }

        //Validate Name
        if(name.val() == '') {
            err_name.css('color', '#ad1616');
            err_name.find('span').removeClass();
            err_name.find('span').addClass('glyphicon glyphicon-remove');

            err_name.attr('data-toggle', 'tooltip');
            err_name.attr('data-placement', 'bottom');
            err_name.attr('title', '');
            err_name.attr('data-original-title', 'Это поле не может быть пустым');
            err_name.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else if(name.val().length < 2) {
            err_name.css('color', '#ad1616');
            err_name.find('span').removeClass();
            err_name.find('span').addClass('glyphicon glyphicon-remove');

            err_name.attr('data-toggle', 'tooltip');
            err_name.attr('data-placement', 'bottom');
            err_name.attr('title', '');
            err_name.attr('data-original-title', 'Слишком короткая имя. Минимальная длина 2');
            err_name.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else if(name.val().length > 20) {
            err_name.css('color', '#ad1616');
            err_name.find('span').removeClass();
            err_name.find('span').addClass('glyphicon glyphicon-remove');

            err_name.attr('data-toggle', 'tooltip');
            err_name.attr('data-placement', 'bottom');
            err_name.attr('title', '');
            err_name.attr('data-original-title', 'Слишком длинная имя. Максимальная длина 20');
            err_name.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else if(name.val().search( /^[a-zа-я\s\-\_]*$/i ) == -1) {
            err_name.css('color', '#ad1616');
            err_name.find('span').removeClass();
            err_name.find('span').addClass('glyphicon glyphicon-remove');

            err_name.attr('data-toggle', 'tooltip');
            err_name.attr('data-placement', 'bottom');
            err_name.attr('title', '');
            err_name.attr('data-original-title', 'Имя не может содержать другие символы, кроме указанных');
            err_name.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else {
            err_name.css('color', '#2c5070');
            err_name.find('span').removeClass();
            err_name.find('span').addClass('glyphicon glyphicon-eye-open');

            err_name.removeAttr('data-toggle');
            err_name.removeAttr('data-placement');
            err_name.removeAttr('title');
            err_name.removeAttr('data-original-title');
            error_name = 0;
        }

        //Validate Email
        if(email.val() == '') {
            err_email.css('color', '#ad1616');
            err_email.find('span').removeClass();
            err_email.find('span').addClass('glyphicon glyphicon-remove');

            err_email.attr('data-toggle', 'tooltip');
            err_email.attr('data-placement', 'bottom');
            err_email.attr('title', '');
            err_email.attr('data-original-title', 'Это поле не может быть пустым');
            err_email.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else if(email.val().search( /^\w+@\w+\.\w{2,4}$/i ) == -1) {
            err_email.css('color', '#ad1616');
            err_email.find('span').removeClass();
            err_email.find('span').addClass('glyphicon glyphicon-remove');

            err_email.attr('data-toggle', 'tooltip');
            err_email.attr('data-placement', 'bottom');
            err_email.attr('title', '');
            err_email.attr('data-original-title', 'Почта введена не правильно');
            err_email.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else {
            err_email.css('color', '#2c5070');
            err_email.find('span').removeClass();
            err_email.find('span').addClass('glyphicon glyphicon-eye-open');

            err_email.removeAttr('data-toggle');
            err_email.removeAttr('data-placement');
            err_email.removeAttr('title');
            err_email.removeAttr('data-original-title');
            error_email = 0;
        }

        //Test
        if(error_login == 1 || error_pass == 1 || error_pass_ex == 1 || error_name == 1 || error_email == 1) {
            return false;
        }

    } else if(switching == 'edit') {
        var error_pass = 0;
        var error_pass_ex = 0;

        //Validate Pass
        if(pass.val() != '') {
            console.log('ff');
            if (pass.val().length < 4) {
                err_pass.css('color', '#ad1616');
                err_pass.find('span').removeClass();
                err_pass.find('span').addClass('glyphicon glyphicon-remove');

                err_pass.attr('data-toggle', 'tooltip');
                err_pass.attr('data-placement', 'bottom');
                err_pass.attr('title', '');
                err_pass.attr('data-original-title', 'Слишком короткий пароль. Минимальная длина 4');
                err_pass.tooltip({
                    template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
                });
                error_pass = 1;
            } else if (pass.val() != pass_ex.val()) {
                err_pass.css('color', '#ad1616');
                err_pass.find('span').removeClass();
                err_pass.find('span').addClass('glyphicon glyphicon-remove');

                err_pass.attr('data-toggle', 'tooltip');
                err_pass.attr('data-placement', 'bottom');
                err_pass.attr('title', '');
                err_pass.attr('data-original-title', 'Пароли не совпадают');
                err_pass.tooltip({
                    template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
                });
                error_pass = 1;
            } else {
                err_pass.css('color', '#2c5070');
                err_pass.find('span').removeClass();
                err_pass.find('span').addClass('glyphicon glyphicon-eye-open');

                err_pass.removeAttr('data-toggle');
                err_pass.removeAttr('data-placement');
                err_pass.removeAttr('title');
                err_pass.removeAttr('data-original-title');
            }

            //Validate Pass_ex
            if (pass.val() != pass_ex.val()) {
                err_pass_ex.css('color', '#ad1616');
                err_pass_ex.find('span').removeClass();
                err_pass_ex.find('span').addClass('glyphicon glyphicon-remove');

                err_pass_ex.attr('data-toggle', 'tooltip');
                err_pass_ex.attr('data-placement', 'bottom');
                err_pass_ex.attr('title', '');
                err_pass_ex.attr('data-original-title', 'Пароли не совпадают');
                err_pass_ex.tooltip({
                    template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
                });
                error_pass_ex = 1;
            } else {
                err_pass_ex.css('color', '#2c5070');
                err_pass_ex.find('span').removeClass();
                err_pass_ex.find('span').addClass('glyphicon glyphicon-eye-open');

                err_pass_ex.removeAttr('data-toggle');
                err_pass_ex.removeAttr('data-placement');
                err_pass_ex.removeAttr('title');
                err_pass_ex.removeAttr('data-original-title');
            }
        }

        //Validate Name
        if(name.val() == '') {
            err_name.css('color', '#ad1616');
            err_name.find('span').removeClass();
            err_name.find('span').addClass('glyphicon glyphicon-remove');

            err_name.attr('data-toggle', 'tooltip');
            err_name.attr('data-placement', 'bottom');
            err_name.attr('title', '');
            err_name.attr('data-original-title', 'Это поле не может быть пустым');
            err_name.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else if(name.val().length < 2) {
            err_name.css('color', '#ad1616');
            err_name.find('span').removeClass();
            err_name.find('span').addClass('glyphicon glyphicon-remove');

            err_name.attr('data-toggle', 'tooltip');
            err_name.attr('data-placement', 'bottom');
            err_name.attr('title', '');
            err_name.attr('data-original-title', 'Слишком короткая имя. Минимальная длина 2');
            err_name.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else if(name.val().length > 20) {
            err_name.css('color', '#ad1616');
            err_name.find('span').removeClass();
            err_name.find('span').addClass('glyphicon glyphicon-remove');

            err_name.attr('data-toggle', 'tooltip');
            err_name.attr('data-placement', 'bottom');
            err_name.attr('title', '');
            err_name.attr('data-original-title', 'Слишком длинная имя. Максимальная длина 20');
            err_name.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else if(name.val().search( /^[a-zа-я\s\-\_]*$/i ) == -1) {
            err_name.css('color', '#ad1616');
            err_name.find('span').removeClass();
            err_name.find('span').addClass('glyphicon glyphicon-remove');

            err_name.attr('data-toggle', 'tooltip');
            err_name.attr('data-placement', 'bottom');
            err_name.attr('title', '');
            err_name.attr('data-original-title', 'Имя не может содержать другие символы, кроме указанных');
            err_name.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else {
            err_name.css('color', '#2c5070');
            err_name.find('span').removeClass();
            err_name.find('span').addClass('glyphicon glyphicon-eye-open');

            err_name.removeAttr('data-toggle');
            err_name.removeAttr('data-placement');
            err_name.removeAttr('title');
            err_name.removeAttr('data-original-title');
            error_name = 0;
        }

        //Validate Email
        if(email.val() == '') {
            err_email.css('color', '#ad1616');
            err_email.find('span').removeClass();
            err_email.find('span').addClass('glyphicon glyphicon-remove');

            err_email.attr('data-toggle', 'tooltip');
            err_email.attr('data-placement', 'bottom');
            err_email.attr('title', '');
            err_email.attr('data-original-title', 'Это поле не может быть пустым');
            err_email.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else if(email.val().search( /^\w+@\w+\.\w{2,4}$/i ) == -1) {
            err_email.css('color', '#ad1616');
            err_email.find('span').removeClass();
            err_email.find('span').addClass('glyphicon glyphicon-remove');

            err_email.attr('data-toggle', 'tooltip');
            err_email.attr('data-placement', 'bottom');
            err_email.attr('title', '');
            err_email.attr('data-original-title', 'Почта введена не правильно');
            err_email.tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
            });
        } else {
            err_email.css('color', '#2c5070');
            err_email.find('span').removeClass();
            err_email.find('span').addClass('glyphicon glyphicon-eye-open');

            err_email.removeAttr('data-toggle');
            err_email.removeAttr('data-placement');
            err_email.removeAttr('title');
            err_email.removeAttr('data-original-title');
            error_email = 0;
        }

        //Test
        if(error_pass == 1 || error_pass_ex == 1 || error_name == 1 || error_email == 1) {
            return false;
        }
    }
}
/**/

$(function () {
    $('[data-toggle="tooltip"]').tooltip();
});
