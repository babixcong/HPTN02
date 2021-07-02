<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mt"%>
<mt:layout title="Danh sách vật phẩm">
    <jsp:attribute name="extra_css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">
    </jsp:attribute>
    <jsp:attribute name="content">
        <div class="main-content-inner">
            <div class="row">
               <div class="col-12 mt-5">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="header-title">Danh sách vật phẩm</h4>
                            <div class="data-tables datatable-primary">
                                <table id="table-vp" class="text-center">
                                    <thead class="text-capitalize">
                                        <tr>
                                            <th>STT</th>
                                            <th>Mã vật phẩm</th>
                                            <th>Tên vật phẩm</th>
                                            <th>Hình ảnh</th>
                                            <th>Kích cỡ</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    <c:forEach items="${list}" var="vp" varStatus="loop">
                                        <tr>
                                            <td>${loop.index + 1}</td>
                                            <td>${vp.getMavatpham()}</td>
                                            <td>${vp.getTen()}</td>
                                            <td>
                                                <img src="${vp.getHinhanh()}" onerror="this.src='${pageContext.request.contextPath}/images/default-image.jpg'" width="50" class="img-thumbnail"/>
                                            </td>
                                            <td>${vp.getKichco()}</td>
                                            <td style="width: 300px">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <button type="button" data-value="${vp.getId()}" data-type="VATPHAM" class="btn btn-warning add-to-gift">Thêm vào quà</button>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                        <div class="addtogift modal fade">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title">Điền thông tin</h1>
                                    </div>
                                    <div class="modal-body">
                                        <form role="form" method="post" class="create-stuff" action="">
                                            <div class="form-group">
                                                <label class="control-label">Điểm đổi</label>
                                                <div>
                                                    <input type="text" class="form-control input-lg" name="point" value="">
                                                </div>
                                                <div class="text-danger" id="error-point"></div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label">Số lượng</label>
                                                <div>
                                                    <input type="text" class="form-control input-lg" id="quantity" name="quantity">
                                                </div>
                                                <div class="text-danger" id="error-quantity"></div>
                                            </div>
                                            <div class="form-group">
                                                <div>
                                                    <button type="submit" name="submit" class="btn btn-success">Thêm vào quà</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:attribute>
    <jsp:attribute name="extra_js">
        <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
        <script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
        <script src="assets/js/jquery.validate.min.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.13.0/dist/sweetalert2.all.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $('#table-vp').DataTable( {
                    columnDefs: [ { orderable: false, targets: [5, 3] }],
                });
                
                $('.add-to-gift').on('click', function () {
                    $('.addtogift').modal('show');
                    let id = $(this).data('value');
                    let type = $(this).data('type');
                    $('.addtogift .create-stuff').attr('value', id);
                    $('.addtogift .create-stuff').attr('type', type);
                })
                
                $('.create-stuff').validate({
                    onfocusout: false,
                    onkeyup: false,
                    onclick: false,
                    rules: {
                        "point": {
                            required: true,
                            number: true,
                            min: 0,
                        },
                        "quantity": {
                            required: true,
                            number: true,
                            min: 0,
                        }
                    },
                    messages: {
                        "point": {
                            required: "Bắt buộc nhập nhập điểm đổi",
                            number: "Sai định dạng số",
                            min: "Giá trị phải lớn hơn 0"
                        },
                        "quantity": {
                            required: "Bắt buộc nhập số lượng",
                            number: "Số lượng phải là số nguyên",
                            min: "Giá trị phải lớn hơn 0"
                        }
                    },
                    errorPlacement: function(error, element) {
                        if (element.attr('name') == 'point') {
                            $("#error-point").text($(error).text());
                        } else if (element.attr('name') == 'quantity'){
                            $("#error-quantity").text($(error).text());
                        }
                    }
                });
                
                $('.create-stuff').on('submit', function(event) {
                    event.preventDefault();
                    let id = $(this).attr('value');
                    let type = $(this).attr('type');
                    let point = $('.create-stuff input[name=point]').val();
                    let quantity = $('.create-stuff input[name=quantity]').val();
                    if ($(this).valid()) {
                        $.ajax({
                            type: 'post',
                            url: 'gifts/create.html',
                            mimeType:"text/html; charset=UTF-8",
                            data: {
                                id: id,
                                type: type,
                                point: point,
                                quantity: quantity
                            },
                            dataType : 'json',
                        }).done(function(response) {
                            Swal.fire(response[0]);
                            $('.addtogift').modal('hide');
                        }).fail(function(jqXHR, textStatus, errorThrown) {
                            // If fail
                        });
                    }
                });
                
                $('.addtogift').on('hidden.bs.modal', function () {
                    $(this).find('input').val('').end();
                    $('#error-point').text('');
                    $('#error-quantity').text('');
                });
                
            });
            $(document).ready(function() {
                $('.add-to-cart').on('click', function() {
                    let id = $(this).data('value');
                    let type = $(this).data('type');
                    let code = $(this).data('code');
                    $.ajax({
                        type: 'get',
                        url: 'cart/add.html',
                        mimeType:"text/html; charset=UTF-8",
                        dataType: 'json',
                        data: {
                            id: id,
                            type: type,
                            code: code,
                        }
                    }).done(function(response) {
                        $('#cartNum').html('100');
                        if (response[0] == 200) {
                            Swal.fire(response[1]);
                            $('#cartNum').html(response[2]);
                        }
                    }).fail(function(response) {
                        Swal.fire("Hãy thử lại sau");
                    });
                });
            });
        </script>
    </jsp:attribute>
</mt:layout>
            
