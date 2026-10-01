import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:f2_layout/main.dart';

void main() {
  testWidgets('Kiểm tra giao diện đăng nhập Lab F2', (WidgetTester tester) async {
    // Thiết lập kích thước phù hợp với font Ahem của test runner
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    // Xây dựng app và kích hoạt frame
    await tester.pumpWidget(const MyApp());

    // Kiểm tra tiêu đề form đăng nhập
    expect(find.text('Đăng nhập hệ thống'), findsOneWidget);
    expect(find.text('Nhập MSSV và mật khẩu để tiếp tục'), findsOneWidget);

    // Kiểm tra thông tin sinh viên hiển thị trong ProfileCard
    expect(find.text('Bùi Quang Duy'), findsOneWidget);
    expect(find.text('MSSV: 231A290127'), findsOneWidget);
    expect(find.text('CNTT - LTDD'), findsOneWidget);
    expect(find.text('DUY231A290127@st.vhu.edu.vn'), findsOneWidget);

    // Kiểm tra bấm nút ĐĂNG NHẬP hiển thị SnackBar
    final loginButton = find.widgetWithText(FilledButton, 'ĐĂNG NHẬP');
    expect(loginButton, findsOneWidget);
    await tester.tap(loginButton);
    await tester.pump(); // trigger frame cho SnackBar

    expect(find.text('Đăng nhập (mô phỏng) thành công'), findsOneWidget);
  });

  testWidgets('Kiểm tra bố cục thích ứng LayoutBuilder', (WidgetTester tester) async {
    // 1. Màn hình hẹp (dọc < 700)
    tester.view.physicalSize = const Size(600, 1200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());
    expect(find.byType(ProfileCard), findsOneWidget);

    // 2. Màn hình rộng (ngang >= 700)
    tester.view.physicalSize = const Size(1200, 800);
    await tester.pump();
    expect(find.byType(ProfileCard), findsOneWidget);
  });
}
