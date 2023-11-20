$(function(){
    // alert("jQuery is working!")

// form validation for comment body
 $('#comment-body').on('input',function(){
    console.log('Input event fired')
    const value = $(this).val().trim();
    const submitButton = $(this).closest('form').find('input[type= "submit"]')

    if (value === ''){
        $(this).css('border-color', 'red');
        submitButton.prop('disabled', true);
    } else {
        $(this).css('border-color', '');
        submitButton.prop('disabled', false);

    }

}); 
//dynamic content loading for comments
$('#load-comments').on('click',function(){
    const url = '/categories/3/articles/18/comments';
    console.log($.getJSON(url));
    $.getJSON(url,function(data){
        console.log(data);

    })
    // console.log($.getJSON(`/categories/${category_id}/articles/${article_id}/comments`));

});

});