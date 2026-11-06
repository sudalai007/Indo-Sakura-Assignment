import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indo_sakura_assignment/features/playlists/domain/entities/playlist_entity.dart';
import 'package:indo_sakura_assignment/features/playlists/presentation/widgets/playlist_item_card.dart';

void main() {
  testWidgets('PlaylistItemCard smoke test', (WidgetTester tester) async {
    const mockPlaylist = PlaylistEntity(
      id: 'pl_1',
      code: 'TH-01',
      title: 'Daily Twin Hearts Routine',
      meta: 'Morning • 42 mins',
      subtitle: 'Physical Exercises, Meditation & Blessings',
    );

    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: PlaylistItemCard(playlist: mockPlaylist),
          ),
        ),
      ),
    );

    expect(find.text('Daily Twin Hearts Routine'), findsOneWidget);
    expect(find.text('TH-01'), findsOneWidget);
    expect(find.text('Morning • 42 mins'), findsOneWidget);
  });
}
