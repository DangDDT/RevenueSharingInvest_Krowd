const APP_VERSION = "v1.0.0";

const LIST_IMAGE_WELCOME_CAROUSEL = [
  "assets/images/welcome_slide_1.png",
  "assets/images/welcome_slide_2.png",
  "assets/images/welcome_slide_3.png",
];

const LIST_SCROLL_ITEM = [
  {
    "vi": [
      "HẤP DẪN",
      "PHỔ BIẾN",
      "MỚI NHẤT",
      "SẮP KẾT THÚC",
    ]
  },
  {
    "en": [
      "HOT",
      "POPULAR",
      "NEWEST",
      "AMOST OVER",
    ]
  }
];

const LIST_TAB_BAR = [
  {
    "vi": [
      "TỔNG QUAN",
      "NỔI BẬT",
      "CHỦ DỰ ÁN",
    ]
  },
  {
    "en": [
      "OVERVIEW",
      "HIGHLIGHT",
      "PROJECT OWNER",
    ]
  },
];

const LIST_CATEGORY_ITEM = [
  {
    "vi": [
      "Được đề xuất cho bạn",
      "Ấm thực",
      "Thời trang",
      "Công nghệ",
      "Du lịch",
      "Giáo dục",
      "Khác"
    ]
  },
  {
    "en": [
      "Suggest for you",
      "Food/Drink",
      "Fashion",
      "Technology",
      "Travel",
      "Education",
      "Other"
    ]
  }
];

const NAV_LIST = [
  {
    "vi": [
      {
        "label": "Đầu tư",
        "activeIcon": "assets/icons/document-normal-solid.png",
        "inActiveIcon": "assets/icons/document-normal.png"
      },
      {
        "label": "Ví của bạn",
        "activeIcon": "assets/icons/wallet-2-solid.png",
        "inActiveIcon": "assets/icons/wallet-2.png"
      },
      {
        "label": "Quản lý",
        "activeIcon": "assets/icons/3dcube_solid.png",
        "inActiveIcon": "assets/icons/3dcube.png",
      },
      // {
      //   "label": "Tin tức",
      //   "activeIcon": "assets/icons/document-text-solid.png",
      //   "inActiveIcon": "assets/icons/document-text.png"
      // },
      {
        "label": "Thông tin",
        "activeIcon": "assets/icons/menu.png",
        "inActiveIcon": "assets/icons/menu.png",
      }
    ]
  },
  {
    "en": [
      {
        "label": "Invest",
        "activeIcon": "assets/icons/document-normal-solid.png",
        "inActiveIcon": "assets/icons/document-normal.png"
      },
      {
        "label": "Wallet",
        "activeIcon": "assets/icons/wallet-2-solid.png",
        "inActiveIcon": "assets/icons/wallet-2.png",
      },
      {
        "label": "Management",
        "activeIcon": "assets/icons/3dcube_solid.png",
        "inActiveIcon": "assets/icons/3dcube.png",
      },
      // {
      //   "label": "News",
      //   "activeIcon": "assets/icons/document-text-solid.png",
      //   "inActiveIcon": "assets/icons/document-text.png"
      // },
      {
        "label": "Menu",
        "activeIcon": "assets/icons/menu.png",
        "inActiveIcon": "assets/icons/menu.png",
      },
    ]
  },
];
const LIST_PROJECT = [
  {
    "id": "P0001",
    "projectImageLink": "assets/images/project_image_demo.png",
    "projectType": "HOT",
    "projectName": "Khu ẩm thực ăn uống phức hợp món việt HCM",
    "projectDescription":
        "Là khu ăn uống tập hợp các quán ăn chất lượng cao, giá thành ổn định bên đường cao tốc số 1 TPHCM",
    "currentInvestMoney": 50000000,
    "neededInvestMoney": 100000000,
    "multiplied": 1.6,
    "term": 48,
    "projectCategory": "Ẩm thực",
    "projectShortenedAddress": "Quận 9, HCM"
  },
  {
    "id": "P0002",
    "projectImageLink": "assets/images/project_image_demo_2.png",
    "projectType": "NEW",
    "projectName": "Khu ẩm thực ăn uống phức hợp món việt HCM",
    "projectDescription":
        "Là khu ăn uống tập hợp các quán ăn chất lượng cao, giá thành ổn định bên đường cao tốc số 1 TPHCM",
    "currentInvestMoney": 50000000,
    "neededInvestMoney": 100000000,
    "multiplied": 1.6,
    "term": 48,
    "projectCategory": "Ẩm thực",
    "projectShortenedAddress": "Quận 9, HCM"
  },
];

