# Lab 02 – Kiểm thử phần mềm

Bài tập cá nhân Lab 02 về kiểm thử trong quy trình phát triển phần mềm, kiểm thử API với Postman và đặc tả BDD bằng Gherkin.

## Nội dung

- `B02_CaNhan_PhieuTraLoi.docx`: phiếu trả lời các bài 2.1–2.4 và phần chuẩn bị cho buổi 3.
- `Lab02.postman_collection.json`: Postman collection kiểm thử API mẫu JSONPlaceholder.
- `dang-ky-hoc-phan.feature`: các kịch bản Gherkin cho chức năng đăng ký học phần trên EduReg.

## Cách sử dụng

### Postman

1. Mở Postman và import `Lab02.postman_collection.json`.
2. Chạy lần lượt 3 request trong collection.
3. Mở **Test Results** để xem các assertion.

Request thứ hai cố ý giữ các assertion của trường hợp thành công để quan sát kết quả thất bại khi API trả về `404`. Request thứ ba là phiên bản kiểm thử đúng cho trường hợp người dùng không tồn tại.

### Gherkin

Mở `dang-ky-hoc-phan.feature` bằng trình soạn thảo hỗ trợ Cucumber/Gherkin. Đây là đặc tả BDD; để chạy tự động cần bổ sung step definitions và ứng dụng EduReg tương ứng.

## Ghi chú

Các ảnh minh chứng chạy Postman cần được bổ sung từ lần chạy thực tế nếu giảng viên yêu cầu.
