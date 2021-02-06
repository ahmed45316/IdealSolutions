var oTable;
function DrawDataTable() {
    oTable = $('#dataGridView').DataTable({
        "processing": true, // for show progress bar
        "filter": true, // this is for disable filter (search box)
        "orderMulti": false, // for disable multiple column at once
        "language": {
            "loadingRecords": "&nbsp;",
            "sProcessing": "<i class='fas fa-spinner fa-spin' aria-hidden='true'></i>"
        },
        "ajax": {
            "url": `${baseUrl}Employees/Employees/GetAll`,
            "type": "GET",
            "datatype": "json"
        },
        "columns": [
            {
                data: null,
                orderable: false,
                render: function (data, type, row, meta) {
                    return meta.row + meta.settings._iDisplayStart + 1;
                }
            },
            { data: "firstName", autoWidth: true },
            { data: "lastName", autoWidth: true },
            { data: "jobTitle", autoWidth: true },
            { data: "email", autoWidth: true },
            { data: "salary", autoWidth: true },
            {
                data: 'birthDate',
                type: 'date',
                render: function (data, type, row) { return data ? moment(data).format('DD/MM/YYYY') : ''; }
            },
            {
                data: "Id",
                autoWidth: true,
                orderable: false,
                targets: 0,
                render: function (data, type, row) {
                    return '<th><button id="' +
                        row.Id +
                        '" onclick="renderData(this)" type = "button" title="Edit" class="btn green btn-outline btn-sm" data-toggle="modal" data-target="#addeditmodel" > ' +
                        '<i class="fas fa-edit"></i></button > </th>';
                }
            }, {
                data: "Id",
                autoWidth: true,
                orderable: false,
                targets: 0,
                render: function (data, type, row) {
                    return '<th> <button id="' +
                        row.Id +
                        '" onclick="removeData(this)" type = "button" title="Delete" class="btn red btn-outline btn-sm" data-toggle="modal" data-target="#remove-modal" > ' +
                        '<i class="far fa-trash-alt"></i></button ></th>';
                }
            }
        ],
        "initComplete": function () {
            $('[data-toggle="tooltip"]').tooltip();
        },
        "fnDrawCallback": function () {
            if ($(".toggle-demo").length > 0) {
                $('.toggle-demo').bootstrapToggle();
            }
        }
    }).on('draw', function () {
        $('[data-toggle="tooltip"]').tooltip();
    });
}

function cleartxt() {
    $('#popupForm').closest('form').find("input[type=text],input[type=password], textarea").val("");
    $('#hiddenId').val('0');
}
$(document).ready(function () {
    DrawDataTable();
});

$(function () {
    $('#form-submit').attr('disabled', true);
});
function onChange() {
    if ($('#firstname').val() != '' && $('#lastname').val() != '' && $('#jobtitle').val() != '' && $('#email').val() != '') {
        $('#form-submit').attr('disabled', false);
    } else {
        $('#form-submit').attr('disabled', true);
    }
}
$('#form-submit').click(function (e) {
    e.preventDefault();
    $.ajax({
        headers: { 'Content-Type': 'application/json' },
        url: `${baseUrl}Employees/Employees/Add`,
        type: 'post',
        data: $("#popupForm").serialize(),
        dataType: 'json',
        success: function (res) {
            cleartxt();
            alert('تم الحفظ بنجاح');
            $('#addeditmodel').modal('hide');
            oTable.ajax.reload();
        }
    }).done(function () { });
    return false;
});