const LIST_NEWS = [
  {
    "id": "N01",
    "title": "Tín dụng tăng 5,1%, thanh khoản hệ thống vẫn dồi dào",
    "content":
        "Sáng 21/6, Ngân hàng Nhà nước tổ chức họp báo thông tin kết quả hoạt động ngân hàng 6 tháng đầu năm 2021. Phó Thống đốc Đào Minh Tú cho biết, đến ngày 15/6/2021, tổng phương tiện thanh toán M2 tăng 3,96% so với cuối năm 2020 và tăng 14,27% so với cùng kỳ  năm 2020. “Thanh khoản của hệ thống tổ chức tín dụng thông suốt và vẫn dồi dào. Ngân hàng Nhà nước tiếp tục điều hành nghiệp vụ thị trường mở chủ động, linh hoạt”, ông Tú cho biết.Ông Tú cũng cho biết thêm, trong điều hành tín dụng, Ngân hàng Nhà nước tiếp tục chỉ đạo tăng trưởng tập trung vào các lĩnh vực sản xuất, lĩnh vực ưu tiên; kiểm soát chặt chẽ tín dụng đối với lĩnh vực tiềm ẩn rủi ro; thực hiện các giải pháp tháo gỡ khó khăn trong tiếp cận tín dụng ngân hàng, tạo điều kiện thuận lợi trong vay vốn tín dụng ngân hàng",
    "image": "assets/images/news_demo.png",
    "createAt": "20/11/2020",
  },
  {
    "id": "N02",
    "title": "Tín dụng tăng 5,1%, thanh khoản hệ thống vẫn dồi dào",
    "content":
        "Sáng 21/6, Ngân hàng Nhà nước tổ chức họp báo thông tin kết quả hoạt động ngân hàng 6 tháng đầu năm 2021. Phó Thống đốc Đào Minh Tú cho biết, đến ngày 15/6/2021, tổng phương tiện thanh toán M2 tăng 3,96% so với cuối năm 2020 và tăng 14,27% so với cùng kỳ  năm 2020. “Thanh khoản của hệ thống tổ chức tín dụng thông suốt và vẫn dồi dào. Ngân hàng Nhà nước tiếp tục điều hành nghiệp vụ thị trường mở chủ động, linh hoạt”, ông Tú cho biết.Ông Tú cũng cho biết thêm, trong điều hành tín dụng, Ngân hàng Nhà nước tiếp tục chỉ đạo tăng trưởng tập trung vào các lĩnh vực sản xuất, lĩnh vực ưu tiên; kiểm soát chặt chẽ tín dụng đối với lĩnh vực tiềm ẩn rủi ro; thực hiện các giải pháp tháo gỡ khó khăn trong tiếp cận tín dụng ngân hàng, tạo điều kiện thuận lợi trong vay vốn tín dụng ngân hàng",
    "image": "assets/images/news_demo_1.png",
    "createAt": "20/11/2020",
  },
  {
    "id": "N03",
    "title": "Tín dụng tăng 5,1%, thanh khoản hệ thống vẫn dồi dào",
    "content":
        "Sáng 21/6, Ngân hàng Nhà nước tổ chức họp báo thông tin kết quả hoạt động ngân hàng 6 tháng đầu năm 2021. Phó Thống đốc Đào Minh Tú cho biết, đến ngày 15/6/2021, tổng phương tiện thanh toán M2 tăng 3,96% so với cuối năm 2020 và tăng 14,27% so với cùng kỳ  năm 2020. “Thanh khoản của hệ thống tổ chức tín dụng thông suốt và vẫn dồi dào. Ngân hàng Nhà nước tiếp tục điều hành nghiệp vụ thị trường mở chủ động, linh hoạt”, ông Tú cho biết.Ông Tú cũng cho biết thêm, trong điều hành tín dụng, Ngân hàng Nhà nước tiếp tục chỉ đạo tăng trưởng tập trung vào các lĩnh vực sản xuất, lĩnh vực ưu tiên; kiểm soát chặt chẽ tín dụng đối với lĩnh vực tiềm ẩn rủi ro; thực hiện các giải pháp tháo gỡ khó khăn trong tiếp cận tín dụng ngân hàng, tạo điều kiện thuận lợi trong vay vốn tín dụng ngân hàng",
    "image": "assets/images/news_demo_2.png",
    "createAt": "20/11/2020",
  },
];

// ignore: camel_case_types
enum PROJECT_ROLE { FOUNDER, MEMBER }

const MEMBER_PROJECT_LIST = [
  {
    "memberImageLink": "assets/images/default_woman.png",
    "memberName": "Annette Black",
    "projectRole": PROJECT_ROLE.FOUNDER,
    "memberComment":
        "Lựa chọn được dự án mình yêu thích. Sau đó, chọn mua gói đầu tư phù hợp với tài chính của mình. ",
  },
  {
    "memberImageLink": "assets/images/default_man.png",
    "memberName": "Courtney Henry",
    "projectRole": PROJECT_ROLE.MEMBER,
    "memberComment":
        "Lựa chọn được dự án mình yêu thích. Sau đó, chọn mua gói đầu tư phù hợp với tài chính của mình. ",
  },
  {
    "memberImageLink": "assets/images/default_man.png",
    "memberName": "David Compuson",
    "projectRole": PROJECT_ROLE.MEMBER,
    "memberComment":
        "Lựa chọn được dự án mình yêu thích. Sau đó, chọn mua gói đầu tư phù hợp với tài chính của mình. ",
  },
];
const HIGHLIGHT_PROJECT_LIST = [
  {
    "highlightTitle": "Món ăn ngon",
    "highlightContent":
        "Lựa chọn được dự án mình yêu thích. Sau đó, chọn mua gói đầu tư phù hợp với tài chính của mình. ",
    "highlightImageLink": "assets/images/highlight_image_demo_1.png",
  },
  {
    "highlightTitle": "Món ăn ngon",
    "highlightContent":
        "Lựa chọn được dự án mình yêu thích. Sau đó, chọn mua gói đầu tư phù hợp với tài chính của mình. ",
    "highlightImageLink": "assets/images/highlight_image_demo_2.png",
  },
];
const List<String> TOPUP_VALUE_SUGGESTION = ["200,000", "500,000", "1,000,000"];
