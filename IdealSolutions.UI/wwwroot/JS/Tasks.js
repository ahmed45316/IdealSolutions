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
            "url": `${baseUrl}Tasks/Tasks/GetAll`,
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
            { data: "taskName", autoWidth: true },
            { data: "fullEmployeeName", autoWidth: true },
            {
                data: 'deadlineDate',
                type: 'datetime',
                render: function (data, type, row) { return data ? moment(data).format('dddd DD/MM/YYYY hh:mm a') : ''; }
            },
            //{ data: "deadlineDate", autoWidth: true },
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
        //columnDefs: [{
        //    targets: 3,
        //    render: $.fn.dataTable.render.moment('Do MMM YYYY')
        //}],
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

$(document).ready(function () {
    DrawDataTable();
});