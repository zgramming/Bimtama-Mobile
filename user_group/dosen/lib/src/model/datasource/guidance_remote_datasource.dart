// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:core/core.dart';

import '../model/lecture_guidance_detail_model.dart';
import '../model/lecture_guidance_master_outline_model.dart';

class GuidanceRemoteDatasource {
  const GuidanceRemoteDatasource({
    required this.dio,
  });

  final Dio dio;
}

class GuidanceRepository {
  const GuidanceRepository({
    required this.remoteDatasource,
  });

  final GuidanceRemoteDatasource remoteDatasource;
}

// class GuidanceState extends Equatable {}

// class GuidanceNotifier extends StateNotifier<GuidanceState> {
//   final GuidanceRepository repository;
//   GuidanceNotifier({
//     required this.repository,
//   }) : super(const GuidanceState());
// }

final selectedFilterGuidanceState =
    StateProvider((ref) => GuidanceStatus.progress);

final getGuidanceMasterOutline =
    AutoDisposeFutureProvider<LectureGuidanceMasterOutlineModel>(
  (ref) async {
    final dio = ref.watch(dioClient);
    final user = ref.watch(userNotifier).item;

    final request = await dio.get(
      "/dosen/guidance/master-outline-component/${user?.data.id}",
      options: Options(
        headers: {"Authorization": "Bearer ${user?.token}"},
      ),
    );

    final response = LectureGuidanceMasterOutlineModel.fromJson(
      Map<String, dynamic>.from(request.data),
    );

    if (!response.success) {
      throw Exception(response.message);
    }

    return response;
  },
);

final getGuidanceDetailByCodeOutlineComponent = AutoDisposeFutureProviderFamily(
  (ref, codeMasterOutlineComponent) async {
    final dio = ref.watch(dioClient);
    final user = ref.watch(userNotifier).item;
    final userId = user?.data.id;
    final selectedFilter = ref.watch(selectedFilterGuidanceState);

    final request = await dio.get(
      "/dosen/guidance/detail/$userId/code-master-outline-component/$codeMasterOutlineComponent",
      queryParameters: {
        "status": selectedFilter.name,
      },
      options: Options(
        headers: {"Authorization": "Bearer ${user?.token}"},
      ),
    );
    final response = LectureGuidanceDetailDetailModel.fromJson(
      Map.from(request.data),
    );

    if (!response.success) {
      throw Exception(response.message);
    }

    return response;
  },
);
