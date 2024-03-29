import 'package:annoty/app/core/utils/file_utils.dart';
import 'package:annoty/app/database/models/resource_model.dart';
import 'package:annoty/app/database/sources/local/objectbox.dart';
import 'package:annoty/app/domain/repositories/resource_repository.dart';
import 'package:annoty/objectbox.g.dart';

class LocalResourceRepository extends ResourceRepository {
  final Box resourceBox = ObjectBoxDB().resourceBox;

  @override
  Future<int> getResourceId(String filePath) async =>
      (await getResource(filePath)).id!;

  Future<ResourceModel> getResource(String filePath) async => await resourceBox
      .query(ResourceModel_.filePath.equals(filePath))
      .build()
      .findFirstAsync();

  Future<List> getAllResource() => resourceBox.getAllAsync();

  @override
  Future deleteResourceModel(String filePath) async {
    // Flog.info(filePath);
    ResourceModel getresource = await getResource(filePath);
    // Flog.info(getresource.name);
    await resourceBox.removeAsync(getresource.id!);
  }

  @override
  Future<int> saveResourceModel(String filePath) async {
    // Flog.info(filePath);
    return await resourceBox.putAsync(ResourceModel(
        name: FileUtils.getFilename(filePath),
        customName: "",
        filePath: filePath,
        createdDate: DateTime.now(),
        modifiedDate: DateTime.now()));
  }

  @override
  Future updateResourceModel(String resourceName) {
    // TODO: implement updateResourceModel
    throw UnimplementedError();
  }
}
