if (typeof $ != 'function') {
    var $ = jQuery.noConflict();
}

/**
 * This function renders the
 * form dynamically
 */
function renderForm() {
    var formContent = "";
    var numOfFiles = $("#num_files").val();

    formContent += '<input type="hidden" id="num_uploaded_files" name="num_uploaded_files" value="' + numOfFiles + '"/>';
    for (let i = 1; i <= numOfFiles; i++) {
        formContent += '<div class="file_details">';
        formContent += '<div>image name' + i +': <input type="text" id="img_name' + i + '" name="img_name' + i + '"/></div>';
        formContent += '<div>image short description' + i +': <input type="text" maxlength="60" id="img_description' + i + '" name="img_description' + i + '"/></div>';
        formContent += '<div>image file' + i +': <input type="file" id="file_upload' + i + '" name="file_upload' + i + '"/></div>';
        formContent += '</div>';
    }

    formContent += '<button id="save-btn">Save</button>';
    $("#wrapper").html(formContent);
} 

let createFormBtn = $('#create_form');
createFormBtn.click(function (e) {
    e.preventDefault();

    var numOfFiles = $("#num_files").val();
    if ( numOfFiles > 0 ) {
        renderForm();
    }
});


function validateForm() {
    
}

let saveBtn = $('#save-btn');
saveBtn.click(function (e) {
    e.preventDefault();

    if ( !validateForm() ) {
        modal.style.display = "block";
    } else {
        doUpload();
    }
});
