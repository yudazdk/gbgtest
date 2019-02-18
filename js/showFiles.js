if (typeof $ != 'function') {
    var $ = jQuery.noConflict();
}

var files = [];

getFiles();

function arrangeFiles() {
    var rows = '';

    files.forEach(function(fileItem, i) {
        var row = '<tr> ';

        row += '<td>' + fileItem.img_name + '</td>'
            + '<td>' +
            '<button onclick=showDeleteModal(' + fileItem.id + ') '
            + 'id="file_' + fileItem.id + '"'
            + 'data-id="' + fileItem.id + '"'
            + '>Delete</button> '
            + '</td>'
            + '</tr>';
        rows += row;
    });

    $( "#table-body" ).html(rows);
}

// Get the modal
var modalDelete = document.getElementById('confirmModal');

// Get the <span> element that closes the modal
var spanDeleteModal = document.getElementById("close_delete");

// When the user clicks on <span> (x), close the modal
spanDeleteModal.onclick = function() {
    modalDelete.style.display = "none";
};

function deleteFile(id) {
    console.log(id);
}

function showDeleteModal(id){
    var id = $("#delete-btn").attr('data-id', id);
    modalDelete.style.display = "block";
}

function getFiles() {
    $.ajax({
        url: "api/getFiles.php",
        method: "GET"
    }).done(function( response ) {
        files = JSON.parse(response);
        arrangeFiles();
    });
}

$(document).ready(function () {
    $('#delete-btn').click( function () {
        var data_id = $(this).attr('data-id');

        modalDelete.style.display = "none";

        deleteFile(data_id);
    });
});