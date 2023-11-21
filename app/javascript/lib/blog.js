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
    const categoryId = $('#category-id').data ('category');
    const articleId = $('#load-comments').data('article');
    console.log(categoryId)
    const url = `/categories/${categoryId}/articles/${articleId}/comments`;
    console.log($.getJSON(url));
    $.getJSON(url,function(data){
        console.log(data);
        //Append the new comments to the container #comments
        data.forEach(function(comment) {
            $('#comments').append('<div>' + "user " + comment.commenter + '</div>');
            $('#comments').append('<div>' + comment.body + '</div>');
        });
   
      
        


    })
  
    // console.log($.getJSON(`/categories/${category_id}/articles/${article_id}/comments`));
    
      //add .fail callback

    .fail(function(jqXHR, textStatus, errorThrown) {
        console.error("Error fetching comments:", textStatus, errorThrown);
      });

});

});