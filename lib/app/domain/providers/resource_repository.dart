
abstract class ResourceRepository {
  Future getResourceId(String filePath);
  Future saveResourceModel(String filePath);
  Future deleteResourceModel(String filePath);
  Future updateResourceModel(String resourceName);
}
