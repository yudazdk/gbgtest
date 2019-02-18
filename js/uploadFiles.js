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

    formContent += '<div class="form-row">'+
        '<input type="hidden" id="num_uploaded_files" name="num_uploaded_files" value="' + numOfFiles + '"/></div>';

    for (let i = 1; i <= numOfFiles; i++) {
        formContent += '<div class="file_details">';
        formContent += '<div class="form-row"><label>image name ' + i +':</label> <input type="text" class="input-style" id="img_name' + i + '" name="img_name' + i + '"/></div>';
        formContent += '<div class="form-row"><label>image description ' + i +':</label> <input type="text" class="input-style" maxlength="60" id="img_description' + i + '" name="img_description' + i + '"/></div>';
        formContent += '<div class="form-row"><label>image file ' + i +':</label> <input type="file" id="file_upload' + i + '" name="file_upload' + i + '"/></div>';
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
    var form_data = new FormData();
    var num_of_uploaded = $("#num_uploaded_files").val();

    form_data.append("num_of_uploaded", num_of_uploaded);

    for ( let i = 1; i <= num_of_uploaded; i++) {
        let file_data = $("#file_upload" + i).prop("files")[0];

        form_data.append("file_upload" + i, file_data);
        form_data.append("img_name" + i, $("#img_name" + i).val());
        form_data.append("img_description" + i, $("#img_description" + i).val());
    }

    $.ajax({
        url: "api/upload.php",
        data: form_data,
        type: 'post',
        contentType: false,
        cache: false,
        processData: false,
        success: function(){
            $("#wrapper").html('');

            let filesForm = document.getElementById('filesForm');
            filesForm.style.display = 'none';
        },
        error: function (jqXHR, textStatus, errorThrown) {
            errorMessage = jqXHR.responseText;
            console.log(errorMessage);
        }
    });
}

function validateForm() {
    const max_file_size = 200 * 1024;
    var num_of_uploaded = $("#num_uploaded_files").val();

    let validInput = true;
    $("#error_msg").html('');

    let errorMsg = '';

    for ( i = 1; i <= num_of_uploaded; i++ ) {
        let img_name = $("#img_name" + i);

        if ( !/^[a-zA-Z]+$/.test(img_name.val()) ) {
            errorMsg += '<div class="error-text">Img name ' + i + ' should contain only letters</div>';
            validInput = false;
        }

        let fileInput = document.getElementById('file_upload' + i);
        let filePath = fileInput.value;
        let allowedExtensions = /(\.jpg)$/i;
        let file_data = $("#file_upload" + i).prop("files")[0];

        if(!allowedExtensions.exec(filePath)) {
            errorMsg += '<div class="error-text">Illegal extension for file ' + i + '</div>';
            validInput = false;
        }

        if ( file_data.size > max_file_size ) {
            errorMsg += '<div class="error-text">file ' + i + ' exceeds ' + max_file_size + '</div>';
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
