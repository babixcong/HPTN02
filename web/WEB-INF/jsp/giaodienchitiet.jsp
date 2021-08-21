<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mt"%>
<mt:layout title="Đặt sân chi tiết">
    <jsp:attribute name="extra_css">
        <link rel="stylesheet" href="assets/css/main.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">
    </jsp:attribute>
    <jsp:attribute name="content">
        <div class="main-content-inner">
            <div class="col-md-12">
                <c:if test="${sessionScope.checkinHour != null}">
                    <input type="hidden" id="sCheckinHour" value="${sessionScope.checkinHour}" />
                </c:if>
                <c:if test="${sessionScope.checkoutHour != null}">
                    <input type="hidden" id="sCheckoutHour" value="${sessionScope.checkoutHour}" />
                </c:if>
                <c:if test="${sessionScope.checkinDate != null}">
                    <input type="hidden" id="sCheckinDate" value="${sessionScope.checkinDate}" />
                </c:if>
                <c:if test="${sessionScope.checkoutDate != null}">
                    <input type="hidden" id="sCheckoutDate" value="${sessionScope.checkoutDate}" />
                </c:if>
                <form class="form-horizontal dailyaspirants-login-page lg-container" role="form" action="#" method="post">
                    <c:if test="${sessionScope.KhachHang != null}">
                    <div class="form-inner">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">		          	
                                    <label for="Họ" class="control-label">Họ</label>
                                    <input type="text" class="form-control" id="first_name" placeholder="Họ" disabled=""
                                        value="${sessionScope.KhachHang.getHoten()}"
                                    >		            		            		            
                                </div>
                                <div class="col-md-6">		          	
                                    <label for="Họ" class="control-label">CMT</label>
                                    <input type="text" class="form-control" id="first_name" placeholder="CMT" disabled=""
                                        value="${sessionScope.KhachHang.getCmt()}"
                                    >		            		            		            
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">		          	
                                    <label for="email" class="control-label">Email</label>
                                    <input type="email" class="form-control" id="email" placeholder="Email" disabled=""
                                    value="${sessionScope.KhachHang.getEmail()}"       
                                    >		            		            		            
                                </div>
                                <div class="col-md-6">		          	
                                    <label for="phone" class="control-label">Điện thoại</label>
                                    <input type="email" class="form-control" id="email" placeholder="Số điện thoại" disabled=""
                                        value="${sessionScope.KhachHang.getSdt()}"
                                   >		            		            		            
                                </div> 
                            </div>
                        </div>
                    </div>
                    </c:if>
                    
                    <c:if test="${sessionScope.KhachHang == null}">
                        Chưa chọn khách hàng
                    </c:if>
                </form>
            </div>
            <div class="data-tables datatable-primary">
                <form>
                    <table id="table-ve" class="text-center">
                        <thead class="text-capitalize">
                            <tr>
                                <th>STT</th>
                                <th>Mã sân</th>
                                <th>Tên sân</th>
                                <th>Loại sân</th>
                                <th>Giờ bắt đầu</th>
                                <th>Giờ kết thúc</th>
                                <th>Ngày bắt đầu</th>
                                <th>Ngày kết thúc</th>
                                <th>Đơn giá</th>
                                <th>Tạm tính</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>
                        <c:forEach var="item" items="${sessionScope.listSan}" varStatus="loop">
                            <tr id="r-${loop.index + 1}">
                                <td class="text-center">${loop.index +  1}</td>
                                <td class="text-left">${item.value.getMaSan()}</td>
                                <td>${item.value.getTen()}</td>
                                <td>${item.value.getLoaisan()}</td>
                                <input type="hidden" value="${item.value.getMaSan()}" name="code[]" />
                                <td><input name="checkinHour[]" id="checkinHour-${item.value.getMaSan()}" type="time" value="${tempList[item.value.getMaSan()][0]}" /></td>
                                <td><input name="checkoutHour[]" id="checkoutHour-${item.value.getMaSan()}" value="${tempList[item.value.getMaSan()][1]}" type="time" /></td>
                                <td><input name="checkinDate[]" id="checkinDate-${item.value.getMaSan()}" value="${tempList[item.value.getMaSan()][2]}" type="date" /></td>
                                <td><input name="checkoutDate[]" id="checkoutDate-${item.value.getMaSan()}" value="${tempList[item.value.getMaSan()][3]}" type="date" /></td>
                                <input type="hidden" id="gia-${item.value.getMaSan()}" value="${item.value.getGiathue()}" />
                                <td id="thue-${item.value.getMaSan()}">
                                    <span class="number priceformat">${item.value.getGiathue()} đ</span>
                                </td>
                                <td id="temp-${item.value.getMaSan()}">
                                    <span class="number tamtinh">${tempList[item.value.getMaSan()][4]} đ</span>
                                </td>
                                <td>   
                                    <button type="button" data-code="${item.value.getMaSan()}"  class="btn btn-success save" data-value="${loop.index + 1}">Lưu</button>
                                    <button type="button" data-code="${item.value.getMaSan()}"  class="btn btn-danger remove-item" data-value="${loop.index + 1}">Xóa</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </form>
            </div>
            <div class="col-12">
                <form class="form-horizontal dailyaspirants-login-page lg-container" role="form" action="#" method="post">
                    <div class="form-inner">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-3">		          	
                                    <label class="control-label">Tổng tiền</label>
                                    <input type="text" id="tongtien" disabled="" val="${sessionScope.tongtien}" placeholder="${sessionScope.tongtien} đ" />
                                </div>
                                <div class="col-3">		          	
                                    <label class="control-label">Tiền cọc (10%)</label>
                                    <input type="text" id="tiencoc" disabled="" val="${sessionScope.tiencoc}" placeholder="${sessionScope.tiencoc} đ" />	            		            		            
                                </div>
                                <div class="col-6">
                                    <c:if test="${sessionScope.KhachHang != null && sessionScope.listSan.size() != 0}">
                                        <button class="btn btn-success" id="xac-nhan" style="color: white" >Xác nhận</button>
                                    </c:if>       		            		            
                                </div> 
                            </div>
                        </div>
                    </div>				    	
                </form>	  
            </div>
        </div>
    </jsp:attribute>
    <jsp:attribute name="extra_js">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
        <script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.13.0/dist/sweetalert2.all.min.js"></script>
        
        <script type="text/javascript">
            $(document).ready(function() {
                var tongtien = 0;
                var tiencoc = 0;
                
                $('#table-ve').DataTable( {
                    "searching": false,
                    "lengthChange": false,
                    "paging":   false,
                    "ordering": false,
                });
                
                $('.remove-item').on('click', function() {
                    let index = $(this).data('value');
                    let code = $(this).data('code');
                    let row = '#r-' + index;
                    $.ajax({
                        type: 'post',
                        url: 'booking/remove.html',
                        mimeType:'text/html; charset=UTF-8',
                        dataType: 'json',
                        data: {
                            ma: code
                        }
                    }).done(function(response) {
                        let tien = $('#temp-' + code).data('value');
                        
                        let coc = number_format(parseFloat(response[2], 10), 1, '.', ',');
                        let tong = number_format(parseFloat(response[1], 10), 1, '.', ',');
                        $('#tongtien').val(tong + " đ");
                        $('#tongtien').attr("data-value", response[1]);

                        $('#tiencoc').val(coc + " đ");
                        $('#tiencoc').attr("data-value", response[2]);
                        $(row).remove();
                        if (response[3] == 0) {
                            $('#xac-nhan').remove();
                        }
                    }).fail(function(jqXHR, textStatus, errorThrown) {
                        // If fail
                    });
                });
                
                $('.save').on('click', function () {
                    let code = $(this).data('code');
                    let checkinHour = $('#checkinHour-' + code).val();
                    let checkoutHour = $('#checkoutHour-' + code).val();
                    let checkinDate = $('#checkinDate-' + code).val();
                    let checkoutDate = $('#checkoutDate-' + code).val();
                    
                    let scheckinHour = $('#sCheckinHour').val();
                    let scheckoutHour = $('#sCheckoutHour').val();
                    let scheckinDate = $('#sCheckinDate').val();
                    let scheckoutDate = $('#sCheckoutDate').val();
                    
                    if (checkinDate < scheckinDate || checkoutDate > scheckoutDate) {
                        alert("Ngày không phù hợp");
                        return;
                    } else {
                        if (checkinHour < scheckinHour || checkoutHour > scheckoutHour) {
                            alert("Thời gian không phù hợp");
                            return;
                        }
                    }
                    
                    
                    
                    let giathue = $('#gia-' + code).val();
                    if (checkinDate == '' || checkoutDate == '') {
                        alert("Ngày không phù hợp");
                        return;
                    }
                    
                    if (checkinHour == '' || checkoutHour == '') {
                        alert("Thời gian không phù hợp");
                        return;
                    }
                    if (checkinDate > checkoutDate) {
                        alert("Ngày không phù hợp");
                        return;
                    } else {
                        if (checkinHour >= checkoutHour) {
                            alert("Thời gian không phù hợp");
                            return;
                        }
                    }
                    
                    let abc = diff(checkinHour, checkoutHour);
                    let totalHours = abc.split(":")[0];
                    totalHours = Math.abs(totalHours);
                    
                    let initialDateFormat = moment(checkinDate);
                    let endDateFormat = moment(checkoutDate);
                    let totalDates = endDateFormat.diff(initialDateFormat, "days");
                    
                    let tamtinh = totalHours * giathue * (totalDates + 1)
                    $('#temp-' + code).attr('data-value', tamtinh);
                    
                    tamtinhFormat = number_format(tamtinh, 1, '.', ',');
                    $('#temp-' + code).find('span').html(tamtinhFormat + " đ");
                    
                    
                    $.ajax({
                        type: "post",
                        url: "booking/temp-save.html",
                        dataType: "json",
                        data: {
                            checkinTime: checkinHour,
                            checkoutTime: checkoutHour,
                            checkinDate: checkinDate,
                            checkoutDate: checkoutDate,
                            tamtinh: tamtinh,
                            code: code
                        }
                    }).done(function(response) {
                        if (response[2] == 200) {
                            let coc = number_format(parseFloat(response[1], 10), 1, '.', ',');
                            let tong = number_format(parseFloat(response[0], 10), 1, '.', ',');
                            $('#tongtien').val(tong + " đ");
                            $('#tongtien').attr("data-value", tong);

                            $('#tiencoc').val(coc + " đ");
                            $('#tiencoc').attr("data-value", coc);
                        }
                    }).fail(function(xqHRX, textStatus, error) {
                        console.log(textStatus)
                    });
                });
                
                function diff(start, end) {
                    start = start.split(":");
                    end = end.split(":");
                    var startDate = new Date(0, 0, 0, start[0], start[1], 0);
                    var endDate = new Date(0, 0, 0, end[0], end[1], 0);
                    var diff = endDate.getTime() - startDate.getTime();
                    var hours = Math.floor(diff / 1000 / 60 / 60);
                    diff -= hours * 1000 * 60 * 60;
                    var minutes = Math.floor(diff / 1000 / 60);

                    return hours + ":" + (minutes < 9 ? "0" : "") + minutes;
                }
                
                $('.number').text(function () { 
                    var str = $(this).html() + ''; 
                    x = str.split('.'); 
                    x1 = x[0]; x2 = x.length > 1 ? '.' + x[1] : ''; 
                    var rgx = /(\d+)(\d{3})/; 
                    while (rgx.test(x1)) { 
                        x1 = x1.replace(rgx, '$1' + ',' + '$2'); 
                    } 
                    $(this).html(x1 + x2); 
                });
                
                number_format = function (number, decimals, dec_point, thousands_sep) {
                    number = number.toFixed(decimals);

                    var nstr = number.toString();
                    nstr += '';
                    x = nstr.split('.');
                    x1 = x[0];
                    x2 = x.length > 1 ? dec_point + x[1] : '';
                    var rgx = /(\d+)(\d{3})/;

                    while (rgx.test(x1))
                        x1 = x1.replace(rgx, '$1' + thousands_sep + '$2');

                    return x1 + x2;
                }
                
                $('#xac-nhan').on('click', function(event) {
                    event.preventDefault();
                    let checkinHour = $('input[name="checkinHour[]"]').map(function(i, el) {
                        return el.value;
                    }).get();
                    
                    let checkoutHour = $('input[name="checkoutHour[]"]').map(function(i, el) {
                        return el.value;
                    }).get();
                    
                    let checkinDate = $('input[name="checkinDate[]"]').map(function(i, el) {
                        return el.value;
                    }).get();
                    
                    let checkoutDate = $('input[name="checkoutDate[]"]').map(function(i, el) {
                        return el.value;
                    }).get();
                    
                    let code = $('input[name="code[]"]').map(function(i, el) {
                        return el.value;
                    }).get();
                    
                    $.ajax({
                        type: "post",
                        dataType: "json",
                        url: "bill/store.html",
                        data:{
                            'checkinHour[]': checkinHour,
                            'checkoutHour[]': checkoutHour,
                            'checkinDate[]': checkinDate,
                            'checkoutDate[]': checkoutDate,
                            'code[]': code
                        }
                    }).done(function(response) {
                        window.location.href = "bill/detail.html?id=" + response[0];
                        
                    }).fail(function(xqXHR, textError, errorThrown) {
                        
                    });
                })
            });
        </script>
    </jsp:attribute>
</mt:layout>
            