Feature: Đăng ký học phần trên EduReg
  Là sinh viên, tôi muốn đăng ký học phần đúng quy định để lập kế hoạch học tập.

  Background:
    Given hệ thống EduReg đang trong thời gian mở đăng ký học phần
    And sinh viên đã đăng nhập hợp lệ

  Scenario: Đăng ký thành công khi đủ điều kiện
    Given sinh viên có điểm trung bình tích lũy là 2.8
    And sinh viên đang đăng ký 18 tín chỉ
    And học phần "COMP1307" có 3 tín chỉ, học vào thứ 2 tiết 1 đến 3
    And lớp "COMP1307" còn chỗ
    And sinh viên đã đáp ứng tất cả học phần tiên quyết của "COMP1307"
    And sinh viên không có lớp nào trùng thời khóa biểu với "COMP1307"
    When sinh viên đăng ký học phần "COMP1307"
    Then hệ thống thông báo "Đăng ký thành công"
    And tổng số tín chỉ đã đăng ký là 21

  Scenario Outline: Kiểm tra giới hạn tín chỉ theo học lực
    Given sinh viên có điểm trung bình tích lũy là <gpa>
    And sinh viên đang đăng ký <daDangKy> tín chỉ
    And học phần "COMP1307" có 3 tín chỉ và còn chỗ
    And sinh viên không bị trùng lịch và đã đủ điều kiện tiên quyết
    When sinh viên đăng ký học phần "COMP1307"
    Then tổng tín chỉ dự kiến sau đăng ký là <duKien>
    And hệ thống trả kết quả "<ketQua>"
    And tổng số tín chỉ đã đăng ký sau xử lý là <sauXuLy>

    Examples:
      | gpa | daDangKy | duKien | ketQua                 | sauXuLy |
      | 2.5 | 22       | 25     | Đăng ký thành công     | 25      |
      | 2.5 | 23       | 26     | Vượt giới hạn tín chỉ  | 23      |
      | 1.9 | 11       | 14     | Đăng ký thành công     | 14      |
      | 1.9 | 12       | 15     | Vượt giới hạn tín chỉ  | 12      |

  Scenario: Không thể đăng ký khi chưa đạt học phần tiên quyết
    Given học phần "COMP1011" có 1 tín chỉ và yêu cầu tiên quyết "COMP1001"
    And sinh viên chưa đạt học phần "COMP1001" với điểm D trở lên
    And lớp "COMP1011" còn chỗ và không trùng lịch
    When sinh viên đăng ký học phần "COMP1011"
    Then hệ thống từ chối đăng ký
    And hệ thống thông báo chưa đạt học phần tiên quyết "COMP1001"

  Scenario: Không thể đăng ký lớp học phần trùng lịch
    Given sinh viên đã đăng ký "COMP1307" vào thứ 2 tiết 1 đến 3
    And lớp "MATH1001" học thứ 2 tiết 2 đến 4 và còn chỗ
    And sinh viên đáp ứng các điều kiện đăng ký khác
    When sinh viên đăng ký học phần "MATH1001"
    Then hệ thống từ chối đăng ký
    And hệ thống thông báo "Trùng lịch học"

  Scenario: Không thể đăng ký lớp đã hết chỗ
    Given lớp "COMP1307" đã đủ sĩ số
    And sinh viên đáp ứng các điều kiện đăng ký khác
    When sinh viên đăng ký học phần "COMP1307"
    Then hệ thống từ chối đăng ký
    And hệ thống thông báo "Lớp học phần đã hết chỗ"

  Scenario: Không thể đăng ký ngoài thời gian mở đăng ký
    Given thời gian đăng ký học phần đã kết thúc
    And sinh viên đang ở trang "Đăng ký học phần"
    When sinh viên cố gắng đăng ký học phần "COMP1307"
    Then hệ thống không ghi nhận đăng ký mới
    And hệ thống thông báo "Ngoài thời gian đăng ký"
