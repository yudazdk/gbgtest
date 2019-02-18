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

    $("#wrapper").html(formContent);

    let filesForm = document.getElementById('filesForm');
    filesForm.style.display = 'block';
} 

let createFormBtn = $('#create_form');
createFormBtn.click(function (e) {
    e.preventDefault();

    var numOfFiles = $("#num_files").val();
    if ( numOfFiles > 0 ) {
        renderForm();
    }
});

function doUpload() {
    console.log('do upload');
}

function validateForm() {
    var num_of_uploaded = $("#num_uploaded_files").val();

    let validInput = true;
    $("#error_msg").html('');

    let errorMsg = '';

    for ( i = 1; i <= num_of_uploaded; i++ ) {
        let img_name = $("#img_name" + i);
        console.log(img_name.val());

        if ( !/^[a-zA-Z]+$/.test(img_name.val()) ) {
            errorMsg += '<div class="error-text">Img name ' + i + ' should contain only letters</div>';
            validInput = false;
        }
    }

    $("#error_msg").html(errorMsg);

    return validInput;
}

// Get the modal
var modal = document.getElementById('myModal');

// Get the <span> element that closes the modal
var spanModal = document.getElementsByClassName("close")[0];

// When the user clicks on <span> (x), close the modal
spanModal.onclick = function() {
    modal.style.display = "none";
    $("#modal-error-text").text('');
};

let saveBtn = $('#save-btn');
saveBtn.click(function (e) {
    e.preventDefault();

    if ( !validateForm() ) {
        modal.style.display = "block";
    } else {
        doUpload();
    }
});
