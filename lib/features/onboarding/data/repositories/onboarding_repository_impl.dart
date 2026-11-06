import '../../../../core/services/local_storage_service.dart';
import '../../domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  @override
  Future<bool> isOnboardingCompleted() async {
    final storage = await LocalStorageService.getInstance();
    return storage.isOnboardingCompleted();
  }

  @override
  Future<void> completeOnboarding() async {
    final storage = await LocalStorageService.getInstance();
    await storage.setOnboardingCompleted(true);
  }
}

