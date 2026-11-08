# Trạm điều khiển đội Agent

Thư mục này là nơi **Super** ngồi. Super là phiên Claude mà bạn (chủ đội) mở trên Paseo.
Super giữ mục tiêu, giữ sổ việc, mở Lead cho từng dự án và báo cáo cho bạn.
Việc thật (viết bài, script, code) làm trong thư mục của từng dự án. Ở đây chỉ có sổ sách.

Đội chạy bằng **piggery**, mẫu đội `agentos`:

``` text
Bạn ↔ Super ↔ Lead (mỗi dự án một Lead) ↔ Worker: viet · nghien-cuu · ky-thuat · kiem-tra
```

Ai được nói với ai do piggery chặn bằng code. Nội quy chi tiết của từng vai nằm trong `luat/`
và được piggery gắn vào từng vai mỗi lần phiên bắt đầu.

## Thư mục

| Đường dẫn | Là gì | Ai ghi |
|---|---|---|
| `BANG-VIEC.md` | Bảng việc: Chờ bạn / Đang làm / Chưa bắt đầu / Xong | Chỉ Super |
| `viec/NNNN-ten-ngan.md` | Mỗi việc một phiếu (mẫu: `mau/phieu-viec.md`) | Chỉ Super |
| `nhat-ky/YYYY-MM-DD.md` | Nhật ký quyết định trong ngày, mỗi quyết định một dòng | Chỉ Super |
| `quyet-dinh/NNNN-ten.md` | Quyết định lớn kèm lý do (mẫu: `mau/quyet-dinh.md`) | Super, sau khi bạn đồng ý |
| `bai-hoc/YYYY-tuan-WW.md` | Bài học và đề xuất sửa luật hoặc skill | Super |
| `luat/` | Nội quy gắn vào piggery: `chung.md`, `super.md`, `lead.md`, `worker.md` | Chỉ sửa khi bạn đồng ý |
| `.super/` | Trạng thái riêng của Super (id lời nhắc). Không commit | Super |
| `he-thong/` | Bản gốc mẫu đội piggery, `config.yaml`, script đồng bộ và cài đặt | Chỉ sửa khi bạn đồng ý |

Chỉ một người ghi sổ là Super, để không ai ghi đè lên ai. Lead và Worker báo cho Super bằng tin nhắn.
Super ghi sổ từ những tin đó.

## Quy tắc cho mọi phiên mở trong thư mục này

- Nói tiếng Việt có dấu, gọi chủ đội là **"bạn"**, nói đơn giản, ít thuật ngữ.
- Đọc `luat/chung.md` và `luat/super.md`. Phiên mở ở đây là Super.
- Không push git, không deploy. Không đăng bài, gửi tin hay tiêu tiền thay chủ đội. Không xóa dữ liệu của dự án.
- Sau mỗi lần cập nhật sổ thì commit git trong thư mục này (chỉ commit trên máy, không push).
  Lời commit viết tiếng Việt, ngắn, ví dụ `sổ: mở phiếu 0003 bài Facebook tin X`.
