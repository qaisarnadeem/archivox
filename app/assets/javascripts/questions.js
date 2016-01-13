

function handle_vot_up(){

    var parent=$(this).parents('.question');

    if(Cookies.get('q_a_'+$(parent).data().id) ==undefined) {
        Cookies.set('q_a_'+$(parent).data().id, 'done', { expires: 365 });
        $.ajax({url:['/questions/',$(this).attr('question_id'),'/vote_up'].join('')
        });
        set_count(this);
    }else {

    }
}

function  get_count(elem){
    return parseInt($(elem).parents('.question').find('.vote-count').text());
}
function  set_count(elem){
    var parent=$(elem).parents('.question');
    Cookies.set('q_a_'+$(parent).data().id, 'done', { expires: 365 });
    var vote_text=get_count(elem) == 0 ? ' vote' : ' votes';
    parent.find('.vote-count').text(get_count(elem)+1+ vote_text);
    $(parent).removeClass('c_light-gray').addClass('c_dark-gray');

    var elem_to_append_with=$(this).prev();
    var temp_elem=elem;
    var temp_parent=parent;
    while(get_count(elem) > get_count(temp_parent.prev().find('a'))){

        temp_elem=temp_parent.prev().find('a');
        temp_parent=$(temp_elem).parents('.question');
        elem_to_append_with=$(temp_elem).parent();
    }
    if(get_count(elem) > get_count(parent.prev().find('a'))){
        parent.prev().hasClass('question') ? $(parent).slideUp(function(){
            $(this).insertBefore(temp_parent).fadeIn();
        }) : '';

    } else {
        $(parent).css('opacity','0.6');
        $(parent).animate({opacity:1.0},800);
    }


}