# AgentOS Starter

Khung do **Giang (GiangxAI)** chia sẻ miễn phí · [giangxai.com](https://giangxai.com) · [YouTube @giangxai.official](https://www.youtube.com/@giangxai.official) · [Facebook GiangxAI101](https://www.facebook.com/GiangxAI101)

Một **đội Agent** chạy trên máy bạn: bạn nói mục tiêu, đội tự chia việc, làm, kiểm,
và chỉ gọi bạn khi cần bạn quyết. Mọi thứ là file và git, không có dịch vụ nào chạy trên mây.

``` text
Bạn ↔ Super ↔ Lead (mỗi dự án một Lead) ↔ Worker: viet · nghien-cuu · ky-thuat · kiem-tra
```

- **Super**: phiên Claude bạn mở, giữ sổ việc, sáng nào cũng hỏi bạn hôm nay làm gì.
- **Lead**: mỗi dự án một Lead, chia việc và chấm bài theo bằng chứng.
- **Worker**: mỗi vai chạy một model riêng. Người kiểm luôn khác model với người viết.

Ai được nói với ai do [piggery](https://github.com/sting8k/piggery) chặn bằng code, Agent không lách được.

## Ghép từ ba nguồn mở

| Nguồn | Lấy gì |
|---|---|
| [piggery](https://github.com/sting8k/piggery) (MIT) | Đường dây giữa các phiên, mẫu đội Super → Lead → Worker, model theo vai, giới hạn, báo khi im lặng |
| [Gangline](https://github.com/ogamic/harness-starter-git-based) (MIT) | Sổ việc bằng file, 4 câu hỏi trước khi tự làm, sổ quyết định, bài học khi đóng việc |
| [pstack](https://github.com/cursor/plugins/tree/main/pstack) (MIT) | "Xong" phải có bằng chứng, người kiểm khác người làm, viết không giọng AI, rút kinh nghiệm hằng tuần |

## Cần có

- macOS hoặc Linux.
- [Claude Code](https://claude.com/product/claude-code) và [Codex](https://github.com/openai/codex), đã đăng nhập.
- [Paseo](https://paseo.sh) để mở phiên Super và lời nhắc buổi sáng.

## Cài đặt

1. Bấm **Use this template** (hoặc clone) rồi đặt thư mục ở nơi bạn muốn làm "trạm", ví dụ `~/Tram-Agent`.
   Tên thư mục là tên đội trong piggery.
2. Chạy `./he-thong/cai-dat.sh`. Script cài piggery (có kiểm checksum), cài piggery vào Claude Code và Codex,
   điền đường dẫn trạm vào nội quy, rồi chép mẫu đội `agentos` sang `~/.piggery`.
3. Mở `he-thong/piggery/config.yaml`:
   - `allowed_roots`: thêm thư mục các dự án mà Lead được vào làm.
   - `roles`: chọn model cho từng vai.

   Sau đó chạy `./he-thong/dong-bo.sh`.
4. Điền `ve-chu-doi.md` (bạn là ai, dự án nào, giọng văn), và một file `tieu-chi/` cho loại bài đầu tiên.
5. Mở Paseo, tạo phiên Claude Opus (Auto mode) trong thư mục trạm, rồi gõ:
   `Bạn là Super. Làm mục "Khi phiên vừa mở" trong luat/super.md.`

## Tuần đầu

- Chỉ giao việc nội bộ: nghiên cứu, viết nháp, kiểm. Đăng bài, gửi tin, push, deploy luôn chờ bạn.
- Worker của piggery chạy lệnh trên máy **không hỏi trước**. Danh sách chặn trong `.claude/settings.json`
  mới chỉ áp cho phiên Super.
- Theo dõi một con số: **số lần bạn phải can thiệp cho mỗi việc**. Con số này phải giảm dần qua từng tuần.

## Trong repo

| Đường dẫn | Là gì |
|---|---|
| `AGENTS.md`, `CLAUDE.md` | Nội quy của trạm. Phiên mở ở đây là Super |
| `luat/` | Nội quy từng vai: `chung.md`, `super.md`, `lead.md`, `worker.md` |
| `mau/`, `tieu-chi/` | Mẫu phiếu việc, mẫu quyết định, định nghĩa hoàn thành |
| `BANG-VIEC.md`, `viec/`, `nhat-ky/`, `quyet-dinh/`, `bai-hoc/` | Sổ việc (Super ghi) |
| `he-thong/` | Mẫu đội piggery `agentos`, `config.yaml`, script cài và đồng bộ |

---

Khung do **Giang (GiangxAI)** chia sẻ miễn phí · [giangxai.com](https://giangxai.com) · [YouTube @giangxai.official](https://www.youtube.com/@giangxai.official) · [Facebook GiangxAI101](https://www.facebook.com/GiangxAI101)

Thấy hữu ích thì ghé kênh YouTube [@giangxai.official](https://www.youtube.com/@giangxai.official) xem cách mình dùng đội Agent mỗi ngày.

Giấy phép MIT, xem `LICENSE`. Ghi công phần mượn: `THIRD_PARTY_NOTICES.md`.
