var TableData = function() {
    var e = function() {
            var e = $("#sample_1").dataTable({
                aoColumnDefs: [{
                    bSortable: !1,
                    aTargets: [-1, -2]
                }],
                oLanguage: {
                    sLengthMenu: "Show _MENU_ Rows",
                    sSearch: "",
                    oPaginate: {
                        sPrevious: "",
                        sNext: ""
                    }
                },
                aaSorting: [
                    [1, "asc"]
                ],
                aLengthMenu: [
                    [-1],
                    ["All"]
                ],
                iDisplayLength: -1
            });
            $("#sample_1_wrapper .dataTables_filter input").addClass("form-control input-sm").attr("placeholder", "Search"), $("#sample_1_wrapper .dataTables_length select").addClass("m-wrap small"), $("#sample_1_wrapper .dataTables_length select").select2(), $('#sample_1_column_toggler input[type="checkbox"]').change(function() {
                var a = parseInt($(this).attr("data-column")),
                    t = e.fnSettings().aoColumns[a].bVisible;
                e.fnSetColumnVis(a, t ? !1 : !0)
            })
        },
        a = function() {
            $("#sample_5").dataTable({
                bSort: !1,
                oLanguage: {
                    sLengthMenu: "Show _MENU_ Rows",
                    sSearch: "",
                    oPaginate: {
                        sPrevious: "",
                        sNext: ""
                    }
                },
                aLengthMenu: [
                    [-1],
                    ["All"]
                ],
                iDisplayLength: -1
            });
            $("#sample_5_wrapper .dataTables_filter input").addClass("form-control input-sm").css("width", "300px").attr("placeholder", "Search by name, address, faculty, email etc."), $("#sample_5_wrapper .dataTables_length select").addClass("m-wrap small"), $("#sample_5_wrapper .dataTables_length select").select2()
        },
        t = function() {
            function e(e, a) {
                for (var t = e.fnGetData(a), n = $(">td", a), s = 0, l = n.length; l > s; s++) e.fnUpdate(t[s], a, s, !1);
                e.fnDraw()
            }

            function a(e, a) {
                var t = e.fnGetData(a),
                    n = $(">td", a);
                n[0].innerHTML = '<input type="text" class="form-control" value="' + t[0] + '">', n[1].innerHTML = '<input type="text" class="form-control" value="' + t[1] + '">', n[2].innerHTML = '<a class="save-row" href="">Save</a>', n[3].innerHTML = '<a class="cancel-row" href="">Cancel</a>'
            }

            function t(e, a) {
                var t = $("input", a);
                e.fnUpdate(t[0].value, a, 0, !1), e.fnUpdate(t[1].value, a, 1, !1), e.fnUpdate('<a class="edit-row" href="">Edit</a>', a, 2, !1), e.fnUpdate('<a class="delete-row" href="">Delete</a>', a, 3, !1), e.fnDraw(), n = !1, s = null
            }
            var n = !1,
                s = null;
            $("body").on("click", ".add-row", function(t) {
                if (t.preventDefault(), 0 == n) {
                    s && e(l, s), n = !0;
                    var r = l.fnAddData(["", "", "", "", ""]),
                        o = l.fnGetNodes(r[0]);
                    a(l, o), s = o
                }
            }), $("#sample_2").on("click", ".cancel-row", function(a) {
                if (a.preventDefault(), n) {
                    n = !1, s = null;
                    var t = $(this).parents("tr")[0];
                    l.fnDeleteRow(t)
                } else e(l, s), s = null
            }), $("#sample_2").on("click", ".delete-row", function(e) {
                e.preventDefault(), n && s && (l.fnDeleteRow(s), n = !1);
                var a = $(this).parents("tr")[0];
                bootbox.confirm("Are you sure to delete this row?", function(e) {
                    e && ($.blockUI({
                        message: '<i class="fa fa-spinner fa-spin"></i> Do some ajax to sync with backend...'
                    }), $.mockjax({
                        url: "/tabledata/delete/webservice",
                        dataType: "json",
                        responseTime: 1e3,
                        responseText: {
                            say: "ok"
                        }
                    }), $.ajax({
                        url: "/tabledata/delete/webservice",
                        dataType: "json",
                        success: function(e) {
                            $.unblockUI(), "ok" == e.say && l.fnDeleteRow(a)
                        }
                    }))
                })
            }), $("#sample_2").on("click", ".save-row", function(e) {
                e.preventDefault();
                var a = $(this).parents("tr")[0];
                $.blockUI({
                    message: '<i class="fa fa-spinner fa-spin"></i> Do some ajax to sync with backend...'
                }), $.mockjax({
                    url: "/tabledata/add/webservice",
                    dataType: "json",
                    responseTime: 1e3,
                    responseText: {
                        say: "ok"
                    }
                }), $.ajax({
                    url: "/tabledata/add/webservice",
                    dataType: "json",
                    success: function(e) {
                        $.unblockUI(), "ok" == e.say && t(l, a)
                    }
                })
            }), $("#sample_2").on("click", ".edit-row", function(t) {
                t.preventDefault(), s && (n ? (l.fnDeleteRow(s), n = !1) : e(l, s));
                var r = $(this).parents("tr")[0];
                a(l, r), s = r
            });
            var l = $("#sample_2").dataTable({
                aoColumnDefs: [{
                    aTargets: [0]
                }],
                oLanguage: {
                    sLengthMenu: "Show _MENU_ Rows",
                    sSearch: "",
                    oPaginate: {
                        sPrevious: "",
                        sNext: ""
                    }
                },
                aaSorting: [
                    [1, "asc"]
                ],
                aLengthMenu: [
                    [-1],
                    ["All"]
                ],
                iDisplayLength: -1
            });
            $("#sample_2_wrapper .dataTables_filter input").addClass("form-control input-sm").attr("placeholder", "Search"), $("#sample_2_wrapper .dataTables_length select").addClass("m-wrap small"), $("#sample_2_wrapper .dataTables_length select").select2(), $('#sample_2_column_toggler input[type="checkbox"]').change(function() {
                var e = parseInt($(this).attr("data-column")),
                    a = l.fnSettings().aoColumns[e].bVisible;
                l.fnSetColumnVis(e, a ? !1 : !0)
            })
        };
    return {
        init: function() {
            a(), e(), t()
        }
    }
}();