// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require parsley
//= require js.cookie


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
function handle_question_removal(){
        var q_id=$(this).data().id;
        var elem_to_hide=this;
        $.post('/questions/'+q_id.toString()+'/remove',function(data){
            if(data.responce=='SUCCESS'){
                $(elem_to_hide).parents('.question').fadeOut();
            }else if(data.responce=='ERROR') {
                alert(data.message);
            }
        });
}
